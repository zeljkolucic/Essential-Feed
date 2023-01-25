//
//  LoaderStub.swift
//  EssentialAppTests
//
//  Created by Zeljko Lucic on 25.1.23..
//

import Foundation
import EssentialFeed

class FeedLoaderStub: FeedLoader {
    let result: FeedLoader.Result
    
    init(result: FeedLoader.Result) {
        self.result = result
    }
    
    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}
