//
//  PuzzleStarTests.swift
//  AdventOfCode2018Tests
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

import XCTest
@testable import AdventOfCode2018

class PuzzleStarTests: XCTestCase {
	func testStar01() {
		self.measure {
			print("Star 01: \(Day01(input: AdventOfCode2018.defaultInput).solution1)")
		}
	}
	
	func testStar02() {
		self.measure {
			print("Star 02: \(Day01(input: AdventOfCode2018.defaultInput).solution2)")
		}
	}
	
	func testStar03() {
		self.measure {
			print("Star 03: \(Day02(input: AdventOfCode2018.defaultInput).solution1)")
		}
	}
	
	func testStar04() {
		self.measure {
			print("Star 04: \(Day02(input: AdventOfCode2018.defaultInput).solution2)")
		}
	}
	
	func testStar04_method1() {
		self.measure {
			print("Star 04 Method 1: \(Day02(input: AdventOfCode2018.defaultInput).solution2method1)")
		}
	}
	
	func testStar04_method2() {
		self.measure {
			print("Star 04 Method 2: \(Day02(input: AdventOfCode2018.defaultInput).solution2method2)")
		}
	}
	
	func testStar05() {
		self.measure {
			print("Star 05: \(Day03(input: AdventOfCode2018.defaultInput).solution1)")
		}
	}
	
	func testStar06() {
		self.measure {
			print("Star 06: \(Day03(input: AdventOfCode2018.defaultInput).solution2)")
		}
	}
	
	func testStar07() {
		self.measure {
			print("Star 07: \(Day04(input: AdventOfCode2018.defaultInput).solution1)")
		}
	}
	
	func testStar08() {
		self.measure {
			print("Star 08: \(Day04(input: AdventOfCode2018.defaultInput).solution2)")
		}
	}
	
	func testStar09() {
		self.measure {
			print("Star 09: \(Day05(input: AdventOfCode2018.defaultInput).solution1)")
		}
	}
	
	func testStar10() {
		self.measure {
			print("Star 10: \(Day05(input: AdventOfCode2018.defaultInput).solution2)")
		}
	}
	
	func testStar11() {
		self.measure {
			print("Star 11: \(Day06(input: AdventOfCode2018.defaultInput).solution1)")
		}
	}
	
	func testStar12() {
		self.measure {
			print("Star 12: \(Day06(input: AdventOfCode2018.defaultInput).solution2)")
		}
	}
	
	func testStar13() {
		self.measure {
			print("Star 13: \(Day07(input: AdventOfCode2018.defaultInput).solution1)")
		}
	}
	
	func testStar14() {
//		let input = AdventOfCode2018(source: FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Desktop"))
//		print("Star 14: \(Day07(input: input).solution2)")
		self.measure {
			print("Star 14: \(Day07(input: AdventOfCode2018.defaultInput).solution2)")
		}
	}
	
	func testStar15() {
//		let input = AdventOfCode2018(source: FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Desktop"))
//		print("Star 15: \(Day08(input: input).solution1)")
		self.measure {
			print("Star 15: \(Day08(input: AdventOfCode2018.defaultInput).solution1)")
		}
	}
	
	func testStar16() {
		self.measure {
			print("Star 16: \(Day08(input: AdventOfCode2018.defaultInput).solution2)")
		}
	}
	
	func testStar17() {
		//		let input = AdventOfCode2018(source: FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Desktop"))
		//		print("Star 15: \(Day08(input: input).solution1)")
		self.measure {
			print("Star 17: \(Day09(input: AdventOfCode2018.defaultInput).solution1)")
		}
	}
	
	func testStar18() {
		self.measure {
			print("Star 18: \(Day09(input: AdventOfCode2018.defaultInput).solution2)")
		}
	}
	
	func testStar19() {
		self.measure {
			print("Star 19: \(Day10(input: AdventOfCode2018.defaultInput).solution1)")
		}
	}
	
	func testStar20() {
		self.measure {
			print("Star 20: \(Day10(input: AdventOfCode2018.defaultInput).solution2)")
		}
	}
	
	func printHundred(number: Int) {
		var level = Int(String(String(format: "%03d", number % 1000).first!))!
		level -= 5
		print(level)
	}
	
	func testStar21() {
		self.measure {
			print("Star 21: \(Day11().solution1)")
		}
	}
	
	func testStar22() {
		self.measure {
			print("Star 22: \(Day11().solution2)")
		}
	}
	
	func testStar23() {
//		let day12 = Day12(input: AdventOfCode2018.defaultInput)
//		for A in [false, true] {
//			for B in [false, true] {
//				for C in [false, true] {
//					for D in [false, true] {
//						for E in [false, true] {
//							let newPlant = day12.plantBehavior(A: A, B: B, C: C, D: D, E: E)
//							if newPlant {
//								print("1")
//							} else {
//								print("0")
//							}
//						}
//					}
//				}
//			}
//		}
		self.measure {
			print("Star 23: \(Day12(input: AdventOfCode2018.defaultInput).solution1)")
		}
	}
	
	func testStar24() {
		self.measure {
			print("Star 24: \(Day12(input: AdventOfCode2018.defaultInput).solution2)")
		}
	}
}
