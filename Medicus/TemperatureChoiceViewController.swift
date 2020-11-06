//
//  TemperatureChoiceViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2019/10/12.
//  Copyright © 2019 西山翔太. All rights reserved.
//

import UIKit
import SnapKit
import fluid_slider

class TemperatureChoiceViewController: UIViewController, UITextFieldDelegate {
    
    
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
        
                
               let slider = Slider()
                   slider.attributedTextForFraction = { fraction in
               let formatter = NumberFormatter()
                   formatter.maximumIntegerDigits = 3
                   formatter.maximumFractionDigits = 1
               let string = formatter.string(from: (fraction * 6 + 35.0) as NSNumber) ?? ""
                    return NSAttributedString(string: string)
                   }
        
                slider.setMinimumLabelAttributedText(NSAttributedString(string: "35.0"))
                slider.setMaximumLabelAttributedText(NSAttributedString(string: "41.0"))
                slider.fraction = 0.5
                slider.shadowOffset = CGSize(width: 0, height: 10)
                slider.shadowBlur = 5
                slider.shadowColor = UIColor(white: 0, alpha: 0.1)
                slider.contentViewColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
                slider.valueViewColor = .white
                self.view.addSubview(slider)
        
               slider.snp.makeConstraints{ make in
                    make.width.equalTo(250)
                    make.height.equalTo(50)
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview()
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
                
    
           @objc func didTapButton() {
                      let storyboard: UIStoryboard = self.storyboard!
                      let nextView = storyboard.instantiateViewController(withIdentifier: "CoughCoice")
                      self.hidesBottomBarWhenPushed = true
                      navigationController?.pushViewController(nextView, animated: true)
                      self.hidesBottomBarWhenPushed = false
                     }
       }



