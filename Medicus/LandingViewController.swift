//
//  LandingViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2020/01/09.
//  Copyright © 2020 西山翔太. All rights reserved.
//

import UIKit
import SnapKit

class LandingViewController: UIViewController {
    
    
    private var signinButton: UIButton!
    private var signupButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Buttonを生成する.
                signinButton = UIButton()
                signupButton = UIButton()

                signinButton.backgroundColor = UIColor.orange
                signupButton.backgroundColor = UIColor.white
        
                self.signupButton.layer.borderColor = UIColor.orange.cgColor
                self.signupButton.layer.borderWidth = 1.0

                signinButton.layer.masksToBounds = false
                signupButton.layer.masksToBounds = false

                signinButton.layer.cornerRadius = 0
                signupButton.layer.cornerRadius = 0

                signinButton.setTitle("ログイン", for: .normal)
                signinButton.setTitleColor(UIColor.white, for: .normal)
                
                signupButton.setTitle("登録", for: .normal)
                signupButton.setTitleColor(UIColor.orange, for: .normal)
        
                signinButton.tag = 1
                signupButton.tag = 1

                // ボタンをViewに追加.
                self.view.addSubview(signinButton)
                self.view.addSubview(signupButton)
                
                signinButton.snp.makeConstraints{ make in
                    make.width.equalTo(150)
                    make.height.equalTo(50)
                    make.centerX.equalToSuperview().offset(-80)
                    make.bottom.equalToSuperview().offset(-100)
                }
        
                signupButton.snp.makeConstraints{ make in
                    make.width.equalTo(150)
                    make.height.equalTo(50)
                    make.centerX.equalToSuperview().offset(80)
                    make.bottom.equalToSuperview().offset(-100)
                }

               signinButton.addTarget(self, action: #selector(didTapsigninButton), for: .touchUpInside)
               self.view.addSubview(signinButton)
               
               signupButton.addTarget(self, action: #selector(didTapsignupButton), for: .touchUpInside)
               self.view.addSubview(signupButton)
        
              self.navigationItem.backBarButtonItem = UIBarButtonItem(
              title:  "",
              style:  .plain,
              target: nil,
              action: nil
          )
              
    }
    

    @objc func didTapsigninButton() {
         let storyboard: UIStoryboard = self.storyboard!
         let nextView = storyboard.instantiateViewController(withIdentifier: "Signin")
         self.hidesBottomBarWhenPushed = true
         navigationController?.pushViewController(nextView, animated: true)
         self.hidesBottomBarWhenPushed = false
      }
    
    @objc func didTapsignupButton() {
         let storyboard: UIStoryboard = self.storyboard!
         let nextView = storyboard.instantiateViewController(withIdentifier: "Signup")
         self.hidesBottomBarWhenPushed = true
         navigationController?.pushViewController(nextView, animated: true)
         self.hidesBottomBarWhenPushed = false
      }
    
    
    
    
}
