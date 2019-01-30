//
//  YearlyMobileDataViewModel.swift
//  SPHTech
//
//  Created by Ashutosh Dubey on 30/01/19.
//  Copyright © 2019 SPHTech. All rights reserved.
//

import Foundation

extension Sequence {
    func group<U: Hashable>(by key: (Iterator.Element) -> U) -> [U:[Iterator.Element]] {
        return Dictionary.init(grouping: self, by: key)
    }
}

struct YearlyMobileDataViewModel {

    weak var service: ServiceHelperProtocol?
    weak var dataSource : GenericDataSource<YearlyMobileDataModel>?


    init(service: ServiceHelperProtocol = ServiceHelper.shared, dataSource : GenericDataSource<YearlyMobileDataModel>?) {
        self.service = service
        self.dataSource = dataSource
    }

    func fetchMobileData(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {

        guard let service = service else {
            completion?(Result.failure(ErrorResult.custom(string: "Missing service")))
            return
        }

        service.fetchMobileData() { result in

            DispatchQueue.main.async {
                switch result {
                case .success(let metaData) :
                    let quarterlyMobileData = metaData.records

                    let yearlyGroups = quarterlyMobileData.group(by: {$0.quarterName.components(separatedBy: "-").first!})

                    var yearlyGroupsConsolidatedVolume =  yearlyGroups.map{ element -> YearlyMobileDataModel in
                        YearlyMobileDataModel(year: Int(element.key)!, volume: element.value.map({ (item: QuarterlyMobileData)  in
                            return Double(item.volume)!
                        }).reduce(0, +))
                    }

                    yearlyGroupsConsolidatedVolume = yearlyGroupsConsolidatedVolume.filter({ (item: YearlyMobileDataModel) -> Bool in
                        item.year >= 2008 // 2008 to 2018 only
                    }).sorted(by: { (item1: YearlyMobileDataModel, item2: YearlyMobileDataModel) -> Bool in
                        item1.year < item2.year
                    })

                    print(yearlyGroupsConsolidatedVolume)

                    self.dataSource?.data.value = yearlyGroupsConsolidatedVolume
                    completion?(Result.success(true))

                    break
                case .failure(let error) :
                    print("Parser error \(error)")
                    completion?(Result.failure(error))

                    break
                }
            }
        }
    }
}
