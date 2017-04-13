//
//  UIScrollView+YAAL.swift
//  YetAnotherAnimationLibrary
//
//  Created by Luke on 4/13/17.
//  Copyright © 2017 Luke Zhao. All rights reserved.
//

import UIKit

extension UIScrollView {
    public var yaal_contentOffset: MixAnimation<CGPoint> {
        return yaal_animationFor(key: "contentOffset",
                                 getter: { [weak self] in self?.contentOffset },
                                 setter: { [weak self] in self?.contentOffset = $0 })
    }
    public var yaal_contentSize: MixAnimation<CGSize> {
        return yaal_animationFor(key: "contentSize",
                                 getter: { [weak self] in self?.contentSize },
                                 setter: { [weak self] in self?.contentSize = $0 })
    }
    public var yaal_zoomScale: MixAnimation<CGFloat> {
        return yaal_animationFor(key: "zoomScale",
                                 getter: { [weak self] in self?.zoomScale },
                                 setter: { [weak self] in self?.zoomScale = $0 })
    }
    public var yaal_contentInset: MixAnimation<UIEdgeInsets> {
        return yaal_animationFor(key: "contentInset",
                                 getter: { [weak self] in self?.contentInset },
                                 setter: { [weak self] in self?.contentInset = $0 })
    }
    public var yaal_scrollIndicatorInsets: MixAnimation<UIEdgeInsets> {
        return yaal_animationFor(key: "scrollIndicatorInsets",
                                 getter: { [weak self] in self?.scrollIndicatorInsets },
                                 setter: { [weak self] in self?.scrollIndicatorInsets = $0 })
    }
}
