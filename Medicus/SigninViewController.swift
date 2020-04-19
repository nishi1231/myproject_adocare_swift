//
//  SigninViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2020/01/09.
//  Copyright © 2020 西山翔太. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class SigninViewController: UIViewController,UITextFieldDelegate {

    private var signinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

             // 入力欄を生成する。
                let lightGreyColor = UIColor(red: 197/255, green: 205/255, blue: 205/255, alpha: 1.0)
                let darkGreyColor = UIColor(red: 52/255, green: 42/255, blue: 61/255, alpha: 1.0)
                let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)

                // メアド入力欄
                let EmailtextField = SkyFloatingLabelTextField(frame: CGRect(x: 50, y: 210, width: 300, height: 45))
                EmailtextField.placeholder = "メールアドレス"
                EmailtextField.title = "メールアドレス"

                EmailtextField.tintColor = overcastBlueColor // the color of the blinking cursor
                EmailtextField.textColor = darkGreyColor
                EmailtextField.lineColor = lightGreyColor
                EmailtextField.selectedTitleColor = overcastBlueColor
                EmailtextField.selectedLineColor = overcastBlueColor

                EmailtextField.lineHeight = 1.0 // bottom line height in points
                EmailtextField.selectedLineHeight = 2.0
                EmailtextField.autocorrectionType = .no
                EmailtextField.keyboardType = UIKeyboardType.emailAddress
        
        
                // パスワード入力欄
                let PasswordtextField = SkyFloatingLabelTextField(frame: CGRect(x: 50, y: 280, width: 300, height: 45))
                PasswordtextField.placeholder = "パスワード"
                PasswordtextField.title = "パスワード"

                PasswordtextField.tintColor = overcastBlueColor // the color of the blinking cursor
                PasswordtextField.textColor = darkGreyColor
                PasswordtextField.lineColor = lightGreyColor
                PasswordtextField.selectedTitleColor = overcastBlueColor
                PasswordtextField.selectedLineColor = overcastBlueColor
                PasswordtextField.lineHeight = 1.0 // bottom line height in points
                PasswordtextField.selectedLineHeight = 2.0
                
                PasswordtextField.autocorrectionType = .no
                PasswordtextField.keyboardType = UIKeyboardType.webSearch

        
                self.view.addSubview(EmailtextField)
                self.view.addSubview(PasswordtextField)
        
        
        // Buttonを生成する.
                signinButton = UIButton()

                // ボタンのサイズ.
                let bsigninWidth: CGFloat = 300
                let bsigninHeight: CGFloat = 50
        
                // ボタンのX,Y座標.
                let possigninX: CGFloat = self.view.frame.width/2 - bsigninWidth/2
                let possigninY: CGFloat = self.view.frame.height/2 - bsigninHeight/2
                        
                // ボタンの設置座標とサイズを設定する.
                signinButton.frame = CGRect(x: possigninX, y: possigninY, width: bsigninWidth, height: bsigninHeight)
        
                // ボタンの背景色を設定.
                signinButton.backgroundColor = UIColor.orange

                // ボタンの枠を丸くする.
                signinButton.layer.masksToBounds = true

                // コーナーの半径を設定する.
                signinButton.layer.cornerRadius = 20.0

                // タイトルを設定する(通常時).
                signinButton.setTitle("ログイン", for: .normal)
                signinButton.setTitleColor(UIColor.white, for: .normal)
                
                // ボタンにタグをつける.
                signinButton.tag = 1

                // ボタンをViewに追加.
                self.view.addSubview(signinButton)
            
               // ボタンをタップで次画面に遷移.
               signinButton.addTarget(self, action: #selector(didTapsigninButton), for: .touchUpInside)
               self.view.addSubview(signinButton)
               
    }
    

    @objc func didTapsigninButton() {
         let storyboard: UIStoryboard = self.storyboard!
         let nextView = storyboard.instantiateViewController(withIdentifier: "TemperatureChoice")
         self.hidesBottomBarWhenPushed = true
         navigationController?.pushViewController(nextView, animated: true)
         self.hidesBottomBarWhenPushed = false
    }
    
    
}
