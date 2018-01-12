//
//  SettingsViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

enum PropertyName: String {
    case widthMultiplier  = "Width Multiplier"
    case hightMultiplier  = "Hight Multiplier"
    case horizontalOffset = "Horizontal Offset"
    case verticalOffset   = "Vertical Offset"
    case numberOfFlips    = "Number OfFlips"
    
    //TO DO: Add other PropertyName Cases
}

struct AnimationProperty {
    let name: PropertyName
    let stepperMin: Double
    let stepperMax: Double
    let stepperIncrement: Double
    let startingStepperVal: Double
}

struct Setting: Codable {
    var var1: String //temporary names
    let var2: String
    
    //TODO:
}

class SettingsViewController: UIViewController {

    //TO DO: Add more properties
    var properties: [[AnimationProperty]] =
    [
        [AnimationProperty(name: .widthMultiplier, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0),
         AnimationProperty(name: .hightMultiplier, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0)],
        [AnimationProperty(name: .horizontalOffset, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0),
        AnimationProperty(name: .verticalOffset, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0)],
        [AnimationProperty(name: .numberOfFlips, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0)]
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        navigationItem.title = "Settings"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: nil)// #selector(saveSetting))
        layoutTableView()
    }
    
    func layoutTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        tv.register(SettingTableViewCell.self, forCellReuseIdentifier: "SettingCell")
        return tv
    }()
    
    
    
    //Animation......
//    func animateScale(){
//        let animation = CABasicAnimation(keyPath: "transform.scale")
//        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        let toValue = CATransform3DMakeScale(0.01, 0.01, 0)
//        let fromValue = CATransform3DMakeScale(1, 1, 0)
//        animation.fromValue = fromValue
//        animation.toValue = toValue
//        animation.duration = 2.0
//        animation.repeatCount = Float.infinity
//        //snowmanImageView.layer.add(animation, forKey: nil)
//    }
    
    //Save settings...
    
    
}

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return properties.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TO DO: Implement your Custom Cell that has a stepper
        
        let property = properties[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as!SettingTableViewCell
        
        //TODO:
        
        let value = cell.settingStepper.maximumValue // for teat
        cell.settingLabel.text = "\(property.name.rawValue): \(value)"
        cell.settingStepper.maximumValue = property.stepperMax
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties[section].count
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "Size Settings"
        case 1:
            return "Position Setting"
        default:
            return "Other Settings"
        
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}











