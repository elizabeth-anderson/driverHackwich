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
    @IBOutlet weak var startButton: UIButton!
    var names = [String]()
    let defaults = UserDefaults.standard
    var period = String()
    var timer = Timer()
    var cycle = Double()
  
    
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
        cycle = 2.0
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

    @objc func updateDisplay() {
        resetTimer()
        var nameLabelIndices = [Int]()
        for i in 0..<nameLabels.count
               {
                if nameLabels[i].text != ""{
                    nameLabelIndices.append(i)
                }
               }
        let randomPick = Int(arc4random_uniform(UInt32(nameLabelIndices.count)))
        nameLabels[nameLabelIndices[randomPick]].text = ""
        if nameLabelIndices.count <= 2 {
            timer.invalidate()
            startButton.setTitle("Reset", for: .normal)
            startButton.backgroundColor = UIColor.yellow
        }
        
    }
    
    func resetTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: cycle, target: self, selector: #selector(updateDisplay), userInfo: nil, repeats: true)
        cycle += 0.2
    }
    
   
    @IBAction func onStartButtonTapped(_ sender: Any) {
        let title = startButton.titleLabel!.text!
        switch title {
        case "Start" :
            resetTimer()
            startButton.setTitle("Stop", for: .normal)
            startButton.backgroundColor = UIColor.red
        case "Stop" :
            timer.invalidate()
            startButton.setTitle("Reset", for: .normal)
            startButton.backgroundColor = UIColor.yellow
        default:
            updateDisplay()
            startButton.setTitle("Start", for: .normal)
            startButton.backgroundColor = UIColor.green
            resetNames()
        }
        
    }
    

  

}
