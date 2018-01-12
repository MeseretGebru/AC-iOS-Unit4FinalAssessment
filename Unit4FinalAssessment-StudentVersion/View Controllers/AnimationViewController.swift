//
//  AnimationViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController, UIPickerViewDelegate {
    
    
     lazy var snowmanImageView: UIImageView = {
        let snowmanImageV = UIImageView()
         snowmanImageV.image = #imageLiteral(resourceName: "snowman")
        return snowmanImageV
     }()
    
    
    
    lazy var settingPickerView: UIPickerView = {
        let settingPicker = UIPickerView()
        
        return settingPicker
    }()
    
    lazy var pauseButton: UIButton = {
        let butt = UIButton()
        butt.setTitle("Pause", for: .normal)
        butt.addTarget(self, action: #selector(handlePauseButtonPressed), for: .touchUpInside)
        butt.backgroundColor = .black
        return butt
    }()
    
    lazy var resumeButton: UIButton = {
        let butt = UIButton()
        butt.setTitle("Resume", for: .normal)
        butt.addTarget(self, action: #selector(handleResumeButtonPressed), for: .touchUpInside)
        butt.backgroundColor = .black
        return butt
    }()
    
    lazy var buttonstackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        //UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        view.addSubview(snowmanImageView)
        view.addSubview(settingPickerView)
        //view.addSubview(buttonstackView)
        view.addSubview(pauseButton)
        //buttonstackView.addArrangedSubview(pauseButton)
        //buttonstackView.addArrangedSubview(resumeButton)
        
        
        
        imageViewconstraints()
        pickerViewconstraints()
        self.settingPickerView.delegate = self
       // animateScale()
        animateRotationX()
        buttonstackViewConstraints()
        
    }
    
    
    func imageViewconstraints(){
        snowmanImageView.translatesAutoresizingMaskIntoConstraints = false
        snowmanImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        snowmanImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        snowmanImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.88).isActive = true
        snowmanImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.48).isActive = true
        
    }
    func pickerViewconstraints(){
        settingPickerView.translatesAutoresizingMaskIntoConstraints = false
        settingPickerView.topAnchor.constraint(equalTo: snowmanImageView.bottomAnchor, constant: 40).isActive = true
        //settingPickerView.bottomAnchor.constraint(equalTo: buttonstackView.topAnchor, constant: 20).isActive = true
        settingPickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func buttonstackViewConstraints() {
        buttonstackView.translatesAutoresizingMaskIntoConstraints = false
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        resumeButton.translatesAutoresizingMaskIntoConstraints = false
        
        pauseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive =  true
        pauseButton.topAnchor.constraint(equalTo: settingPickerView.bottomAnchor, constant: 40).isActive = true
        pauseButton.heightAnchor.constraint(equalToConstant: 30)
        //pauseButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        pauseButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
//       // buttonstackView.topAnchor.constraint(equalTo: settingPickerView.bottomAnchor, constant: 10)
//        buttonstackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
//        buttonstackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80
//            ).isActive = true
//        //buttonstackView.centerYAnchor.constraint(equalTo:
//           // view.centerYAnchor).isActive = true
//        buttonstackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 10).isActive = true
//        buttonstackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
//
    }
    
    
   @objc func handlePauseButtonPressed() {
//        pause(layer: CALayer.)
//        //delegate?.buttonWasPressed()
    }
    @objc func handleResumeButtonPressed() {
//        pause(layer: CALayer.)
//        //delegate?.buttonWasPressed()
    }
    
    //pause 
    func pause(layer: CALayer) {
        let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0
        layer.timeOffset = pausedTime
    }
    
    //resum
    func resume(layer: CALayer) {
        let pausedTime = layer.timeOffset
        layer.speed = 1
        layer.timeOffset = 0
        layer.beginTime = 0
        let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause
        
    }
    
    //Animation...
    func animateRotationX(){
        let animation = CABasicAnimation(keyPath: "transform.rotation.x")
        let angleRadian = CGFloat(2.0 * .pi)  //360
        
        //let rotation = CATransform3DMakeRotation(angleRadian, 1, 0, 0)
        //imageView.layer.transform = CATransform3D
        
        animation.fromValue = 0 // degrees
        animation.byValue = angleRadian
        animation.duration = 2.0 // seconds
        animation.repeatCount = Float.infinity
        snowmanImageView.layer.add(animation, forKey: nil)
        
    }
    func animateScale(){
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        let toValue = CATransform3DMakeScale(0.01, 0.01, 0)
        let fromValue = CATransform3DMakeScale(1, 1, 0)
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = 2.0
        animation.repeatCount = Float.infinity
        snowmanImageView.layer.add(animation, forKey: nil)
    }
    
}
