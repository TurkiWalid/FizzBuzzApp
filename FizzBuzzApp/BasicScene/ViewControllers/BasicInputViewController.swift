//
//  BasicInputFormViewController.swift
//  FizzBuzzApp
//
//  Created by Walid on 26/9/2022.
//

import UIKit

class BasicInputViewController: UIViewController, Storyboarded {
    static var storyboardName: String {
        return "BasicInput"
    }
    var coordinator: BasicSceneCoordinator?
    var vm: InputCheckProtocol?
    
    @IBOutlet weak var int1TextField: UITextField!
    @IBOutlet weak var int2TextField: UITextField!
    @IBOutlet weak var limitTextField: UITextField!
    @IBOutlet weak var key1TextField: UITextField!
    @IBOutlet weak var key2TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "FizzBuzz"
        vm = BasicInputViewModel(formValidator: BasicInputFormValidator())
    }
    
    @IBAction func didClickOnGo(_ sender: Any) {
        let inputFormModel = BasicInputFormModel(int1: int1TextField.text!, int2: int2TextField.text!, limit: limitTextField.text!, key1: key1TextField.text!, key2: key2TextField.text!)
        vm?.doFizz(with: inputFormModel){inputIterableModel in
            self.coordinator?.goToResult(with: inputIterableModel)
        } didFail:{ (error) in
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            let action = UIAlertAction(title: "Try again", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }
}
