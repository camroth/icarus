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

      // var                      = Define a _var_iable value we can mutate
      // rolls                    = the name of the variable
      // [NSInteger: NSInteger]   = this dictionary will represent a key/value store of an
      //                            NSInteger as the key to an NSInteger as the value
      // = [:] 	                  = set this to be an empty dictionary right now
      //                            (nil keys, nil values)
      var rolls: [NSInteger: NSInteger] = [:]

      // for            = do this this many times
      // _              = make the current value of the loop anonymous because we don't care
      //                  about its actual value/we don't need to use which iteration we're on
      // in 1...1000000 = start at 1 and continue up to and including 1000000 (vs. ..< which
      //                  would be up to and not including 1000000)
      for _ in 1...1000000 {
        let rollValue = d20.roll()
        // Verify we did not roll a 0
        XCTAssertGreaterThan(rollValue, 0)
        // Verify we did not roll greater than the biggest number on the die
        XCTAssertLessThanOrEqual(rollValue, d20.numberOfSides)

        // Look up the number of previous rolls with the same value (?? 0 = default to 0 if no
        // previous rolls with this value are found
        let numberOfRollsWithSameValue = rolls[rollValue] ?? 0
        rolls[rollValue] = numberOfRollsWithSameValue + 1
      }

      // Let's verify that we got at least one 1 (it's possible we _may not have_, and that
      // that "key" in the dictionary doesn't exist, so we need to default to 0 if we don't
      // find any)
      XCTAssertGreaterThan(rolls[1] ?? 0, 0)

      // Let's verify that we got at least one 20 (it's possible we _may not have_, and that
      // that "key" in the dictionary doesn't exist, so we need to default to 0 if we don't
      // find any)
      XCTAssertGreaterThan(rolls[d20.numberOfSides] ?? 0, 0)

      // Nicely and sortedly print out the rolled values
      for i in 1...d20.numberOfSides {
        let numberOfRollsWithValue = rolls[i] ?? 0
        print("Rolled \(numberOfRollsWithValue) \(i)s")
      }
    }
  }

}
