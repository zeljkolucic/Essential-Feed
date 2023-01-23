//
//  FeedViewController+Localization.swift
//  EssentialFeediOSTests
//
//  Created by Zeljko Lucic on 9.11.22..
//

import Foundation
import XCTest
import EssentialFeed

func localized(_ key: String, file: StaticString = #filePath, line: UInt = #line) -> String {
    let table = "Feed"
    let bundle = Bundle(for: FeedPresenter.self)
    let value = bundle.localizedString(forKey: key, value: nil, table: table)
    if value == key {
        XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
    }
    return value
}
