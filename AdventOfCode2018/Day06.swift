//
//  Day06.swift
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

public class Day06 {
	public static let day = 6
	
	struct Coordinate: Hashable {
		public let x: Int
		public let y: Int
		
		public init(x: Int, y: Int) {
			self.x = x
			self.y = y
		}
		
		public init(row: String) {
			self.x = Int(String(row.prefix(upTo: row.firstIndex(of: Character(","))!)))!
			self.y = Int(String(row.suffix(from: row.index(after: row.lastIndex(of: Character(" "))!))))!
		}
		
		public func distance(to coordinate: Coordinate) -> Int {
			return abs(x - coordinate.x) + abs(y - coordinate.y)
		}
		
		public static func +(lhs: Coordinate, rhs: Coordinate) -> Coordinate {
			return Coordinate(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
		}
		
		public static prefix func -(rhs: Coordinate) -> Coordinate {
			return Coordinate(x: -(rhs.x), y: -(rhs.y))
		}
		
		public static func -(lhs: Coordinate, rhs: Coordinate) -> Coordinate {
			return Coordinate(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
		}
		
		public var hashValue: Int {
			return x + 1000 * y
		}
		
//		public func hash(into hasher: inout Hasher) {
//			hasher.combine(self)
//		}
	}
	
	var coordinates = [Coordinate]()
	let input: AdventOfCode2018
	public required init(input: AdventOfCode2018) {
		self.input = input
		let rows = input.inputRows(day: type(of: self).day)
		var minX = Int.max
		var minY = Int.max
		var maxX = 0
		var maxY = 0
		for row in rows {
			let coordinate = Coordinate(row: row)
			minX = min(minX, coordinate.x)
			minY = min(minY, coordinate.y)
			maxX = max(maxX, coordinate.x)
			maxY = max(maxY, coordinate.y)
			coordinates.append(coordinate)
		}
	}
	
	public var solution1: Int {
		var coordinateFields = [Coordinate : Int]()
		for coordinate in coordinates {
			coordinateFields[coordinate] = 0
		}
		var infiniteCoordinates = Set<Coordinate>()
		let xRange = 0 ..< 400
		let yRange = 0 ..< 400
		for x in xRange {
			for y in yRange {
				let point = Coordinate(x: x, y: y)
				var distance = Int.max
				var closest = Coordinate(x: Int.max, y: Int.max)
				var double = false
				for coordinate in coordinates {
					let newDistance = point.distance(to: coordinate)
					if newDistance < distance {
						closest = coordinate
						distance = newDistance
						double = false
					} else if newDistance == distance {
						double = true
					}
				}
				if !double {
					coordinateFields[closest] = coordinateFields[closest]! + 1
					if (x == xRange.startIndex || y == yRange.startIndex || x == xRange.endIndex - 1 || y == yRange.endIndex - 1) && !infiniteCoordinates.contains(closest) {
						infiniteCoordinates.insert(closest)
					}
				}
			}
		}
		var fieldSize = 0
		for (coordinate, field) in coordinateFields {
			if field > fieldSize && !infiniteCoordinates.contains(coordinate) {
				fieldSize = field
			}
		}
		return fieldSize
	}
	
	public var solution2: Int {
		var regionSize = 0
		let xRange = 0 ..< 400
		let yRange = 0 ..< 400
		for x in xRange {
			for y in yRange {
				let point = Coordinate(x: x, y: y)
//				var distance = Int.max
//				var closest = Coordinate(x: Int.max, y: Int.max)
//				var double = false
				var totalDistance = 0
				for coordinate in coordinates {
					let newDistance = point.distance(to: coordinate)
					totalDistance += newDistance
//					if newDistance < distance {
//						closest = coordinate
//						distance = newDistance
//						double = false
//					} else if newDistance == distance {
//						double = true
//					}
				}
				if totalDistance < 10000 {
					if (x == xRange.startIndex || y == yRange.startIndex || x == xRange.endIndex - 1 || y == yRange.endIndex - 1) {
						fatalError()
					}
					regionSize += 1
				}
//				if !double {
//					coordinateFields[closest] = coordinateFields[closest]! + 1
//					if (x == xRange.startIndex || y == yRange.startIndex || x == xRange.endIndex - 1 || y == yRange.endIndex - 1) && !infiniteCoordinates.contains(closest) {
//						infiniteCoordinates.insert(closest)
//					}
//				}
			}
		}
		return regionSize
	}
}
