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
}
