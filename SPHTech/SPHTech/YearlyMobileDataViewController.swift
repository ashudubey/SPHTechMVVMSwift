//
//  YearlyMobileDataViewController.swift
//  SPHTech
//
//  Created by Ashutosh Dubey on 29/01/19.
//  Copyright © 2019 SPHTech. All rights reserved.
//

import UIKit
import Reachability

let kEstimatedRowHeight: CGFloat = 100.0

let kOkButtonTitle = "OK"
let kNoNetworkErrorMessgae = "Internet is not availble. please check your internet setting and try again."


class YearlyMobileDataViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var dataSource = YearlyDataSource()

    lazy var viewModel : YearlyMobileDataViewModel = {
        let viewModel = YearlyMobileDataViewModel(dataSource: dataSource)
        return viewModel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Yearly Mobile Data Volume"

        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = kEstimatedRowHeight

        //Setup datasource
        self.tableView.dataSource = self.dataSource
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.tableView.reloadData()
        }

        // Fetch data if network available
        Reachability()?.connection != .none ? fetchMobileData() : showAlertWithMessgae(message: kNoNetworkErrorMessgae)

    }

    func fetchMobileData() {

        self.activityIndicator.startAnimating()
        self.viewModel.fetchMobileData({[weak self] result in

            self?.activityIndicator.stopAnimating()

            switch result {
            case .failure(let error):
                self?.showAlertWithMessgae(message: error.localizedDescription)

            default:
                print("sucess")
            }
        })
    }

    //MARK:- Alert
    func showAlertWithMessgae(message:String) {

        let alertView = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert)
        let action = UIAlertAction(title: kOkButtonTitle, style: .default, handler: nil)
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
    }

}

//MARK:- Extension for TableViewDelegate handling
extension YearlyMobileDataViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kEstimatedRowHeight
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1.0
    }
}

