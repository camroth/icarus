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

}
