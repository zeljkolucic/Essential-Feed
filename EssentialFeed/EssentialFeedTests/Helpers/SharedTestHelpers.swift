//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Zeljko Lucic on 27.10.22..
//

import Foundation

func anyNSError() -> NSError {
    NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    URL(string: "http://any-url.com")!
}

func anyData() -> Data {
    return Data("any data".utf8)
}
