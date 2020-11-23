//
//  TemperatureChoiceViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2019/10/12.
//  Copyright © 2019 西山翔太. All rights reserved.
//

import UIKit
import SnapKit


class TemperatureChoiceViewController: UIViewController, UITextFieldDelegate {
    
    
    var sliderValue: UILabel!
    private var temperatureButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

              let ConsultationLabel = UILabel()
                  ConsultationLabel.textAlignment = NSTextAlignment.center
                  ConsultationLabel.font = UIFont.systemFont(ofSize: 22)
                  ConsultationLabel.text = "熱は何度ありますか？"
                  self.view.addSubview(ConsultationLabel)
              
              ConsultationLabel.snp.makeConstraints{ make in
                   make.width.equalTo(500)
                   make.height.equalTo(100)
                   make.centerX.equalToSuperview()
                   make.centerY.equalToSuperview().offset(-100)
                  }
               
        
              let initialValue: Float = 38.0
              let slider = UISlider()
                  slider.minimumValue = 35.0
                  slider.maximumValue = 41.0
                  slider.value = initialValue
                  slider.tintColor = .orange
                  slider.addTarget(self, action: #selector(sliderDidChangeValue(_:)), for: .valueChanged)
                  view.addSubview(slider)
                
                  sliderValue = UILabel()
                  sliderValue.textAlignment = .center
                  sliderValue.text = String(initialValue)
                  view.addSubview(sliderValue)

        
               slider.snp.makeConstraints{ make in
                    make.width.equalTo(250)
                    make.height.equalTo(50)
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview()
                }
               
               sliderValue.snp.makeConstraints{ make in
                    make.width.equalTo(250)
                    make.height.equalTo(50)
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview().offset(+50)
                }
        
        
                   temperatureButton = UIButton()
                   temperatureButton.backgroundColor = UIColor.orange
                   temperatureButton.layer.masksToBounds = true
                   temperatureButton.layer.cornerRadius = 20.0
                   temperatureButton.setTitle("次へ", for: .normal)
                   temperatureButton.setTitleColor(UIColor.white, for: .normal)
                   temperatureButton.tag = 1
                   self.view.addSubview(temperatureButton)
                
                temperatureButton.snp.makeConstraints{ make in
                    make.width.equalTo(250)
                    make.height.equalTo(50)
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview().offset(+200)
                }

        
               temperatureButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
               self.view.addSubview(temperatureButton)
               
               self.navigationController?.navigationBar.barTintColor = .white
               self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
               self.navigationController?.navigationBar.shadowImage = UIImage()
               self.navigationItem.backBarButtonItem = UIBarButtonItem(
                   title: "",
                   style: .plain,
                  target: nil,
                  action: nil
                  )
               }
                
    
          @objc func sliderDidChangeValue(_ sender: UISlider) {
                 let value = sender.value
                 sliderValue.text = String(round(value*10) / 10)
          }
    
    
           @objc func didTapButton() {
                      let storyboard: UIStoryboard = self.storyboard!
                      let nextView = storyboard.instantiateViewController(withIdentifier: "CoughCoice")
                      self.hidesBottomBarWhenPushed = true
                      navigationController?.pushViewController(nextView, animated: true)
                      self.hidesBottomBarWhenPushed = false
          }
    
    }



