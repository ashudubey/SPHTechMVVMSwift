//
//  YearlyMobileDataViewModelTests.swift
//  SPHTechTests
//
//  Created by Ashutosh Dubey on 30/01/19.
//  Copyright © 2019 SPHTech. All rights reserved.
//

import XCTest

@testable import SPHTech

class YearlyMobileDataViewModelTests: XCTestCase {

    var viewModel : YearlyMobileDataViewModel!
    var dataSource : GenericDataSource<YearlyMobileDataModel>!
    fileprivate var service : MockServiceHelper!
    var viewModelWithData : YearlyMobileDataViewModel!
    fileprivate var serviceWithData : MockServiceHelperWithData!


    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.service = MockServiceHelper()
        self.serviceWithData = MockServiceHelperWithData()
        self.dataSource = GenericDataSource<YearlyMobileDataModel>()
        self.viewModel = YearlyMobileDataViewModel(service: self.service, dataSource: dataSource)
        self.viewModelWithData = YearlyMobileDataViewModel(service: self.serviceWithData, dataSource: dataSource)
    }

    override func tearDown() {
        self.viewModel = nil
        self.dataSource = nil
        self.service = nil
        super.tearDown()
    }

    func testFetchWithNoService() {

        // giving no service to a view model
        viewModel.service = nil

        // expected to not be able to fetch data
        viewModel.fetchMobileData{ result in
            switch result {
            case .success(_) :
                XCTAssert(false, "ViewModel should not be able to fetch without service")
            default:
                break
            }
        }
    }

    func testFetchMobileData() {
        // expected completion to succeed

        viewModelWithData.fetchMobileData { result in
            switch result {
            case .failure(_) :
                XCTAssert(false, "ViewModel should not be able to fetch without service")
            default:
                break
            }
        }
    }

    func testFetchNoMobileData() {

        // expected completion to fail
        viewModel.fetchMobileData { result in
            switch result {
            case .success(_) :
                XCTAssert(false, "ViewModel should not be able to fetch")
            default:
                break
            }
        }
    }
}

fileprivate class MockServiceHelper : ServiceHelperProtocol {
    var mobileData: MobileData?
    func fetchMobileData(_ completion: @escaping ((Result<MobileData, ErrorResult>) -> Void)) {
        if let mobileData = mobileData {
            completion(Result.success(mobileData))
        } else {
            completion(Result.failure(ErrorResult.custom(string: "No Data")))
        }
    }
}

fileprivate class MockServiceHelperWithData : ServiceHelperProtocol {

    var mobileData: MobileData? = MobileData(resource_id: "yyyuu-888-uuUuu", records: [QuarterlyMobileData(quarterlyDict: ["quarter": "2018-Q1", "volume_of_mobile_data": "16.47121"])!])

    func fetchMobileData(_ completion: @escaping ((Result<MobileData, ErrorResult>) -> Void)) {
        if let mobileData = mobileData {
            completion(Result.success(mobileData))
        } else {
            completion(Result.failure(ErrorResult.custom(string: "No Data")))
        }
    }
}
