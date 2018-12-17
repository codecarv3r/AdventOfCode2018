//
//  Day11.swift
//  AdventOfCode2018
//
//  Created by Silas Schwarz on 12/15/18.
//  Copyright 2018 Silas Schwarz
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

public class Day11 {
	public static let day = 11
	
	var serial = 8979
	
	public required init() {
	}
	
	public var solution1: String {
		var levels = [[Int]](repeating: [Int](repeating: 0, count: 300), count: 300)
		for x in 1...300 {
			for y in 1...300 {
				let preLevel = ((x + 10) * y + serial) * (x + 10)
				levels[x-1][y-1] = Int(String(String(format: "%03d", preLevel % 1000).first!))! - 5
			}
		}
		var maxX = 0
		var maxY = 0
		var maxTotal = 0
		for x in 1...298 {
			for y in 1...298 {
				var total = 0
				for i in 0..<3 {
					for j in 0..<3 {
						total += levels[x-1 + i][y-1 + j]
					}
				}
				if total > maxTotal {
					maxX = x
					maxY = y
					maxTotal = total
				}
			}
		}
		return "(\(maxX), \(maxY))"
	}
	
	public var solution2: String {
		var levels = [[Int]](repeating: [Int](repeating: 0, count: 300), count: 300)
		for x in 1...300 {
			for y in 1...300 {
				let preLevel = ((x + 10) * y + serial) * (x + 10)
				levels[x-1][y-1] = Int(String(String(format: "%03d", preLevel % 1000).first!))! - 5
			}
		}
		var maxX = 0
		var maxY = 0
		var maxTotal = 0
		var maxSize = 0
		for size in 1...300 {
			for x in 1...300 - (size - 1) {
				for y in 1...300 - (size - 1) {
					var total = 0
					for i in 0 ..< size {
						for j in 0 ..< size {
							total += levels[x-1 + i][y-1 + j]
						}
					}
					if total > maxTotal {
						maxX = x
						maxY = y
						maxTotal = total
						maxSize = size
					}
				}
			}
		}
		return "(\(maxX), \(maxY), \(maxSize))"
	}
}
