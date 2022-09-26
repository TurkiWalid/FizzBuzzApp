//
//  OutputProtocol.swift
//  FizzBuzzApp
//
//  Created by Walid on 26/9/2022.
//

import Foundation
import UIKit

protocol OutputProtocol: UITableViewDataSource {
    func getCellValue(from index: Int) -> String
}
