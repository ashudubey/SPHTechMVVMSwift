//
//  NetworkConstaants.swift
//  SPHTech
//
//  Created by Ashutosh Dubey on 29/01/19.
//  Copyright © 2019 SPHTech. All rights reserved.
//

import Foundation

//MARK:- Service Helper
enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}

protocol ServiceHelperProtocol : class {
    func fetchMobileData(_ completion: @escaping ((Result<MobileData, ErrorResult>) -> Void))
}


