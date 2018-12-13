//
//  Day01.swift
//  AdventOfCode2018
//
//  Created by Silas Schwarz on 12/10/18.
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

public class Day01 {
	public static let day = 1
	
	let input: AdventOfCode2018
	public required init(input: AdventOfCode2018) {
		self.input = input
	}
	
	func frequency(moves: [String]) -> Int {
		var frequency = 0
		for move in moves {
			if let moveInt = Int(move) {
				frequency += moveInt
			}
		}
		return frequency
	}
	
	public var solution1: Int {
		return frequency(moves: input.inputRows(day: type(of: self).day))
	}
	
	public var solution2: Int {
		let moves = input.inputRows(day: type(of: self).day).map { (move: String) -> Int in
			return Int(move)!
		}
		var frequency = 0
		var seenFrequencies = Set<Int>()
		var index = 0
		repeat {
			seenFrequencies.insert(frequency)
			if index == moves.indices.upperBound {
				index -= moves.count
			}
			frequency += moves[index]
			index += 1
		} while !seenFrequencies.contains(frequency)
		return frequency
	}
}
