//
//  LandingViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2020/01/09.
//  Copyright © 2020 西山翔太. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    
    private var signinButton: UIButton!
    private var signupButton: UIButton!
    
    private var landingImageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Buttonを生成する.
                signinButton = UIButton()
                signupButton = UIButton()

                // ボタンのサイズ.
                let bsigninWidth: CGFloat = 150
                let bsigninHeight: CGFloat = 50
        
                let bsignupWidth: CGFloat = 150
                let bsignupHeight: CGFloat = 50

        
                // ボタンのX,Y座標.
                let possigninX: CGFloat = self.view.frame.width/3.5 - bsigninWidth/2
                let possigninY: CGFloat = self.view.frame.height/1.3 - bsigninHeight/2
                
                let possignupX: CGFloat = self.view.frame.width/1.4 - bsignupWidth/2
                let possignupY: CGFloat = self.view.frame.height/1.3 - bsignupHeight/2

        
                // ボタンの設置座標とサイズを設定する.
                signinButton.frame = CGRect(x: possigninX, y: possigninY, width: bsigninWidth, height: bsigninHeight)
                signupButton.frame = CGRect(x: possignupX, y: possignupY, width: bsignupWidth, height: bsignupHeight)
        

                // ボタンの背景色を設定.
                signinButton.backgroundColor = UIColor.orange
                signupButton.backgroundColor = UIColor.white
        
                self.signupButton.layer.borderColor = UIColor.orange.cgColor
                self.signupButton.layer.borderWidth = 1.0

                // ボタンの枠を丸くする.
                signinButton.layer.masksToBounds = true
                signupButton.layer.masksToBounds = true

                // コーナーの半径を設定する.
                signinButton.layer.cornerRadius = 20.0
                signupButton.layer.cornerRadius = 20.0

                // タイトルを設定する(通常時).
                signinButton.setTitle("ログイン", for: .normal)
                signinButton.setTitleColor(UIColor.white, for: .normal)
                
                signupButton.setTitle("新規登録", for: .normal)
                signupButton.setTitleColor(UIColor.orange, for: .normal)

        
                // ボタンにタグをつける.
                signinButton.tag = 1
                signupButton.tag = 1

                // ボタンをViewに追加.
                self.view.addSubview(signinButton)
                self.view.addSubview(signupButton)
        
        
               // ボタンをタップで次画面に遷移.
               signinButton.addTarget(self, action: #selector(didTapsigninButton), for: .touchUpInside)
               self.view.addSubview(signinButton)
               
               signupButton.addTarget(self, action: #selector(didTapsignupButton), for: .touchUpInside)
               self.view.addSubview(signupButton)
        
        
        // ここから画像の設定
              // UIImageViewのサイズを設定する
               let iWidth: CGFloat = 300
               let iHeight: CGFloat = 300

              // UIImageViewのx,yを設定する
               let posimageX: CGFloat = (self.view.bounds.width - iWidth)/2
               let posimageY: CGFloat = (self.view.bounds.height - iHeight)/2

              // UIImageViewを作成.
              landingImageView = UIImageView(frame: CGRect(x: posimageX, y: posimageY, width: iWidth, height: iHeight))

              // UIImageを作成.
              let myImage: UIImage = UIImage(named: "doctot_orange_icon")!

              // 画像をUIImageViewに設定する.
              landingImageView.image = myImage


              // UIImageViewをViewに追加する
              self.view.addSubview(landingImageView)
        
              self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
              self.navigationController?.navigationBar.shadowImage = UIImage()
        
              // 次の画面のBackボタンを「戻る」に変更
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
