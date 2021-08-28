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
import simd

public typealias Vector1 = Double
public typealias Vector2 = SIMD2<Double>
public typealias Vector3 = SIMD3<Double>
public typealias Vector4 = SIMD4<Double>

public protocol VectorType: ExpressibleByArrayLiteral {
    init()

    static var zero: Self { get }
    // for looping all values one by one, not used internally
    static var rawValueCount: Int { get }
    subscript(index: Int) -> Double { get set }

    // arithmetic
    static func + (lhs: Self, rhs: Self) -> Self
    static func - (lhs: Self, rhs: Self) -> Self
    static func * (lhs: Double, rhs: Self) -> Self
    func distance(between: Self) -> Double
}

// implements VectorConvertible, so that all VectorType conform to VectorConvertible
extension VectorType {
    public typealias Vector = Self
    public static func from(vector: Self) -> Self {
        return vector
    }
    public var vector: Self {
        return self
    }
  static func * (lhs: Self, rhs: Double) -> Self {
    rhs * lhs
  }
  static func / (lhs: Self, rhs: Double) -> Self {
    lhs * (1 / rhs)
  }
  public func distance(between: Self) -> Double {
    var result = 0.0
    for i in 0..<Self.rawValueCount {
      result += abs(self[i] - between[i])
    }
    return result
  }
}

extension Double: VectorType, VectorConvertible {
    public static var zero = 0.0
    public static var rawValueCount: Int { return 1 }
    public subscript(x: Int) -> Double {
        get { return self }
        set { self = newValue }
    }
    public init(arrayLiteral elements: Double...) {
        self = elements[0]
    }
    public func distance(between: Double) -> Double {
        return abs(self - between)
    }
}

extension SIMD16: VectorType, VectorConvertible where Scalar == Double {
  public static var zero: SIMD16<Scalar> = SIMD16<Scalar>()
  public static var rawValueCount: Int { 16 }

  public static func * (lhs: Double, rhs: SIMD16<Scalar>) -> SIMD16<Scalar> {
    [lhs * rhs[0], lhs * rhs[1], lhs * rhs[2], lhs * rhs[3],
     lhs * rhs[4], lhs * rhs[5], lhs * rhs[6], lhs * rhs[7],
     lhs * rhs[8], lhs * rhs[9], lhs * rhs[10], lhs * rhs[11],
     lhs * rhs[12], lhs * rhs[13], lhs * rhs[14], lhs * rhs[15]]
  }
}

extension SIMD2: VectorType, VectorConvertible where Scalar == Double {
    public static var zero = SIMD2<Double>()
    public static var rawValueCount: Int { 2 }
    public func distance(between: SIMD2<Double>) -> Double {
        simd.distance(self, between)
    }
}

extension SIMD3: VectorType, VectorConvertible where Scalar == Double {
    public static var zero = SIMD3<Double>()
    public static var rawValueCount: Int { 3 }
    public func distance(between: SIMD3<Double>) -> Double {
        simd.distance(self, between)
    }
}

extension SIMD4: VectorType, VectorConvertible where Scalar == Double {
    public static var zero = SIMD4<Double>()
    public static var rawValueCount: Int { 4 }
    public func distance(between: SIMD4<Double>) -> Double {
        simd.distance(self, between)
    }
}
