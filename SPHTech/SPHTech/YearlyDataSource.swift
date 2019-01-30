//
//  YearlyDataSource.swift
//  SPHTech
//
//  Created by Ashutosh Dubey on 30/01/19.
//  Copyright © 2019 SPHTech. All rights reserved.
//

import Foundation
import UIKit

let kYearlyCellID = "yearlyCellID"


class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class YearlyDataSource : GenericDataSource<YearlyMobileDataModel>, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell configuration
        let cell = tableView.dequeueReusableCell(withIdentifier: kYearlyCellID, for: indexPath)
        cell.selectionStyle = .none
        // Set cell data
        let model = self.data.value[indexPath.row]
        cell.textLabel?.text =  String(format:"%0.6f in petabytes",model.volume)
        cell.detailTextLabel?.text = String(format:"Year: %d",model.year)
        return cell
    }
}
