//
//  BasicResultViewModel.swift
//  FizzBuzzApp
//
//  Created by Walid on 26/9/2022.
//

import Foundation
import UIKit

class BasicResultViewModel: NSObject, OutputProtocol {
    var basicinputIterableModel: BasicInputIterableModel!
    private var mainFactor: Int!
    
    init(inputIterableModel: InputIterableModel) throws {
        guard let basicinputIterableModel = inputIterableModel as? BasicInputIterableModel else {
            throw InputErrors.InputFormModelNotMatchingRequiredType
        }
        self.basicinputIterableModel = basicinputIterableModel
        mainFactor = self.basicinputIterableModel.int1 * self.basicinputIterableModel.int2
    }
    
    func getCellValue(from index: Int) -> String {
        let value = index + 1
        if value % mainFactor == 0{
            return basicinputIterableModel.bothKey
        }
        if value % basicinputIterableModel.int1 == 0 {
            return basicinputIterableModel.key1
        }
        if value % basicinputIterableModel.int2 == 0 {
            return basicinputIterableModel.key2
        }
        return "\(value)"
    }
}

//MARK: UITableView Datasource methods
extension BasicResultViewModel {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basicinputIterableModel.limit
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = getCellValue(from: indexPath.row)
        return cell
    }
    
}
