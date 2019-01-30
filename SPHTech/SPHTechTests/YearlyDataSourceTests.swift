//
//  YearlyDataSourceTests.swift
//  SPHTechTests
//
//  Created by Ashutosh Dubey on 30/01/19.
//  Copyright © 2019 SPHTech. All rights reserved.
//

import XCTest

@testable import SPHTech

class YearlyDataSourceTests: XCTestCase {
    
    var dataSource : YearlyDataSource!

    override func setUp() {
        super.setUp()
        dataSource = YearlyDataSource()
    }

    override func tearDown() {
        dataSource = nil
        super.tearDown()
    }

    func testEmptyValueInDataSource() {

        // giving empty data value
        dataSource.data.value = []

        let tableView = UITableView()
        tableView.dataSource = dataSource

        // expected one section
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "Expected one section in table view")

        // expected zero cells
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 0, "Expected no cell in table view")
    }

    func testValueInDataSource() {

        // giving data value
        let dummyVM1 = YearlyMobileDataModel(year: 2018, volume: 32.994821)
        let dummyVM2 = YearlyMobileDataModel(year: 2017, volume: 22.894123)
        dataSource.data.value = [dummyVM1, dummyVM2]

        let tableView = UITableView()
        tableView.dataSource = dataSource

        // expected one section
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "Expected one section in table view")

        // expected two cells
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 2, "Expected two cell in table view")
    }

    func testValueCell() {

        // giving data value
        let dummyVM1 = YearlyMobileDataModel(year: 2018, volume: 32.994821)
        dataSource.data.value = [dummyVM1]

        let tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: kYearlyCellID)

        let indexPath = IndexPath(row: 0, section: 0)

        guard let _ = dataSource.tableView(tableView, cellForRowAt: indexPath) as? UITableViewCell else {
            XCTAssert(false, "Expected UITableViewCell class")
            return
        }
    }
    
}
