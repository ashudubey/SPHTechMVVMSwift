//
//  SPHTechUITests.swift
//  SPHTechUITests
//
//  Created by Ashutosh Dubey on 29/01/19.
//  Copyright © 2019 SPHTech. All rights reserved.
//

import XCTest

class SPHTechUITests: XCTestCase {
        
    var app = XCUIApplication()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testTableInteraction() {
        // Assert that we are displaying the tableview
        app.launch()

        sleep(15)
        let cells = app.tables.cells

        // Get an array of cells
        if cells.count > 0 {
            let count: Int = (cells.count - 1)

            let promise = expectation(description: "Wait for table cells")

            for i in stride(from: 0, to: count , by: 1) {
                // Grab the first cell and verify that it exists and tap it
                let tableCell = cells.element(boundBy: i)

                XCTAssertTrue(tableCell.exists, "The \(i) cell is in place on the table")

                if i == (count - 1) {
                    promise.fulfill()
                }

            }

            waitForExpectations(timeout: 50, handler: nil)
            XCTAssertTrue(true, "Finished validating the table cells")
        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }
    }
    
}
