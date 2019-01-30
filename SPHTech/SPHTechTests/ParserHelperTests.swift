//
//  ParserHelperTests.swift
//  SPHTechTests
//
//  Created by Ashutosh Dubey on 30/01/19.
//  Copyright © 2019 SPHTech. All rights reserved.
//

import XCTest

@testable import SPHTech

let kSampleResponse =  "SampleResponse"

let kSampleRecordCount =  56

class ParserHelperTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testParseEmptyMobileData() {

        // giving empty data
        let data = Data()

        // giving completion after parsing
        // expected valid MobileData
        let completion : ((Result<MobileData, ErrorResult>) -> Void) = { result in
            switch result {
            case .success(_):
                XCTAssert(false, "Expected failure when no data")
            default:
                break
            }
        }

        ParserHelper.parse(data: data, completion: completion)
    }

    func testParseMobileData() {

        // giving a sample json file
        guard let data = FileManager.readJson(forResource: kSampleResponse) else {
            XCTAssert(false, "Can't get data from sample response")
            return
        }

        // giving completion after parsing
        // expected valid converter with valid data
        let completion : ((Result<MobileData, ErrorResult>) -> Void) = { result in
            switch result {
            case .failure(_):
                XCTAssert(false, "Expected valid Data")
            case .success(let mobileData):
                XCTAssertEqual(mobileData.records.count, kSampleRecordCount, "Expected \(kSampleRecordCount)")
            }
        }

        ParserHelper.parse(data: data, completion: completion)
    }

}

extension FileManager {

    static func readJson(forResource fileName: String ) -> Data? {

        let bundle = Bundle(for: ParserHelperTests.self)
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                // handle error
            }
        }

        return nil
    }
}
