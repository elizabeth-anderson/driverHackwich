//
//  ViewController.swift
//  driverHackwich
//
//  Created by Elizabeth on 2/6/18.
//  Copyright © 2018 Elizabeth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var names = [String]()
    var period = String()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tableView.isEditing = true
        loadTestNames()
        navigationItem.title = period
      
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
     
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = names[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let delete = UITableViewRowAction(style: .destructive, title: "delete") { (action, indexPath) in
            self.names.remove(at: indexPath.row)
            tableView.reloadData()
        }
        return [delete]
    }
    
    @IBAction func onPlusButtonTapped(_ sender: UIBarButtonItem)
    {
        let alert = UIAlertController(title: "add a name", message: nil, preferredStyle: .alert)
        alert.addTextField{ (textField) in
            textField.placeholder = "name"
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        let insertAction = UIAlertAction(title: "add", style: .default) { (action) in
            let nameTextField = alert.textFields![0] as UITextField
            let name = nameTextField.text
            self.names.append(name!)
            self.tableView.reloadData()
        }
        alert.addAction(insertAction)
        present(alert,animated: true,completion: nil)
    }
    
   func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.names[sourceIndexPath.row]
       names.remove(at: sourceIndexPath.row)
       names.insert(movedObject, at: destinationIndexPath.row)
        NSLog("%@", "\(sourceIndexPath.row) => \(destinationIndexPath.row) \(names)")
        self.tableView.reloadData()
    }
    
    func loadTestNames ()
    {
        switch period
        {
        case "1st period" :
            names = ["sue", "mary", "jim", "raplh", "tom"]
        case "2nd period" :
            names = ["bob", "jill", "timmy", "owen", "marsha", "felisha"]
        case "3rd period" :
            names = ["zack", "joey", "jacob", "mikey", "jackie", "beth", "victoria", "burke"]
        default:
            names = ["elizabeth", "beth", "liz", "bethany"]
        }
    }
    
    
    
    



}

