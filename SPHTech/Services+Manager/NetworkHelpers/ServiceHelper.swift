//
//  ServiceHelper.swift
//  SPHTech
//
//  Created by Ashutosh Dubey on 29/01/19.
//  Copyright © 2019 SPHTech. All rights reserved.
//

import Foundation

let API_URL = "https://data.gov.sg/api/action/datastore_search?resource_id=a807b7ab-6cad-4aa6-87d0-e283a7353a0f"

final class ServiceHelper : RequestHandler, ServiceHelperProtocol {

    static let shared = ServiceHelper()

    let apiUrlStr = API_URL
    var task : URLSessionTask?

    func fetchMobileData(_ completion: @escaping ((Result<MobileData, ErrorResult>) -> Void)) {

        // cancel previous request if already in progress
        self.cancelRequest()
        task = RequestService().loadData(urlString: apiUrlStr, completion: self.networkResult(completion: completion))
    }

    func cancelRequest() {

        if let task = task {
            task.cancel()
        }
        task = nil
    }
}

