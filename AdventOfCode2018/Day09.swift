//
//  Day09.swift
//  AdventOfCode2018
//
//  Created by Silas Schwarz on 12/13/18.
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

import Foundation

public class Day09 {
	public static let day = 9
	
	var playerCount: Int
	var lastMarbleValue: Int
	
	let input: AdventOfCode2018
	public required init(input: AdventOfCode2018) {
		self.input = input
		var string = input.inputString(day: type(of: self).day)
		var lowerIndex = string.firstIndex { (c: Character) -> Bool in
			return CharacterSet.decimalDigits.contains(c.unicodeScalars.first!)
		}!
		string.removeSubrange(string.indices.startIndex ..< lowerIndex)
		var upperIndex = string.firstIndex { (c: Character) -> Bool in
			return !CharacterSet.decimalDigits.contains(c.unicodeScalars.first!)
		}!
		playerCount = Int(string[string.indices.startIndex ..< upperIndex])!
		string.removeSubrange(string.indices.startIndex ..< upperIndex)
		lowerIndex = string.firstIndex { (c: Character) -> Bool in
			return CharacterSet.decimalDigits.contains(c.unicodeScalars.first!)
			}!
		string.removeSubrange(string.indices.startIndex ..< lowerIndex)
		upperIndex = string.firstIndex { (c: Character) -> Bool in
			return !CharacterSet.decimalDigits.contains(c.unicodeScalars.first!)
			}!
		lastMarbleValue = Int(string[string.indices.startIndex ..< upperIndex])!
	}
	
	class Marble {
		var value: Int
		var left: Marble!
		var right: Marble!

		init(value: Int) {
			self.value = value
		}
		
		init(value: Int, left: Marble, right: Marble) {
			self.value = value
			self.left = left
			self.right = right
		}
	}
	
	public var solution1: Int {
		var current = Marble(value: 0)
		current.left = current
		current.right = current
		var usedMarble = 0
		var players = [Int](repeating: 0, count: playerCount)
		var player = 0
		repeat {
			usedMarble += 1
			if usedMarble % 23 == 0 {
				players[player] += usedMarble
				for _ in 0 ..< 7 {
					current = current.left
				}
				players[player] += current.value
				let left: Marble = current.left
				let right: Marble = current.right
				left.right = right
				right.left = left
				current = right
			} else {
				let left: Marble = current.right
				let right: Marble = left.right
				current = Marble(value: usedMarble, left: left, right: right)
				left.right = current
				right.left = current
			}
			player += 1
			player %= playerCount
		} while usedMarble < lastMarbleValue
		var maxScore = 0
		for player in players {
			maxScore = max(maxScore, player)
		}
		return maxScore
	}
	
	public var solution2: Int {
		lastMarbleValue *= 100
		return solution1
	}
}
