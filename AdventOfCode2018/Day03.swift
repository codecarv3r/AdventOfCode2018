//
//  Day03.swift
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

public class Day03 {
	public static let day = 3
	
	public var maxX = 0
	public var maxY = 0
	public var claims: [ElfClaim]
	
	let input: AdventOfCode2018
	public required init(input: AdventOfCode2018) {
		self.input = input
		var maxX = 0
		var maxY = 0
		claims = input.inputRows(day: Day03.day).map({ (descriptor: String) -> ElfClaim in
			let elfClaim = ElfClaim(descriptor: descriptor)
			maxX = max(maxX, elfClaim.x + elfClaim.width)
			maxY = max(maxY, elfClaim.y + elfClaim.height)
			return elfClaim
		})
		self.maxX = maxX
		self.maxY = maxY
	}
	
	public class ElfClaim {
		let ID: Int
		let x: Int
		let y: Int
		let width: Int
		let height: Int
		
		init(descriptor: String) {
			var components = descriptor.split(separator: " ")
			ID = Int(components[0].suffix(from: String.Index(encodedOffset: 1)))!
			x = Int(components[2].split(separator: ",")[0])!
			y = Int(components[2].split(separator: ",")[1].prefix(while: { (c: Character) -> Bool in
				return c.unicodeScalars.first! != ":".unicodeScalars.first!
			}))!
			width = Int(components[3].split(separator: "x")[0])!
			height = Int(components[3].split(separator: "x")[1])!
		}
	}
	
	public var solution1: Int {
		var used = Set<Int>()
		var usedTwice = Set<Int>()
		var overlapped = 0;
		for claim in claims {
			for x in claim.x ..< claim.x + claim.width {
				for y in claim.y ..< claim.y + claim.height {
					let hash = x * 1000 + y
					if used.contains(hash) {
						if !usedTwice.contains(hash) {
							overlapped += 1
							usedTwice.insert(hash)
						}
					} else {
						used.insert(hash)
					}
				}
			}
		}
		return overlapped
	}
	
	public var solution2: Int {
		var used = Set<Int>()
		var usedTwice = Set<Int>()
		for claim in claims {
			for x in claim.x ..< claim.x + claim.width {
				for y in claim.y ..< claim.y + claim.height {
					let hash = x * 1000 + y
					if used.contains(hash) {
						if !usedTwice.contains(hash) {
							usedTwice.insert(hash)
						}
					} else {
						used.insert(hash)
					}
				}
			}
		}
		for claim in claims {
			var thisIsTheOne = true
			for x in claim.x ..< claim.x + claim.width {
				for y in claim.y ..< claim.y + claim.height {
					let hash = x * 1000 + y
					thisIsTheOne = thisIsTheOne && !usedTwice.contains(hash)
				}
			}
			if thisIsTheOne {
				return claim.ID
			}
		}
		fatalError()
	}
}
