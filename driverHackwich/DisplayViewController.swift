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
    var period = String()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.title = period
        for i in 0..<nameLabels.count
        {
            nameLabels[i].text = String(i)
            
        }
        
    }
    @IBOutlet var nameLabels: [UILabel]!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let dvc = segue.destination as! ViewController
        dvc.period = period
    }

   
    

  

}
