//
//  ServiceHelperTests.swift
//  SPHTechTests
//
//  Created by Ashutosh Dubey on 30/01/19.
//  Copyright © 2019 SPHTech. All rights reserved.
//

import XCTest

@testable import SPHTech

class ServiceHelperTests: XCTestCase {

    func testCancelRequest() {

        // giving a "previous" session
        ServiceHelper.shared.fetchMobileData { (_) in
            // ignore call
        }

        // Expected to task nil after cancel
        ServiceHelper.shared.cancelRequest()
        XCTAssertNil(ServiceHelper.shared.task, "Expected task nil")
    }
}
