//
//  Parameter.swift
//  CommandCougar
//
//  Copyright (c) 2017 Surf & Neptune LLC (http://surfandneptune.com/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

public struct Parameter {
	public enum Description: Equatable {
		case required(String)
		case optional(String)

		/// The associated value of this parameter
		public var value: String {
			switch self {
			case .required (let s):
				return s
			case .optional (let s):
				return s
			}
		}

		/// The formatted text value of this parameter used in the help menu
		public var formattedValue: String {
			switch self {
			case .required:
				return "<\(value)>"
			case .optional:
				return "[<\(value)>]"
			}
		}

		/// Is this parameter required
		public var isRequired: Bool {
			switch self {
			case .required: return true
			default: return false
			}
		}

		/// Is this parameter optional
		public var isOptional: Bool {
			return !isRequired
		}

		public static func ==(lhs: Description, rhs: Description) -> Bool {
			switch (lhs, rhs) {
			case (.required(let a), .required(let b)), (.optional(let a), .optional(let b)):
				return a == b
			default:
				return false
			}
		}
	}


	/// The evaulated version of a parameter is just a string
	public typealias evaluation = String
}
