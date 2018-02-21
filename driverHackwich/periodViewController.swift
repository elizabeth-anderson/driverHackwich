//
//  periodViewController.swift
//  driverHackwich
//
//  Created by Elizabeth on 2/8/18.
//  Copyright © 2018 Elizabeth. All rights reserved.
//

import UIKit

class periodViewController: UIViewController {

    var period = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onPeriodButtonTapped(_ sender: UIButton)
    {
        period = (sender.titleLabel?.text)!
        
        performSegue(withIdentifier: "PeriodToNamesSegue", sender: nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! ViewController
        dvc.period = period
       
        
        
    }
    

}
