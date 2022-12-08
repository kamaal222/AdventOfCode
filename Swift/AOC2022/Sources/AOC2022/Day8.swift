//
//  Day8.swift
//
//
//  Created by Kamaal M Farah on 07/12/2022.
//

import Foundation
import ShrimpExtensions

extension AOC2022 {
    public enum Day8: DayScaffold {
        public static let resourceName = "day8"

        public enum Part1 {
            public static func execute(with input: String) -> Int {
                let rows = input.splitLines
                let rowLength = rows[0].count
                let columnLength = rows.count

                var visibleTrees = 0
                for (rowIndex, row) in rows.enumerated() {
                    for (columnIndex, column) in row.enumerated() {
                        let treeHeight = column.int!

                        var right = 0
                        if columnIndex < columnLength - 1 {
                            var tallestTree = 0
                            for nextTree in row.range(from: columnIndex + 1) {
                                let nextTreeHeight = nextTree.int!
                                if nextTreeHeight > tallestTree {
                                    tallestTree = nextTreeHeight
                                }
                            }
                            right = tallestTree
                        }  else {
                            visibleTrees += 1
                            continue
                        }
                        var left = 0
                        if columnIndex > 0 {
                            var tallestTree = 0
                            for nextTree in row.range(from: 0, to: columnIndex) {
                                let nextTreeHeight = nextTree.int!
                                if nextTreeHeight > tallestTree {
                                    tallestTree = nextTreeHeight
                                }
                            }
                            left = tallestTree
                        } else {
                            visibleTrees += 1
                            continue
                        }
                        var top = 0
                        if rowIndex > 0 {
                            var tallestTree = 0
                            for i in 0...(rowIndex - 1) {
                                let nextTreeHeight = rows[i][columnIndex].int!
                                if nextTreeHeight > tallestTree {
                                    tallestTree = nextTreeHeight
                                }
                            }
                            top = tallestTree
                        } else {
                            visibleTrees += 1
                            continue
                        }
                        var bottom = 0
                        if rowIndex < rowLength - 1 {
                            var tallestTree = 0
                            for i in ((rowIndex + 1)..<rowLength) {
                                let nextTreeHeight = rows[i][columnIndex].int!
                                if nextTreeHeight > tallestTree {
                                    tallestTree = nextTreeHeight
                                }
                            }
                            bottom = tallestTree
                        } else {
                            visibleTrees += 1
                            continue
                        }

                        let edges = Edges(top: top, right: right, bottom: bottom, left: left)
                        let sidesShorter = edges.sidesShorter(than: treeHeight)

                        if sidesShorter > 0 {
                            visibleTrees += 1
                        }
                    }
                }

                return visibleTrees
            }
        }

        public enum Part2 {
            public static func execute(with input: String) -> Int {
                let rows = input.splitLines
                let rowLength = rows[0].count
                let columnLength = rows.count

                var visibleTrees = 0
                for (rowIndex, row) in rows.enumerated() {
                    for (columnIndex, column) in row.enumerated() {
                        let treeHeight = column.int!

                        var right = 0
                        if columnIndex < columnLength - 1 {
                            var tallestTree = 0
                            for nextTree in row.range(from: columnIndex + 1) {
                                let nextTreeHeight = nextTree.int!
                                if nextTreeHeight > tallestTree {
                                    tallestTree = nextTreeHeight
                                }
                            }
                            right = tallestTree
//                            right = row[columnIndex + 1].int!
                        }  else {
                            visibleTrees += 1
                            continue
                        }
                        var left = 0
                        if columnIndex > 0 {
                            var tallestTree = 0
                            for nextTree in row.range(from: 0, to: columnIndex) {
                                let nextTreeHeight = nextTree.int!
                                if nextTreeHeight > tallestTree {
                                    tallestTree = nextTreeHeight
                                }
                            }
                            left = tallestTree
//                            left = row[columnIndex - 1].int!
                        } else {
                            visibleTrees += 1
                            continue
                        }
                        var top = 0
                        if rowIndex > 0 {
                            var tallestTree = 0
                            for i in 0...(rowIndex - 1) {
                                let nextTreeHeight = rows[i][columnIndex].int!
                                if nextTreeHeight > tallestTree {
                                    tallestTree = nextTreeHeight
                                }
                            }
                            top = tallestTree
//                            top = rows[rowIndex - 1][columnIndex].int!
                        } else {
                            visibleTrees += 1
                            continue
                        }
                        var bottom = 0
                        if rowIndex < rowLength - 1 {
                            var tallestTree = 0
                            for i in ((rowIndex + 1)..<rowLength) {
                                let nextTreeHeight = rows[i][columnIndex].int!
                                if nextTreeHeight > tallestTree {
                                    tallestTree = nextTreeHeight
                                }
                            }
                            bottom = tallestTree
//                            bottom = rows[rowIndex  + 1][columnIndex].int!
                        } else {
                            visibleTrees += 1
                            continue
                        }

                        let edges = Edges(top: top, right: right, bottom: bottom, left: left)
                        let sidesShorter = edges.sidesShorter(than: treeHeight)

                        if sidesShorter > 0 {
                            visibleTrees += 1
                        }
                    }
                }

                return visibleTrees
            }
        }
    }
}

struct Edges {
    let top: Int
    let right: Int
    let bottom: Int
    let left: Int

    var array: [Int] {
        [right, left, top, bottom]
    }

    func sidesShorter(than comparison: Int) -> Int {
        array.reduce(0, {
            if $1 < comparison {
                return $0 + 1
            }
            return $0
        })
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
