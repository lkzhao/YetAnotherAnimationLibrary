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

extension UILabel {
    public var yaal_textColor: MixAnimation<UIColor> {
        return yaal_animationFor(key: "textColor",
                                 getter: { [weak self] in self?.textColor },
                                 setter: { [weak self] in self?.textColor = $0 })
    }
    public var yaal_shadowColor: MixAnimation<UIColor> {
        return yaal_animationFor(key: "shadowColor",
                                 getter: { [weak self] in self?.shadowColor },
                                 setter: { [weak self] in self?.shadowColor = $0 })
    }
    public var yaal_shadowOffset: MixAnimation<CGSize> {
        return yaal_animationFor(key: "shadowOffset",
                                 getter: { [weak self] in self?.shadowOffset },
                                 setter: { [weak self] in self?.shadowOffset = $0 })
    }
}
