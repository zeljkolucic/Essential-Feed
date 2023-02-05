//
//  FeedLoaderPresentationAdapter.swift
//  EssentialFeediOS
//
//  Created by Zeljko Lucic on 9.11.22..
//

import Combine
import EssentialFeed
import EssentialFeediOS

final class LoadResourcePresentationAdapter<Resource, View: ResourceView> {
    private let feedLoader: () -> AnyPublisher<Resource, Error>
    private var cancellable: Cancellable?
    var presenter: LoadResourcePresenter<Resource, View>?
    
    init(loader: @escaping () -> AnyPublisher<Resource, Error>) {
        self.feedLoader = loader
    }
    
    func loadResource() {
        presenter?.didStartLoading()
        
        cancellable = feedLoader().sink(
            receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished: break
                    
                case let .failure(error):
                    self?.presenter?.didFinishLoading(with: error)
                }
            }, receiveValue: { [weak self] feed in
                self?.presenter?.didFinishLoading(with: feed)
            })
    }
}

extension LoadResourcePresentationAdapter: FeedViewControllerDelegate {
    func didRequestFeedRefresh() {
        loadResource()
    }
}

extension LoadResourcePresentationAdapter: FeedImageCellControllerDelegate {
    func didRequestImage() {
        loadResource()
    }
    
    func didCancelImageRequest() {
        cancellable?.cancel()
        cancellable = nil
    }
}
