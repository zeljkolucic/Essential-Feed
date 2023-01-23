//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Zeljko Lucic on 23.1.23..
//

import UIKit

extension UIButton {
    func simulateTap() {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .touchUpInside)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
