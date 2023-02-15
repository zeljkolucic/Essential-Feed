//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Zeljko Lucic on 7.11.22..
//

import Foundation

public protocol FeedImageDataLoaderTask {
    func cancel()
}

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
