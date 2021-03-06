//
//  AdventOfCode2018Tests.swift
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

class AdventOfCode2018Tests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
	
	func testDefaultSourceFolder() {
		print(AdventOfCode2018.defaultInput.source)
	}
	
	func testInputData() {
		print(AdventOfCode2018.defaultInput.inputData(day: 1))
	}
	
	func testInputString() {
		print(AdventOfCode2018.defaultInput.inputString(day: 1))
	}
	
	func testInputRows() {
		print(AdventOfCode2018.defaultInput.inputRows(day: 1))
	}
}
