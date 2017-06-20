//
//  BigUInt Comparison.swift
//  BigInt
//
//  Created by Károly Lőrentey on 2016-01-03.
//  Copyright © 2016-2017 Károly Lőrentey.
//

import Foundation

extension BigUInt: Comparable {
    //MARK: Comparison
    
    /// Compare `a` to `b` and return an `NSComparisonResult` indicating their order.
    ///
    /// - Complexity: O(count)
    public static func compare(_ a: BigUInt, _ b: BigUInt) -> ComparisonResult {
        if a.count != b.count { return a.count > b.count ? .orderedDescending : .orderedAscending }
        for i in (0..<a.count).reversed() {
            let ad = a[i]
            let bd = b[i]
            if ad != bd { return ad > bd ? .orderedDescending : .orderedAscending }
        }
        return .orderedSame
    }

    /// Return true iff `a` is equal to `b`.
    ///
    /// - Complexity: O(count)
    public static func ==(a: BigUInt, b: BigUInt) -> Bool {
        return BigUInt.compare(a, b) == .orderedSame
    }

    /// Return true iff `a` is less than `b`.
    ///
    /// - Complexity: O(count)
    public static func <(a: BigUInt, b: BigUInt) -> Bool {
        return BigUInt.compare(a, b) == .orderedAscending
    }

    /// Return true iff this integer is zero.
    ///
    /// - Complexity: O(1)
    var isZero: Bool {
        return count == 0
    }
}

