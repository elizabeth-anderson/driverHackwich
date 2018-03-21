//
//  DisplayViewController.swift
//  driverHackwich
//
//  Created by Victoria Anderson on 2/26/18.
//  Copyright © 2018 Elizabeth. All rights reserved.
//

import UIKit //step 4

class DisplayViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var labelView: UIView!
    var names = [String]() {
        didSet {
            defaults.set(names, forKey: period)
        }
    }
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
        finalPickLabel.text = ""
        cycle = 2.0
        for i in 0..<min(names.count, nameLabels.count)
        {
            nameLabels[i].text = names[i]
            nameLabels[i].textColor = UIColor.black
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let savedData = defaults.object(forKey: period) as? [String]
        {
            names = savedData
        }
        resetNames()
    }

    @IBOutlet weak var finalPickLabel: UILabel!
    
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
      
        if nameLabelIndices.count <= 1
        {
            let pickedName = nameLabels[nameLabelIndices[0]].text
            finalPickLabel.text = pickedName
            names.remove(at: names.index(of: pickedName!)!)
            names.append(pickedName!)
            timer.invalidate()
            startButton.setTitle("Reset", for: .normal)
            startButton.backgroundColor = UIColor.yellow
        }
          nameLabels[nameLabelIndices[randomPick]].text = ""
    }
    
    
    
    func resetTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: cycle, target: self, selector: #selector(updateDisplay), userInfo: nil, repeats: true)
        cycle += 0.2
    }
    
    func removeGrayNames() {
        for nameLabel in nameLabels {
            if nameLabel.textColor == UIColor.gray {
                nameLabel.text = ""
            }
        }
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
            startButton.setTitle("Start", for: .normal)
            startButton.backgroundColor = UIColor.green
            resetNames()
        }
        
    }
    
    @IBAction func onTappedNameLabel(_ sender: UITapGestureRecognizer) {
        for nameLabel in nameLabels {
            if nameLabel.frame.contains(sender.location(in: labelView)) {
                if nameLabel.textColor == UIColor.black {
                    nameLabel.textColor = UIColor.gray
                }
                else {
                    nameLabel.textColor = UIColor.black
                }
            }
        }
        removeGrayNames()
        
    }
    
    
  

}
