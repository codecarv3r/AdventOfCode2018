//
//  Day08.swift
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

public class Day08 {
	public static let day = 8
	
	class Node {
		var childCount = 0
		var metadataCount = 0
		var children = [Node]()
		var metadata = [Int]()
		
		init(numbers: inout [Int]) {
			childCount = numbers.first!
			numbers.removeFirst()
			metadataCount = numbers.first!
			numbers.removeFirst()
			for _ in 0 ..< childCount {
				children.append(Node(numbers: &numbers))
			}
			for _ in 0 ..< metadataCount {
				metadata.append(numbers.first!)
				numbers.removeFirst()
			}
		}
		
		var metadataSum: Int {
			var sum = 0
			for child in children {
				sum += child.metadataSum
			}
			for metadatum in metadata {
				sum += metadatum
			}
			return sum
		}
		
		var value: Int {
			if childCount == 0 {
				return metadataSum
			}
			var sum = 0
			for metadatum in metadata {
				if children.indices.contains(metadatum - 1) {
					sum += children[metadatum - 1].value
				}
			}
			return sum
		}
	}
	
	var tree: Node
	
	let input: AdventOfCode2018
	public required init(input: AdventOfCode2018) {
		self.input = input
		
		let inputStringList = input.inputString(day: type(of: self).day).split(separator: Character(" "))
		var inputNumbers = [Int]()
		for string in inputStringList {
			inputNumbers.append(Int(string)!)
		}
		tree = Node(numbers: &inputNumbers)
	}
	
	public var solution1: Int {
		return tree.metadataSum
	}
	
	public var solution2: Int {
		return tree.value
	}
}
