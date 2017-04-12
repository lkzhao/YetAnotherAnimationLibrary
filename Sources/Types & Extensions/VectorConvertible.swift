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

public protocol VectorConvertible {
    associatedtype Vector: VectorType
    init()
    init(vector: Vector)
    var vector: Vector { get }
}

extension Float: VectorConvertible {
    public typealias Vector = Vector1
    public init(vector: Vector1) {
        self = Float(vector)
    }
    public var vector: Vector1 {
        return Vector1(self)
    }
}

extension CGFloat: VectorConvertible {
    public typealias Vector = Vector1
    public init(vector: Vector1) {
        self = CGFloat(vector)
    }
    public var vector: Vector1 {
        return Vector1(self)
    }
}

extension CGPoint: VectorConvertible {
    public typealias Vector = Vector2
    public init(vector: Vector2) {
        self = CGPoint(x: vector.x, y: vector.y)
    }
    public var vector: Vector2 {
        return [Double(x), Double(y)]
    }
}

extension CGSize: VectorConvertible {
    public typealias Vector = Vector2
    public init(vector: Vector2) {
        self = CGSize(width: vector.x, height: vector.y)
    }
    public var vector: Vector2 {
        return [Double(width), Double(height)]
    }
}

extension CGRect: VectorConvertible {
    public typealias Vector = Vector4
    public init(vector: Vector4) {
        self = CGRect(x: vector.x, y: vector.y, width: vector.z, height: vector.w)
    }
    public var vector: Vector4 {
        return [Double(origin.x), Double(origin.y), Double(width), Double(height)]
    }
}
