//
//  ControlContainerView.swift
//  TwoTableViewTest
//
//  Created by The App Experts on 04/09/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

protocol ControlContainerViewDelegate{
    func updateValueInTable(with text: String, for tableName: String)
}

class ControlContainerView: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var text:String?
    var tableName:String?
    var delegate:ControlContainerViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.delegate.debugDescription)
        if let text = self.text {
            self.textField.text = text
        }
    }
    @IBAction func doSave(_ sender: UIButton) {
        self.text = self.textField.text
        if let text = self.text, let tableName = self.tableName {
            self.delegate?.updateValueInTable(with: text, for: tableName)
        }
        self.navigationController?.popViewController(animated: true)
    }
}
