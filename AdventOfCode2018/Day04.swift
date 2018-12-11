//
//  Day04.swift
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

import Foundation

public class Day04 {
	public static let day = 4
	
	class TimeNote {
		var time: Date
		var newGuard: Int?
		var asleep: Bool?
		
		var day: Int
		var hour: Int
		var minute: Int
		
		init(descriptor: String) {
			var sub = Substring(descriptor)
			sub.removeFirst()
			let dateDescriptor = String(sub.prefix(upTo: sub.firstIndex(of: Character("]"))!))
			let formatter = DateFormatter()
			formatter.dateFormat = "yyyy-MM-dd HH:mm"
			time = formatter.date(from: dateDescriptor)!
			sub.removeSubrange(sub.indices.first! ... sub.firstIndex(of: Character("]"))!)
			sub.removeFirst()
			let firstWordSub = sub.prefix(upTo: sub.firstIndex(of: Character(" "))!)
			let firstWord = String(firstWordSub)
			if firstWord == "falls" {
				asleep = true
			} else if firstWord == "wakes" {
				asleep = false
			} else if firstWord == "Guard" {
				sub.removeSubrange(firstWordSub.startIndex ... firstWordSub.endIndex)
				sub.removeFirst()
				let guardIDString = sub.prefix { (c: Character) -> Bool in
					return "0" ... "9" ~= c
				}
				newGuard = Int(String(guardIDString))!
			} else {
				fatalError()
			}
			
			let dayPrinter = DateFormatter()
			dayPrinter.dateFormat = "dd"
			day = Int(dayPrinter.string(from: time))!
			
			let hourPrinter = DateFormatter()
			hourPrinter.dateFormat = "HH"
			hour = Int(hourPrinter.string(from: time))!
			
			let minutePrinter = DateFormatter()
			minutePrinter.dateFormat = "mm"
			minute = Int(minutePrinter.string(from: time))!
		}
	}
	
	var notes: [TimeNote]
	
	let input: AdventOfCode2018
	public required init(input: AdventOfCode2018) {
		self.input = input
		notes = input.inputRows(day: Day04.day).map({ (descriptor: String) -> TimeNote in
			return TimeNote(descriptor: descriptor)
		})
		notes.sort { (lhs: Day04.TimeNote, rhs: Day04.TimeNote) -> Bool in
			return lhs.time < rhs.time
		}
//		var guardID = 0
		for note in notes {
			if let noteGuardID = note.newGuard {
				print("****** \(noteGuardID) ******")
			} else {
				print("\(note.day): \(note.minute), \(note.asleep!)")
			}
		}
	}
	
	public var solution1: Int { return 0 }
	
	public var solution2: Int { return 0 }
}

