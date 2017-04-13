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

extension CALayer {
    public var yaal_position: MixAnimation<CGPoint> {
        return yaal_animationFor(key: "position",
                                 getter: { [weak self] in self?.position },
                                 setter: { [weak self] in self?.position = $0 })
    }
    public var yaal_opacity: MixAnimation<Float> {
        return yaal_animationFor(key: "opacity",
                                 getter: { [weak self] in self?.opacity },
                                 setter: { [weak self] in self?.opacity = $0 })
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
    public var yaal_backgroundColor: MixAnimation<CGColor> {
        return yaal_animationFor(key: "backgroundColor",
                                 getter: { [weak self] in self?.backgroundColor },
                                 setter: { [weak self] in self?.backgroundColor = $0 })
    }

    public var yaal_cornerRadius: MixAnimation<CGFloat> {
        return yaal_animationFor(key: "cornerRadius",
                                 getter: { [weak self] in self?.cornerRadius },
                                 setter: { [weak self] in self?.cornerRadius = $0 })
    }

    public var yaal_zPosition: MixAnimation<CGFloat> {
        return yaal_animationFor(key: "zPosition",
                                 getter: { [weak self] in self?.zPosition },
                                 setter: { [weak self] in self?.zPosition = $0 })
    }

    public var yaal_borderWidth: MixAnimation<CGFloat> {
        return yaal_animationFor(key: "borderWidth",
                                 getter: { [weak self] in self?.borderWidth },
                                 setter: { [weak self] in self?.borderWidth = $0 })
    }
    public var yaal_borderColor: MixAnimation<CGColor> {
        return yaal_animationFor(key: "borderColor",
                                 getter: { [weak self] in self?.borderColor },
                                 setter: { [weak self] in self?.borderColor = $0 })
    }

    public var yaal_shadowRadius: MixAnimation<CGFloat> {
        return yaal_animationFor(key: "shadowRadius",
                                 getter: { [weak self] in self?.shadowRadius },
                                 setter: { [weak self] in self?.shadowRadius = $0 })
    }
    public var yaal_shadowColor: MixAnimation<CGColor> {
        return yaal_animationFor(key: "shadowColor",
                                 getter: { [weak self] in self?.shadowColor },
                                 setter: { [weak self] in self?.shadowColor = $0 })
    }
    public var yaal_shadowOffset: MixAnimation<CGSize> {
        return yaal_animationFor(key: "shadowOffset",
                                 getter: { [weak self] in self?.shadowOffset },
                                 setter: { [weak self] in self?.shadowOffset = $0 })
    }
    public var yaal_shadowOpacity: MixAnimation<Float> {
        return yaal_animationFor(key: "shadowOpacity",
                                 getter: { [weak self] in self?.shadowOpacity },
                                 setter: { [weak self] in self?.shadowOpacity = $0 })
    }

    public var yaal_perspective: MixAnimation<CGFloat> {
        return yaal_animationFor(key: "perspective",
                                 getter: { [weak self] in self?.transform.m34 },
                                 setter: { [weak self] in self?.transform.m34 = $0 })
    }

    public var yaal_translation: MixAnimation<CGPoint> {
        return yaal_animationForKeyPath("transform.translation")
    }
    public var yaal_translationX: MixAnimation<CGFloat> {
        return yaal_animationForKeyPath("transform.translation.x")
    }
    public var yaal_translationY: MixAnimation<CGFloat> {
        return yaal_animationForKeyPath("transform.translation.y")
    }
    public var yaal_translationZ: MixAnimation<CGFloat> {
        return yaal_animationForKeyPath("transform.translation.z")
    }

    public var yaal_scale: MixAnimation<CGFloat> { return yaal_animationForKeyPath("transform.scale") }
    public var yaal_scaleX: MixAnimation<CGFloat> { return yaal_animationForKeyPath("transform.scale.x") }
    public var yaal_scaleY: MixAnimation<CGFloat> { return yaal_animationForKeyPath("transform.scale.y") }

    public var yaal_rotation: MixAnimation<CGFloat> { return yaal_animationForKeyPath("transform.rotation") }
    public var yaal_rotationX: MixAnimation<CGFloat> { return yaal_animationForKeyPath("transform.rotation.x") }
    public var yaal_rotationY: MixAnimation<CGFloat> { return yaal_animationForKeyPath("transform.rotation.y") }
}
