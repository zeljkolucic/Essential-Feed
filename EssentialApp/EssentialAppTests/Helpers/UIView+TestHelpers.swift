//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Zeljko Lucic on 31.1.23..
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
