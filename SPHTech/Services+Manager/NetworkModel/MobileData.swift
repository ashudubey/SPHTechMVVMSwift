//
//  MobileData.swift
//  SPHTech
//
//  Created by Ashutosh Dubey on 29/01/19.
//  Copyright © 2019 SPHTech. All rights reserved.
//

import Foundation


struct MobileData {
    let resource_id: String
    let records: [QuarterlyMobileData]
}

extension MobileData: Parsable {
    static func parseObject(dictionary: [String : AnyObject]) -> Result<MobileData, ErrorResult> {
        if let result = dictionary["result"] as? [String: Any] {
            let resource_id = result["resource_id"] as! String

            if let records = result["records"] as? [[String: Any]] {
                let quarterly = records.map({ QuarterlyMobileData(quarterlyDict: $0)}).compactMap{$0}
                let meta = MobileData(resource_id: resource_id, records: quarterly)
                return Result.success(meta)
            } else {
                return Result.failure(ErrorResult.parser(string: "Unable to parse API response"))
            }
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse API response"))
        }
    }
}

struct QuarterlyMobileData {
    let  quarterName: String
    let  volume: String

    init?(quarterlyDict: Dictionary<String,Any>)
    {
        guard let _ = quarterlyDict["quarter"] as? String else {
            return nil
        }

        self.quarterName = quarterlyDict["quarter"] as! String
        self.volume = quarterlyDict["volume_of_mobile_data"] as! String
    }
}
