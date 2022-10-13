//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Zeljko Lucic on 13.10.22..
//

import Foundation

typealias LoadFeedResult = Result<[FeedItem], Error>

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
