//
//  ViewController.swift
//  Proximity Bart
//
//  Created by Riken Maharjan on 7/31/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    let numberSection = ["Richmond", "Ashby"]
    let station1 = ["Warm Springs","Warm Springs"]
    let station2 = ["Milbrae"]
    var sectionData: [Int:[String]]!
    var sectionColor: [Int:UIColor]!
    let deviceWidth = UIScreen.main.bounds.width
    
    var buttonStates:[Int:Bool]!
    
    var buttonState = false;
    
    let btnimage = UIImage(named: "Unmute")
    let btnImageDisabled =  UIImage(named: "Mute")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sectionData = [0: station1 , 1 : station2]
        
        sectionColor = [0: UIColor(displayP3Red: 255/255, green: 153/255, blue: 51/255, alpha: 1.0), 1: UIColor(displayP3Red: 255, green: 0, blue: 0, alpha: 1)]
        
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension TableViewController{
    
    
    
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return numberSection.count
        
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        cell.backgroundColor = sectionColor[indexPath.section]
       
        cell.textLabel?.text = sectionData[indexPath.section]![indexPath.row]
        
        cell.textLabel?.textColor = .white
        
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 24)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (sectionData[section]?.count)!
    }
    
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return numberSection[section]
//    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        
        
        view.backgroundColor = UIColor(displayP3Red: 92/255, green: 92/255, blue: 92/255, alpha: 1)
        
        
        let label = UILabel()
        label.text = numberSection[section]
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 24)
        label.frame = CGRect(x: 5, y: 5, width: 200, height: 35)
        view.addSubview(label)
        
        
        let button = UIButton()
        
        button.isSelected = false
        
        
        
        button.frame = CGRect(x: deviceWidth - 75, y: 7, width: 100, height: 35)
        
        
    
        button.setImage(btnimage, for: .normal)
        
        
        
        
        
//        button.setImage(btnImageDisabled, for: .selected)
        
        
        button.addTarget(self, action: #selector(help), for: .touchUpInside)
        
        
        view.addSubview(button)
        
        return view
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @objc func help(sender: UIButton){
       
        if sender.isSelected {
            sender.setImage(btnimage, for: .normal)
            
            sender.isSelected = false
            
        }
        else{
            
            sender.setImage(btnImageDisabled, for: .normal)
            sender.isSelected = true
        }
        
        
    }
    
    
    
    
}

