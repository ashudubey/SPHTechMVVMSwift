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
let kVolumeInPetabytes = "(Volume in Petabytes)"
let kSpaceString = " "


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
        let titleString =  String(format:"%0.6f",model.volume) + kSpaceString + kSpaceString + kVolumeInPetabytes

        let range = (titleString as NSString).range(of: kVolumeInPetabytes)
        let titleAttributedString = NSMutableAttributedString.init(string: titleString, attributes: [.font: UIFont.boldSystemFont(ofSize: 19.0)])
        titleAttributedString.addAttributes([.font: UIFont.systemFont(ofSize: 15.0, weight: .light)], range: range)

        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .light)
        cell.textLabel?.attributedText = titleAttributedString
        cell.detailTextLabel?.text = String(format:"Year: %d",model.year)
        return cell
    }
}
