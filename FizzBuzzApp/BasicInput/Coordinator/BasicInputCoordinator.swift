//
//  BasicInputCoordinator.swift
//
//  Created by Walid on 29/8/2022.
//

import Foundation
import UIKit

class BasicInputCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = BasicInputFormViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToResult(with data: InputIterableModel){
        let vc = BasicResultViewController.instantiate()
        vc.coordinator = self
        vc.vm = BasicResultViewModel(inputIterableModel: data)
        navigationController.pushViewController(vc, animated: true)
    }
}
