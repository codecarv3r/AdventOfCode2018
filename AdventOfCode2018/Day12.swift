//
//  Day12.swift
//  AdventOfCode2018
//
//  Created by Silas Schwarz on 12/17/18.
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

public class Day12 {
	public static let day = 12
	
	var center = 0
	var state = [Bool]()
	var originalState = [Bool]()
	
	let input: AdventOfCode2018
	public required init(input: AdventOfCode2018) {
		self.input = input
		var inputString = input.inputRows(day: type(of: self).day).first!
		inputString.removeSubrange(inputString.indices.startIndex ..< inputString.firstIndex(where: { (c: Character) -> Bool in
			return c == Character("#") || c == Character(".")
		})!)
		for c in inputString {
			state.append(c == Character("#"))
		}
		originalState = state
	}
	
	func current(pot: Int) -> Bool {
		if state.indices.contains(pot + center) {
			return state[pot + center]
		} else {
			return false
		}
	}
	
	func plantBehavior(A: Bool, B: Bool, C: Bool, D: Bool, E: Bool) -> Bool {
		return (B&&D&&E) || A && ((!E) && (((!B)&&D) || B&&(!D)) || (C&&(!D))) || ((!A) && (((!B)&&D&&E) || (B&&(!C))))
	}
	
	func runGeneration() {
		var newState = [Bool](repeating: false, count: state.count)
		for i in state.indices {
			let pot = i - center
			let A = current(pot: pot - 2)
			let B = current(pot: pot - 1)
			let C = current(pot: pot + 0)
			let D = current(pot: pot + 1)
			let E = current(pot: pot + 2)
			newState[i] = plantBehavior(A: A, B: B, C: C, D: D, E: E)
		}
		if state[0] && state[1] {
			newState.insert(true, at: 0)
			center += 1
		}
		if state[state.indices.endIndex - 1] {
			newState.append(true)
		}
		state = newState
//		while !(state.first!) {
//			state.removeFirst()
//			center -= 1
//		}
	}
	
	public var solution1: Int {
		for _ in 0..<20 {
			runGeneration()
		}
		var sum = 0
		for i in state.indices {
			if state[i] {
				sum += i - center
			}
		}
		return sum
	}
	
	func printState() {
		var printout = ""
		for pot in state {
			if pot {
				printout.append("#")
			} else {
				printout.append(".")
			}
		}
		print(printout)
	}
	
	func sumForGeneration(count: Int) -> Int {
		for _ in 0 ..< count {
			printState()
			runGeneration()
		}
		var sum = 0
		for i in state.indices {
			if state[i] {
				sum += i - center
			}
		}
		return sum
	}
	
	public var solution2: Int {
		for _ in 0..<201 {
			runGeneration()
		}
		var sum = 0
		var number = 0
		for i in state.indices {
			if state[i] {
				sum += i - center
				number += 1
			}
		}
		print("\(number)")
		return sum
	}
}
