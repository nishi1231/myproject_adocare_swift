//
//  feverchoiceViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2019/10/07.
//  Copyright © 2019 西山翔太. All rights reserved.
//

import UIKit
import SnapKit
 
class feverchoiceViewController: UIViewController {
    
    
    private var myImageView: UIImageView!
 
    private var ConsultationButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
               
        
               let ConsultationLabel = UILabel()
               ConsultationLabel.textAlignment = NSTextAlignment.center
               ConsultationLabel.font = UIFont.systemFont(ofSize: 30)
               ConsultationLabel.text = "オンライン診療"
               self.view.addSubview(ConsultationLabel)
        
               ConsultationLabel.snp.makeConstraints{ make in
                   make.width.equalTo(500)
                   make.height.equalTo(100)
                   make.centerX.equalToSuperview()
                   make.centerY.equalToSuperview().offset(-250)
               }
        
        
               let DescriptionLabel = UILabel()
               DescriptionLabel.textAlignment = NSTextAlignment.left
               DescriptionLabel.numberOfLines = 3;
               DescriptionLabel.text = "問診に答えてカレンダーで予約すると、オンラインで医師の診察を受けることができます。"
               self.view.addSubview(DescriptionLabel)
        
               DescriptionLabel.snp.makeConstraints{ make in
                   make.width.equalTo(330)
                   make.height.equalTo(300)
                   make.centerX.equalToSuperview()
                   make.centerY.equalToSuperview().offset(-200)
               }
        

               let view = UIView()
               let ConsultationImage = UIImage(named: "doctot_orange_icon")
               let myImageView:UIImageView = UIImageView()
               myImageView.contentMode = UIView.ContentMode.scaleAspectFit
               myImageView.frame.size.width = 150
               myImageView.frame.size.height = 150
               myImageView.center = self.view.center
               myImageView.image = ConsultationImage
               self.view.addSubview(myImageView)
               
               myImageView.snp.makeConstraints{ make in
                   make.centerX.equalToSuperview()
                   make.centerY.equalToSuperview()
               }

        
               ConsultationButton = UIButton()
               ConsultationButton.backgroundColor = UIColor.orange
               ConsultationButton.layer.masksToBounds = true
               ConsultationButton.layer.cornerRadius = 20.0
               ConsultationButton.setTitle("受診する", for: .normal)
               ConsultationButton.setTitleColor(UIColor.white, for: .normal)
               ConsultationButton.tag = 1
               self.view.addSubview(ConsultationButton)
        
               ConsultationButton.snp.makeConstraints{ make in
                   make.width.equalTo(250)
                   make.height.equalTo(50)
                   make.centerX.equalToSuperview()
                   make.centerY.equalToSuperview().offset(+200)
               }
        
        
               ConsultationButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
             
        
            //ナビゲーションバーを透過にする
             self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
             self.navigationController?.navigationBar.shadowImage = UIImage()
             self.navigationItem.backBarButtonItem = UIBarButtonItem(
                   title:  "",
                   style:  .plain,
                   target: nil,
                   action: nil
                )

            }
    
                @objc func didTapButton() {
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "TemperatureChoice")
                self.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(nextView, animated: true)
                self.hidesBottomBarWhenPushed = false
           }

     }

        

