//
//  ControlContainerView.swift
//  TwoTableViewTest
//
//  Created by The App Experts on 04/09/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

protocol ControlContainerViewDelegate{
    func updateValueInTable(with text: String, for tableTag: Int)
}

class ControlContainerView: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var text:String?
    var tableTag:Int?
    var delegate:ControlContainerViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let text = self.text {
            self.textField.text = text
        }
    }
    @IBAction func doSave(_ sender: UIButton) {
        self.text = self.textField.text
        if let text = self.text, let tableTag = self.tableTag {
            self.delegate?.updateValueInTable(with: text, for: tableTag)
        }
        self.navigationController?.popViewController(animated: true)
    }
}
