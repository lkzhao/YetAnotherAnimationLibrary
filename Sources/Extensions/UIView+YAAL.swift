// The MIT License (MIT)
//
// Copyright (c) 2016 Luke Zhao <me@lkzhao.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

extension UIView {
    public var yaal_center: MixAnimation<CGPoint> {
        return yaal_animationFor(key: "center",
                                 getter: { [weak self] in self?.center },
                                 setter: { [weak self] in self?.center = $0 })
    }
    public var yaal_alpha: MixAnimation<CGFloat> {
        return yaal_animationFor(key: "alpha",
                                 getter: { [weak self] in self?.alpha },
                                 setter: { [weak self] in self?.alpha = $0 })
    }
    public var yaal_bounds: MixAnimation<CGRect> {
        return yaal_animationFor(key: "bounds",
                                 getter: { [weak self] in self?.bounds },
                                 setter: { [weak self] in self?.bounds = $0 })
    }
    public var yaal_frame: MixAnimation<CGRect> {
        return yaal_animationFor(key: "frame",
                                 getter: { [weak self] in self?.frame },
                                 setter: { [weak self] in self?.frame = $0 })
    }
    public var yaal_backgroundColor: MixAnimation<UIColor> {
        return yaal_animationFor(key: "backgroundColor",
                                 getter: { [weak self] in self?.backgroundColor },
                                 setter: { [weak self] in self?.backgroundColor = $0 })
    }
    public var yaal_tintColor: MixAnimation<UIColor> {
        return yaal_animationFor(key: "tintColor",
                                 getter: { [weak self] in self?.tintColor },
                                 setter: { [weak self] in self?.tintColor = $0 })
    }

    public var yaal_translation: MixAnimation<CGPoint> { return layer.yaal_translation }
    public var yaal_translationX: MixAnimation<CGFloat> { return layer.yaal_translationX }
    public var yaal_translationY: MixAnimation<CGFloat> { return layer.yaal_translationY }
    public var yaal_translationZ: MixAnimation<CGFloat> { return layer.yaal_translationZ }

    public var yaal_scale: MixAnimation<CGFloat> { return layer.yaal_scale }
    public var yaal_scaleX: MixAnimation<CGFloat> { return layer.yaal_scaleX }
    public var yaal_scaleY: MixAnimation<CGFloat> { return layer.yaal_scaleY }

    public var yaal_rotation: MixAnimation<CGFloat> { return layer.yaal_rotation }
    public var yaal_rotationX: MixAnimation<CGFloat> { return layer.yaal_rotationX }
    public var yaal_rotationY: MixAnimation<CGFloat> { return layer.yaal_rotationY }
}
