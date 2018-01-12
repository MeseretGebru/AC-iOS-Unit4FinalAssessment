//
//  SettingTableViewCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {


    lazy var settingLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.textAlignment = .left
        return label
    }()
    
    /*var customStepper = UIStepper (frame:CGRectMake(110, 250, 0, 0))
     customStepper.wraps = true
     customStepper.autorepeat = true
     customStepper.maximumValue = 10
     customStepper.addTarget(self, action: "stepperValueChanged:", forControlEvents: .ValueChanged)
     self.view.addSubview(customStepper)
 */
    lazy var settingStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.autorepeat = true
        stepper.maximumValue = 10
        stepper.addTarget(self, action: Selector("stepperValueChanged:"), for: .valueChanged)
        return stepper
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
       // stack.alignment =
        stack.distribution = .equalSpacing
//        stack.spacing = 2.0
        return stack
    }()
    
    
    func stepperValueChanged(_ sender:UIStepper!)
    {
        print("UIStepper is now \(Int(sender.value))")
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setupEffectView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupEffectView() {
       
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(settingLabel)
        stackView.addArrangedSubview(settingStepper)
        
        settingLabel.translatesAutoresizingMaskIntoConstraints = false
        settingStepper.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        

        //StackView constraints
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25).isActive = true
        stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.90
            ).isActive = true
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
    
        //TODO:

    }
}
