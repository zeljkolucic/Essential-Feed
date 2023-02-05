//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by Zeljko Lucic on 23.1.23..
//

import Foundation

public protocol FeedImageView {
    associatedtype Image
    
    func display(_ model: FeedImageViewModel)
}

public final class FeedImagePresenter {
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location)
    }
}
