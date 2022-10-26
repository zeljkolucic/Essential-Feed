//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Zeljko Lucic on 13.10.22..
//

import Foundation

protocol FeedLoader {
    associatedtype Error: Swift.Error
    func load(completion: @escaping (Result<[FeedImage], Error>) -> Void)
}
