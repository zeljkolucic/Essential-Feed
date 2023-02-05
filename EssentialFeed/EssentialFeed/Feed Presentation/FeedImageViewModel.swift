//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Zeljko Lucic on 23.1.23..
//

import Foundation

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?
    
    public var hasLocation: Bool {
        return location != nil
    }
}
