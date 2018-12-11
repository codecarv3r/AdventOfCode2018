//
//  Day05.swift
//  AdventOfCode2018
//
//  Created by Silas Schwarz on 12/11/18.
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

public class Day05 {
	public static let day = 5
	
	let input: AdventOfCode2018
	public required init(input: AdventOfCode2018) {
		self.input = input
	}
	
	func poof(input: String) -> String {
		var index = 0
		var poofSet = [Int]()
		var cString = input.cString(using: .utf8)!
		while index < cString.count - 2 {
			if abs(cString[index] - cString[index + 1]) == 32 {
				poofSet.append(index)
				index += 1
			}
			index += 1
		}
		var removed = 0
		for var surgery in poofSet {
			surgery -= removed
			cString.remove(at: surgery)
			cString.remove(at: surgery)
			removed += 2
		}
		return String(cString: &cString, encoding: .utf8)!
	}
	
	func poofToFinish(input: String) -> String {
		var polymer = input
		var length = polymer.lengthOfBytes(using: .utf8)
		var newLength = length
		repeat {
			length = newLength
			polymer = poof(input: polymer)
			newLength = polymer.lengthOfBytes(using: .utf8)
		} while newLength < length
		return polymer
	}
	
	public var solution1: Int {
		var polymer = input.inputString(day: type(of: self).day)
		polymer = poofToFinish(input: polymer)
		return polymer.lengthOfBytes(using: .utf8) - 1
	}
	
	public var solution2: Int {
		let polymer = input.inputString(day: type(of: self).day)
		var minimumLength = polymer.lengthOfBytes(using: .utf8)
		for character in UInt8(65)...UInt8(90) {
			var fixed = polymer
			fixed.removeAll { (c: Character) -> Bool in
				return c == Character(Unicode.Scalar(character)) || c == Character(Unicode.Scalar(character + 32))
			}
			let poofedFixed = poofToFinish(input: fixed)
			minimumLength = min(minimumLength, poofedFixed.lengthOfBytes(using: .utf8))
		}
		return minimumLength - 1
	}
}
