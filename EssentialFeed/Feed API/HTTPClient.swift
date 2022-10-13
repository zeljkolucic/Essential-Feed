//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Zeljko Lucic on 14.10.22..
//

import Foundation

public typealias HTTPClientResult = Result<(Data, HTTPURLResponse), Error>

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
