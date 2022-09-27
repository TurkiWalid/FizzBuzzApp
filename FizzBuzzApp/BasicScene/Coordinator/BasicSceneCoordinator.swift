//
//  BasicInputCoordinator.swift
//
//  Created by Walid on 29/8/2022.
//

import Foundation
import UIKit

class BasicSceneCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = BasicInputViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToResult(with data: InputIterableModel){
        let vc = BasicResultViewController.instantiate()
        vc.coordinator = self
        do {
           let vm = try BasicResultViewModel(inputIterableModel: data)
            vc.vm = vm
            navigationController.pushViewController(vc, animated: true)
        } catch {
            self.showInternalErrorAlert()
        }
    }
    
    private func showInternalErrorAlert() {
        let alert = UIAlertController(title: "InternalError", message: "Something happend", preferredStyle: .alert)
        let action = UIAlertAction(title: "Try again", style: .default)
        alert.addAction(action)
        navigationController.present(alert, animated: true)
    }
}
