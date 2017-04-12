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
    public var yaal: UIViewAnimate {
        struct Keys {
            internal static var uiViewAnimate = "uiViewAnimate"
        }
        if let animate = objc_getAssociatedObject(self, &Keys.uiViewAnimate) as? UIViewAnimate {
            return animate
        } else {
            let animate = UIViewAnimate(self)
            objc_setAssociatedObject(self, &Keys.uiViewAnimate, animate, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return animate
        }
    }

    public class UIViewAnimate {
        public private(set) lazy var center: MixAnimation<CGPoint> = self.animationWithBuilder { view in
            ({ view?.center }, { view?.center = $0 })
        }
        public private(set) lazy var alpha: MixAnimation<CGFloat> = self.animationWithBuilder { view in
            ({ view?.alpha }, { view?.alpha = $0 })
        }
        public private(set) lazy var bounds: MixAnimation<CGRect> = self.animationWithBuilder { view in
            ({ view?.bounds }, { view?.bounds = $0 })
        }
        public private(set) lazy var frame: MixAnimation<CGRect> = self.animationWithBuilder { view in
            ({ view?.frame }, { view?.frame = $0 })
        }
        public private(set) lazy var zPosition: MixAnimation<CGFloat> = self.animationWithBuilder { view in
            ({ view?.layer.zPosition }, { view?.layer.zPosition = $0 })
        }
        public private(set) lazy var shadowOpacity: MixAnimation<Float> = self.animationWithBuilder { view in
            ({ view?.layer.shadowOpacity }, { view?.layer.shadowOpacity = $0 })
        }
        public private(set) lazy var perspective: MixAnimation<CGFloat> = self.animationWithBuilder { view in
            ({ view?.layer.transform.m34 }, { view?.layer.transform.m34 = $0 })
        }

        // Note: please don't use translation with translationX/translationY together. 
        // they do not share the same velocity variable. Use one or the other
        public private(set) lazy var translation: MixAnimation<CGPoint> = self.animationForKeyPath("transform.translation")
        public private(set) lazy var translationX: MixAnimation<CGFloat> = self.animationForKeyPath("transform.translation.x")
        public private(set) lazy var translationY: MixAnimation<CGFloat> = self.animationForKeyPath("transform.translation.y")
        public private(set) lazy var translationZ: MixAnimation<CGFloat> = self.animationForKeyPath("transform.translation.z")

        public private(set) lazy var scale: MixAnimation<CGFloat> = self.animationForKeyPath("transform.scale")
        public private(set) lazy var scaleX: MixAnimation<CGFloat> = self.animationForKeyPath("transform.scale.x")
        public private(set) lazy var scaleY: MixAnimation<CGFloat> = self.animationForKeyPath("transform.scale.y")
        public private(set) lazy var rotation: MixAnimation<CGFloat> = self.animationForKeyPath("transform.rotation")
        public private(set) lazy var rotationX: MixAnimation<CGFloat> = self.animationForKeyPath("transform.rotation.x")
        public private(set) lazy var rotationY: MixAnimation<CGFloat> = self.animationForKeyPath("transform.rotation.y")

        internal weak var view: UIView?
        internal init(_ view: UIView) {
            self.view = view
        }

        private func animationForKeyPath<Value: VectorConvertible>(_ keyPath: String) -> MixAnimation<Value> {
            return animationWithBuilder { view in
                ({ view?.layer.value(forKeyPath:keyPath) as? Value }, { view?.layer.setValue($0, forKeyPath:keyPath) })
            }
        }

        public func animationWithBuilder<Value: VectorConvertible>(_ builder: (UIView?) -> (() -> Value?, (Value) -> Void))
            -> MixAnimation<Value> {
            let (getter, setter) = builder(self.view)
            return MixAnimation<Value>(getter: getter, setter: setter)
        }

        private lazy var customProperties: [String: Any] = [:]

        public func register<Value: VectorConvertible>(key: String,
                                                    getter: @escaping () -> Value?,
                                                    setter: @escaping (Value) -> Void) {
            customProperties[key] = MixAnimation(getter: getter, setter: setter)
        }

        public func custom<Value: VectorConvertible>(_ key: String) -> MixAnimation<Value>? {
            return customProperties[key] as? MixAnimation<Value>
        }
    }
}
