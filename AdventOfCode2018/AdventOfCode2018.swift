//
//  AdventOfCode2018.swift
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

public class AdventOfCode2018 {
	public static let defaultInput = AdventOfCode2018()
	
	let source: URL
	
	internal init() {
		self.source = Bundle(for: AdventOfCode2018.self).resourceURL!
	}
	
	public init(source: URL) {
		self.source = source
	}
	
	func urlFor(day: Int) -> URL {
		return source.appendingPathComponent("day\(String(format: "%02d", day)).txt")
	}
	
	public func inputData(day: Int) -> Data {
		return try! Data(contentsOf: urlFor(day: day))
	}
	
	public func inputString(day: Int) -> String {
		return try! String(contentsOf: urlFor(day: day))
	}
	
	public func inputRows(day: Int) -> [String] {
		return inputString(day: day).components(separatedBy: "\n")
	}
}
