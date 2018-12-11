//
//  Day07.swift
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

import Foundation

public class Day07 {
	public static let day = 7
	
	var instructions = Set<Int>()
	var requirements = [Int : Set<Int>]()
	var following = [Int : Set<Int>]()
	
	func check(instruction: Int) {
		if !instructions.contains(instruction) {
			instructions.insert(instruction)
			requirements[instruction] = Set<Int>()
			following[instruction] = Set<Int>()
		}
	}
	
	let input: AdventOfCode2018
	public required init(input: AdventOfCode2018) {
		self.input = input
		let rows = input.inputRows(day: type(of: self).day)
		for row in rows {
			var row = row
			row.remove(at: row.startIndex)
			var before = 0
			var after = 0
			for character in row {
				if CharacterSet.uppercaseLetters.contains(character.unicodeScalars.first!) {
					if before == 0 {
						before = Int(character.unicodeScalars.first!.value)
					} else {
						after = Int(character.unicodeScalars.first!.value)
					}
				}
			}
			check(instruction: before)
			check(instruction: after)
			requirements[after]!.insert(before)
			following[before]!.insert(after)
		}
	}
	
	public var solution1: String {
		var order = ""
		while !instructions.isEmpty {
			var available = [Int]()
			for instruction in instructions {
				if requirements[instruction]!.isEmpty {
					available.append(instruction)
				}
			}
			if available.count > 1 {
				available.sort { (a: Int, b: Int) -> Bool in
					return a < b
				}
			}
			order.append(Character(Unicode.Scalar(UInt8(available.first!))))
			instructions.remove(available.first!)
			requirements.removeValue(forKey: available.first!)
			for followerIndex in following[available.first!]!.indices {
				requirements[following[available.first!]![followerIndex]]!.remove(available.first!)
			}
			following.removeValue(forKey: available.first!)
		}
		return order
	}
	
	func instructionTime(instruction: Int) -> Int {
		let aValue: Unicode.Scalar = "A"
		return 61 - Int(aValue.value) + instruction
	}
	
	struct Worker {
		var instruction: Int?
		var workingUntil: Int?
		var available: Bool {
			return instruction == nil
		}
		
		mutating func timePasses(second: Int) -> Int? {
			if let workingUntil = workingUntil {
				if second == workingUntil {
					let finished = self.instruction!
					self.instruction = nil
					self.workingUntil = nil
					return finished
				}
			}
			return nil
		}
	}
	
	public var solution2: Int {
		var second = 0
		var workers = [
			Worker(instruction: nil, workingUntil: nil),
			Worker(instruction: nil, workingUntil: nil),
			Worker(instruction: nil, workingUntil: nil),
			Worker(instruction: nil, workingUntil: nil),
			Worker(instruction: nil, workingUntil: nil)
		]
		var available = [Int]()
		for instruction in instructions {
			if requirements[instruction]!.isEmpty {
				available.append(instruction)
				requirements.removeValue(forKey: instruction)
			}
		}
		available.sort { (a: Int, b: Int) -> Bool in
			return a < b
		}
		while !instructions.isEmpty {
			for index in workers.indices {
				if let finished = workers[index].timePasses(second: second) {
					instructions.remove(finished)
					for instruction in following[finished]! {
						requirements[instruction]!.remove(finished)
						if requirements[instruction]!.isEmpty {
							requirements.removeValue(forKey: instruction)
							available.append(instruction)
							available.sort { (a: Int, b: Int) -> Bool in
								a < b
							}
						}
					}
				}
			}
			for index in workers.indices {
				if workers[index].available && available.count > 0 {
					workers[index].instruction = available.first!
					workers[index].workingUntil = second + instructionTime(instruction: available.first!)
					available.removeFirst()
				}
			}
			second += 1
		}
		return second - 1
	}
}
