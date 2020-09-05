//
//  ViewController.swift
//  TwoTableViewTest
//
//  Created by The App Experts on 04/09/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topTableView: UITableView!
    @IBOutlet weak var bottomTableView: UITableView!
    let topTableName:String = "top"
    let bottomTableName:String = "bottom"
    var topTableArray:[String] = ["0", "1", "2", "3", "4" ]
    var bottomTableArray:[String] = ["zero", "one", "two", "three", "four", "five"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.topTableView.dataSource = self
        self.topTableView.delegate = self
        self.bottomTableView.dataSource = self
        self.bottomTableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        if tableView === self.topTableView{
            count = self.topTableArray.count
        }
        
        if tableView === self.bottomTableView {
            count = self.bottomTableArray.count
        }
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        if tableView === self.topTableView {
            cell.textLabel?.text = self.topTableArray[indexPath.row]
            cell.backgroundColor = .cyan
        }
        
        if tableView === self.bottomTableView {
            cell.textLabel?.text = self.bottomTableArray[indexPath.row]
            cell.backgroundColor = .yellow
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
        let controlContainerView =    storyboard.instantiateViewController(identifier: "ControlContainerView") as! ControlContainerView
        if tableView === self.topTableView{
            controlContainerView.text = topTableArray[indexPath.row]
            controlContainerView.tableName = self.topTableName
            controlContainerView.delegate = self
        }
        
        if tableView === self.bottomTableView{
            controlContainerView.text = bottomTableArray[indexPath.row]
            controlContainerView.tableName = self.bottomTableName
            controlContainerView.delegate = self
        }
    self.navigationController?.pushViewController(controlContainerView, animated: true)
    }
}

extension ViewController: ControlContainerViewDelegate{
    func updateValueInTable(with text: String, for tableName: String) {
        if tableName == topTableName {
            guard let updateIndex1 = self.topTableView.indexPathForSelectedRow?.row else {return}
            self.topTableArray[updateIndex1] = text
            self.topTableView.reloadData()
        }
        if tableName == bottomTableName {
            guard let updateIndex2 = self.bottomTableView.indexPathForSelectedRow?.row else {return}
            self.bottomTableArray[updateIndex2] = text
            self.bottomTableView.reloadData()
        }
    }
    
    
}
