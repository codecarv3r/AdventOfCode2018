//
//  Day02.swift
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

public class Day02 {
	public static let day = 2
	
	let input: AdventOfCode2018
	public required init(input: AdventOfCode2018) {
		self.input = input
	}
	
	public var solution1: Int {
		let ids = input.inputRows(day: Day02.day)
		
		var doubleLetterIDs = 0
		var tripleLetterIDs = 0
		
		for id in ids {
			var singles = Set<Character>()
			var doubles = Set<Character>()
			var triples = Set<Character>()
			var more = Set<Character>()
			for character in id {
				if more.contains(character) {
					
				} else if triples.contains(character) {
					triples.remove(character)
					more.insert(character)
				} else if doubles.contains(character) {
					doubles.remove(character)
					triples.insert(character)
				} else if singles.contains(character) {
					singles.remove(character)
					doubles.insert(character)
				} else {
					singles.insert(character)
				}
			}
			doubleLetterIDs += doubles.isEmpty ? 0 : 1
			tripleLetterIDs += triples.isEmpty ? 0 : 1
		}
		return doubleLetterIDs * tripleLetterIDs
	}
	
	func areSimilar(lhc: String, rhs: String) -> String? {
		var characters: [Character] = []
		for index in lhc.indices {
			if lhc[index] == rhs[index] {
				characters.append(lhc[index])
			}
		}
		return characters.count + 1 == lhc.count ? String(characters) : nil
	}
	
	var solution2method1: String {
		let ids = input.inputRows(day: Day02.day)
		var common: String?
		for index in ids.indices {
			for jindex in index + 1 ..< ids.indices.upperBound {
				if let result = areSimilar(lhc: String(ids[index]), rhs: String(ids[jindex])) {
					common = result
				}
			}
		}
		return common!
	}
	
	var solution2method2: String {
		let rows = input.inputRows(day: Day02.day)
		var hashList = [UInt64]()
		for row in rows {
			var hash: UInt64 = 0
			var cIndex = 0
			for character in row {
				let characterValue = UInt64(character.unicodeScalars.first!.value) - UInt64(96)
				let shift = 5 * (cIndex % 12)
				let added = characterValue << shift
				hash += added
				cIndex += 1
			}
			if hashList.contains(hash) {
				print("Repeat in List!")
			}
			hashList.append(hash)
		}
		
		var cIndex = 0
		for characterIndex in rows.first!.indices {
			var hashDictionary = [UInt64 : Int]()
			for rowIndex in rows.indices {
				let characterValue = UInt64(rows[rowIndex][characterIndex].unicodeScalars.first!.value) - UInt64(96)
				let shift = 5 * (cIndex % 12)
				let added = characterValue << shift
				let newHash = hashList[rowIndex] - added
				if hashDictionary.keys.contains(newHash) {
					var a = rows[hashDictionary[newHash]!]
					var b = rows[rowIndex]
					a.remove(at: characterIndex)
					b.remove(at: characterIndex)
					if a == b {
						return a
					}
				}
				hashDictionary[newHash] = rowIndex
			}
			cIndex += 1
		}
		return ""
	}
	
	public var solution2: String {
		return solution2method2
	}
}
