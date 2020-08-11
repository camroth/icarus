//
//  DieTests.swift
//  IcarusTests
//
//  Created by Cameron Roth on 8/10/20.
//  Copyright © 2020 Cameron Roth. All rights reserved.
//

import XCTest
@testable import Icarus

class DieTests: XCTestCase {

  func test_init_withNoValue_isSixSidedDie() {
    XCTAssertEqual(Die()?.numberOfSides, 6)
  }

  func test_init_withEvenValue_hasThatManySides() {
    XCTAssertEqual(Die(numberOfSides: 4)?.numberOfSides, 4)
    XCTAssertEqual(Die(numberOfSides: 20)?.numberOfSides, 20)
    XCTAssertEqual(Die(numberOfSides: 100)?.numberOfSides, 100)
    XCTAssertEqual(Die(numberOfSides: NSInteger(INT_MAX) - 1)?.numberOfSides, NSInteger(INT_MAX) - 1)
  }

  func test_init_withOddValue_doesNotReturnDie() {
    XCTAssertNil(Die(numberOfSides: 3))
    XCTAssertNil(Die(numberOfSides: 19))
    XCTAssertNil(Die(numberOfSides: 99))
  }

  func test_init_withZeroSides_doesNotReturnDie() {
    XCTAssertNil(Die(numberOfSides: 0))
  }

  func test_roll_generatesNumbersBetweenOneAndNumberOfSides() {
    if let d20 = Die(numberOfSides: 20) {
      XCTAssertEqual(d20.numberOfSides, 20)

      var rolls: [NSInteger: NSInteger] = [:]

      for _ in 1...1000000 {
        let rollValue = d20.roll()
        XCTAssertGreaterThan(rollValue, 0)
        XCTAssertLessThanOrEqual(rollValue, d20.numberOfSides)

        // Look up the number of previous rolls with the same value
        // ?? 0 == default to 0 if no previous rolls with this value are found
        let numberOfRollsWithSameValue = rolls[rollValue] ?? 0
        rolls[rollValue] = numberOfRollsWithSameValue + 1
      }

      // print("\(rolls)")
    }
  }

}
