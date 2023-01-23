//
//  FeedViewController+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Zeljko Lucic on 23.1.23..
//

import UIKit
import EssentialFeediOS

extension FeedViewController {
    func simulateUserInitiatedFeedReload() {
        refreshControl?.simulatePullToRefresh()
    }
    
    @discardableResult
    func simulateFeedImageViewVisible(at index: Int) -> FeedImageCell? {
        return feedImageView(at: index) as? FeedImageCell
    }
    
    @discardableResult
    func simulateFeedImageViewNotVisible(at row: Int) -> FeedImageCell? {
        let view = simulateFeedImageViewVisible(at: row)
        
        let delegate = tableView.delegate
        let indexPath = IndexPath(row: row, section: feedImagesSection)
        delegate?.tableView?(tableView, didEndDisplaying: view!, forRowAt: indexPath)
        
        return view
    }
    
    func simulateFeedImageViewNearVisible(at row: Int) {
        let dataSource = tableView.prefetchDataSource
        let indexPath = IndexPath(row: row, section: feedImagesSection)
        dataSource?.tableView(tableView, prefetchRowsAt: [indexPath])
    }
    
    func simulateFeedImageViewNotNearVisible(at row: Int) {
        simulateFeedImageViewNearVisible(at: row)
        
        let dataSource = tableView.prefetchDataSource
        let indexPath = IndexPath(row: row, section: feedImagesSection)
        dataSource?.tableView?(tableView, cancelPrefetchingForRowsAt: [indexPath])
    }
    
    var isShowingLoadingIndicator: Bool {
        return refreshControl?.isRefreshing == true
    }
    
    func numberOfRenderedFeedImageViews() -> Int {
        return tableView.numberOfRows(inSection: feedImagesSection)
    }
    
    func feedImageView(at row: Int) -> UITableViewCell? {
        let dataSource = tableView.dataSource
        let indexPath = IndexPath(row: row, section: feedImagesSection)
        return dataSource?.tableView(tableView, cellForRowAt: indexPath)
    }
    
    var errorMessage: String? {
        return errorView.message
    }
    
    private var feedImagesSection: Int {
        return 0
    }
}
