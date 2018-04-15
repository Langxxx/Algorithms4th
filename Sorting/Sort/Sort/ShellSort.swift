//
//  ShellSort.swift
//  Sort
//
//  Created by lang on 15/04/2018.
//  Copyright © 2018 Beary Innovative. All rights reserved.
//

import Foundation

extension MutableCollection where Element: Comparable, Index == Int {
    mutating func shellSorting() {
        var gap = 1
        while gap < count { gap = 3 * gap + 1 } //1, 4, 13, 40....
        while gap > 0 {
            for position in 0..<gap {
                insertionSorting(from: position, by: gap)
            }
            gap /= 3
        }
    }
    mutating func insertionSorting() {
        insertionSorting(from: 0, by: 1)
    }
    private mutating func insertionSorting(from star: Int, by gap: Int) {
        for i in stride(from: star + gap, to: count, by: gap) {
            var position = i
            let current = self[i]
            while position > star && self[position-gap] > current {
                self[position] = self[position-gap]
                position -= gap
            }
            self[position] = current
        }
    }
}
