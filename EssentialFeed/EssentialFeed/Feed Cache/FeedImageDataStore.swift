//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Zeljko Lucic on 24.1.23..
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>
    
    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
