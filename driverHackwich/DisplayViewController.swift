//
//  DisplayViewController.swift
//  driverHackwich
//
//  Created by Victoria Anderson on 2/26/18.
//  Copyright © 2018 Elizabeth. All rights reserved.
//

import UIKit //step 4

class DisplayViewController: UIViewController

{
    var names = [String]()
    let defaults = UserDefaults.standard
    var period = String()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.title = period
//        for i in 0..<nameLabels.count
//        {
//            nameLabels[i].text = String(i)
//
//        }
        
    }
    @IBOutlet var nameLabels: [UILabel]!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let dvc = segue.destination as! ViewController
        dvc.period = period
    }
    
    func resetNames ()
    {
        for i in 0..<min(names.count, nameLabels.count)
        {
            nameLabels[i].text = names[i]
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let savedData = defaults.object(forKey: period) as? [String]
        {
            names = savedData
        }
        resetNames()
    }

   
    

  

}
