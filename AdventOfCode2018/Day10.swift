//
//  Day10.swift
//  AdventOfCode2018
//
//  Created by Silas Schwarz on 12/15/18.
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

public class Day10 {
	public static let day = 10
	
	class Star {
		var x = 0
		var y = 0
		var vx = 0
		var vy = 0
	}
	
	var stars = [Star]()
	var time = 0
	
	
	let input: AdventOfCode2018
	public required init(input: AdventOfCode2018) {
		self.input = input
		
		let rows = input.inputRows(day: type(of: self).day)
		for var row in rows {
			let star = Star()
			
			row.removeSubrange(row.indices.startIndex ..< row.firstIndex(where: { (c: Character) -> Bool in
				return CharacterSet.decimalDigits.contains(c.unicodeScalars.first!) || (c == Character("-"))
			})!)
			let xRange = row.indices.startIndex ..< row.firstIndex(where: { (c: Character) -> Bool in
				return !(CharacterSet.decimalDigits.contains(c.unicodeScalars.first!) || (c == Character("-")))
			})!
			star.x = Int(String(row[xRange]))!
			row.removeSubrange(xRange)
			row.removeSubrange(row.indices.startIndex ..< row.firstIndex(where: { (c: Character) -> Bool in
				return CharacterSet.decimalDigits.contains(c.unicodeScalars.first!) || (c == Character("-"))
			})!)
			let yRange = row.indices.startIndex ..< row.firstIndex(where: { (c: Character) -> Bool in
				return !(CharacterSet.decimalDigits.contains(c.unicodeScalars.first!) || (c == Character("-")))
			})!
			star.y = Int(String(row[yRange]))!
			row.removeSubrange(yRange)
			row.removeSubrange(row.indices.startIndex ..< row.firstIndex(where: { (c: Character) -> Bool in
				return CharacterSet.decimalDigits.contains(c.unicodeScalars.first!) || (c == Character("-"))
			})!)
			let vxRange = row.indices.startIndex ..< row.firstIndex(where: { (c: Character) -> Bool in
				return !(CharacterSet.decimalDigits.contains(c.unicodeScalars.first!) || (c == Character("-")))
			})!
			star.vx = Int(String(row[vxRange]))!
			row.removeSubrange(vxRange)
			row.removeSubrange(row.indices.startIndex ..< row.firstIndex(where: { (c: Character) -> Bool in
				return CharacterSet.decimalDigits.contains(c.unicodeScalars.first!) || (c == Character("-"))
			})!)
			let vyRange = row.indices.startIndex ..< row.firstIndex(where: { (c: Character) -> Bool in
				return !(CharacterSet.decimalDigits.contains(c.unicodeScalars.first!) || (c == Character("-")))
			})!
			star.vy = Int(String(row[vyRange]))!
			row.removeSubrange(vyRange)
			
			stars.append(star)
		}
	}
	
	func forward(jump: Int) {
		time += jump
		for star in stars {
			star.x += jump * star.vx
			star.y += jump * star.vy
		}
	}
	
	func printSky() {
		var xmax = Int.min
		var xmin = Int.max
		var ymax = Int.min
		var ymin = Int.max
		for star in stars {
			xmax = max(xmax, star.x)
			xmin = min(xmin, star.x)
			ymax = max(ymax, star.y)
			ymin = min(ymin, star.y)
		}
		let deltax = xmax - xmin
		let deltay = ymax - ymin
		var printout = [[Bool]]()
		for x in xmin...xmax {
			printout.append([Bool](repeating: false, count: deltay + 1))
		}
		for star in stars {
			printout[star.x - xmin][star.y - ymin] = true
		}
		var stringout = ""
		for y in ymin...ymax {
			for x in xmin...xmax {
				stringout.append(contentsOf: printout[x - xmin][y - ymin] ? "#" : ".")
			}
			stringout.append(contentsOf: "\n")
		}
		print(stringout)
	}
	
	public var solution1: Int {
		forward(jump: 10000)
		var minA = Int.max
		var minAtime = 0
		var deltaxmin = Int.max
		var deltaymin = Int.max
		for i in 0..<1000 {
			var xmax = Int.min
			var xmin = Int.max
			var ymax = Int.min
			var ymin = Int.max
			var deltax = Int.max
			var deltay = Int.max
			forward(jump: 1)
			for star in stars {
				xmax = max(xmax, star.x)
				xmin = min(xmin, star.x)
				ymax = max(ymax, star.y)
				ymin = min(ymin, star.y)
			}
			deltax = xmax - xmin
			deltay = ymax - ymin
			let A = deltax * deltay
			if A < minA {
				minA = A
				minAtime = time
				deltaxmin = deltax
				deltaymin = deltay
			}
			if time == 10659 {
				print("Haha!")
				printSky()
			}
		}
		return 0
	}
	
	public var solution2: Int {
		return 0
	}
}
