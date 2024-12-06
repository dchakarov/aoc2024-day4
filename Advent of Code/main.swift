//
//  main.swift
//  No rights reserved.
//

import Foundation
import RegexHelper

func main() {
    let fileUrl = URL(fileURLWithPath: "./aoc-input")
    guard let inputString = try? String(contentsOf: fileUrl, encoding: .utf8) else { fatalError("Invalid input") }
    
    let lines = inputString.components(separatedBy: "\n")
        .filter { !$0.isEmpty }
    
    var hchars = [[Character]]()
    lines.forEach { line in
        hchars.append(Array(line))
    }

    var totalCount = 0
    for i in 0..<hchars.count {
        for j in 0..<hchars[i].count {
            if hchars[i][j] == "X" {
                totalCount +=
                topLeft(i, j, chars: hchars) +
                topRight(i, j, chars: hchars) +
                bottomLeft(i, j, chars: hchars) +
                bottomRight(i, j, chars: hchars) +
                left(i, j, chars: hchars) +
                right(i, j, chars: hchars) +
                top(i, j, chars: hchars) +
                bottom(i, j, chars: hchars)
            }
        }
    }
    
    print(totalCount)
}

func topLeft(_ i: Int, _ j: Int, chars: [[Character]]) -> Int {
    if i < 3 || j < 3 {
        return 0
    }
    return [
        chars[i][j], chars[i-1][j-1], chars[i-2][j-2], chars[i-3][j-3]
    ] == ["X", "M", "A", "S"] ? 1 : 0
}

func topRight(_ i: Int, _ j: Int, chars: [[Character]]) -> Int {
    if i < 3 || j >= chars[i].count-3 {
        return 0
    }
    return [
        chars[i][j], chars[i-1][j+1], chars[i-2][j+2], chars[i-3][j+3]
    ] == ["X", "M", "A", "S"] ? 1 : 0
}

func bottomLeft(_ i: Int, _ j: Int, chars: [[Character]]) -> Int {
    if i >= chars.count-3 || j < 3 {
        return 0
    }
    return [
        chars[i][j], chars[i+1][j-1], chars[i+2][j-2], chars[i+3][j-3]
    ] == ["X", "M", "A", "S"] ? 1 : 0
}

func bottomRight(_ i: Int, _ j: Int, chars: [[Character]]) -> Int {
    if i >= chars.count-3 || j >= chars[i].count-3 {
        return 0
    }
    return [
        chars[i][j], chars[i+1][j+1], chars[i+2][j+2], chars[i+3][j+3]
    ] == ["X", "M", "A", "S"] ? 1 : 0
}

func left(_ i: Int, _ j: Int, chars: [[Character]]) -> Int {
    if j < 3 {
        return 0
    }
    return [
        chars[i][j], chars[i][j-1], chars[i][j-2], chars[i][j-3]
    ] == ["X", "M", "A", "S"] ? 1 : 0
}

func right(_ i: Int, _ j: Int, chars: [[Character]]) -> Int {
    if j >= chars[i].count-3 {
        return 0
    }
    return [
        chars[i][j], chars[i][j+1], chars[i][j+2], chars[i][j+3]
    ] == ["X", "M", "A", "S"] ? 1 : 0
}

func top(_ i: Int, _ j: Int, chars: [[Character]]) -> Int {
    if i < 3 {
        return 0
    }
    return [
        chars[i][j], chars[i-1][j], chars[i-2][j], chars[i-3][j]
    ] == ["X", "M", "A", "S"] ? 1 : 0
}

func bottom(_ i: Int, _ j: Int, chars: [[Character]]) -> Int {
    if i >= chars.count-3 {
        return 0
    }
    return [
        chars[i][j], chars[i+1][j], chars[i+2][j], chars[i+3][j]
    ] == ["X", "M", "A", "S"] ? 1 : 0
}

main()
