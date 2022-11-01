//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Zeljko Lucic on 13.10.22..
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    func load(completion: @escaping (Result) -> Void)
}
