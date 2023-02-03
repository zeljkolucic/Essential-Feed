//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Zeljko Lucic on 13.10.22..
//

import Foundation

public typealias RemoteFeedLoader = RemoteLoader<[FeedImage]>

public extension RemoteFeedLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: FeedItemsMapper.map)
    }
}
