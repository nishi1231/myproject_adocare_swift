//
//  CoughCoiceViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2019/11/28.
//  Copyright © 2019 西山翔太. All rights reserved.
//

import UIKit
import SnapKit

class CoughCoiceViewController: UIViewController {
    
    // ラベルのインスタンス生成
    private var CoughCoiceYesButton: UIButton!
    private var CoughCoiceNotButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
                 let CoughLabel = UILabel()
                     CoughLabel.textAlignment = NSTextAlignment.center
                     CoughLabel.font = UIFont.systemFont(ofSize: 22)
                     CoughLabel.text = "せきは出ますか？"
                     self.view.addSubview(CoughLabel)
       
                 CoughLabel.snp.makeConstraints{ make in
                      make.width.equalTo(500)
                      make.height.equalTo(100)
                      make.centerX.equalToSuperview()
                      make.centerY.equalToSuperview().offset(-100)
                    }
        
        
                CoughCoiceNotButton = UIButton()
                CoughCoiceNotButton.backgroundColor = UIColor(red: 236/255, green: 101/255, blue: 103/255, alpha: 1)
                CoughCoiceNotButton.layer.masksToBounds = true
                CoughCoiceNotButton.layer.cornerRadius = 20.0
                CoughCoiceNotButton.setTitle("いいえ", for: .normal)
                CoughCoiceNotButton.setTitleColor(UIColor.white, for: .normal)
                CoughCoiceNotButton.tag = 1
                self.view.addSubview(CoughCoiceNotButton)
      
                CoughCoiceNotButton.snp.makeConstraints{ make in
                   make.width.equalTo(100)
                   make.height.equalTo(100)
                   make.centerX.equalToSuperview().offset(-75)
                   make.centerY.equalToSuperview()
                }

        
        
                CoughCoiceYesButton = UIButton()
                CoughCoiceYesButton.backgroundColor = UIColor(red: 92/255, green: 193/255, blue: 220/255, alpha: 1)
                CoughCoiceYesButton.layer.masksToBounds = true
                CoughCoiceYesButton.layer.cornerRadius = 20.0
                CoughCoiceYesButton.setTitle("はい", for: .normal)
                CoughCoiceYesButton.setTitleColor(UIColor.white, for: .normal)
                CoughCoiceYesButton.tag = 1
                self.view.addSubview(CoughCoiceYesButton)
                
                CoughCoiceYesButton.snp.makeConstraints{ make in
                    make.width.equalTo(100)
                    make.height.equalTo(100)
                    make.centerX.equalToSuperview().offset(+75)
                    make.centerY.equalToSuperview()
                }

        
               // ボタンをタップで次画面に遷移.
               CoughCoiceYesButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
               self.view.addSubview(CoughCoiceYesButton)
        
               CoughCoiceNotButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
               self.view.addSubview(CoughCoiceNotButton)
        
        
               self.navigationController?.navigationBar.barTintColor = .white
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
                let nextView = storyboard.instantiateViewController(withIdentifier: "PeriodInput")
                self.hidesBottomBarWhenPushed = true
                     navigationController?.pushViewController(nextView, animated: true)
                self.hidesBottomBarWhenPushed = false
               }
        }
    


