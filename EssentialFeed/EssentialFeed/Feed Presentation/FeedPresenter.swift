//
//  FeedPresenter.swift
//  EssentialFeed
//
//  Created by Zeljko Lucic on 23.1.23..
//

import Foundation

public protocol FeedView {
    func display(_ viewModel: FeedViewModel)
}



public final class FeedPresenter {
    private let feedView: FeedView
    private let loadingView: ResourceLoadingView
    private let errorView: ResourceErrorView
    
    public init(feedView: FeedView, loadingView: ResourceLoadingView, errorView: ResourceErrorView) {
        self.feedView = feedView
        self.loadingView = loadingView
        self.errorView = errorView
    }
    
    public static var title: String {
        return NSLocalizedString(
            "FEED_VIEW_TITLE",
            tableName: "Feed",
            bundle: Bundle(for: FeedPresenter.self),
            comment: "Title fir the feed view")
    }
    
    private var feedLoadError: String {
        return NSLocalizedString(
            "GENERIC_CONNECTION_ERROR",
            tableName: "Shared",
            bundle: Bundle(for: FeedPresenter.self),
            comment: "Error message displayed when we can't load the image feed from the server")
    }
    
    public func didStartLoadingFeed() {
        errorView.display(ResourceErrorViewModel(message: .none))
        loadingView.display(ResourceLoadingViewModel(isLoading: true))
    }
    
    public func didFinishLoadingFeed(with feed: [FeedImage]) {
        loadingView.display(ResourceLoadingViewModel(isLoading: false))
        feedView.display(FeedViewModel(feed: feed))
    }
    
    public func didFinishLoadingFeed(with error: Error) {
        loadingView.display(ResourceLoadingViewModel(isLoading: false))
        errorView.display(ResourceErrorViewModel(message: feedLoadError))
    }
}
