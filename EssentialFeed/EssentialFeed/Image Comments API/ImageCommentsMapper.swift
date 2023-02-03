//
//  ImageCommentsMapper.swift
//  EssentialFeed
//
//  Created by Zeljko Lucic on 3.2.23..
//

import Foundation

public final class ImageCommentsMapper {
    private struct Root: Decodable {
        private let items: [Item]
        
        private struct Item: Decodable {
            let id: UUID
            let message: String
            let createdAt: Date
            let author: Author
            
            enum CodingKeys: String, CodingKey {
                case id = "id"
                case message = "message"
                case createdAt = "created_at"
                case author = "author"
            }
        }
        
        private struct Author: Decodable {
            let username: String
        }
        
        var comments: [ImageComment] {
            items.map { ImageComment(id: $0.id, message: $0.message, createdAt: $0.createdAt, username: $0.author.username) }
        }
    }
    
    public static func map(_ data: Data, from response: HTTPURLResponse) throws -> [ImageComment] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        guard isOK(response), let root = try? decoder.decode(Root.self, from: data) else {
            throw RemoteImageCommentsLoader.Error.invalidData
        }
        
        return root.comments
    }
    
    private static func isOK(_ response: HTTPURLResponse) -> Bool {
        (200...299).contains(response.statusCode)
    }
}
