//
//  SigninViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2020/01/09.
//  Copyright © 2020 西山翔太. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import Firebase
import FirebaseAuth
import SnapKit

class SigninViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var signinmailtextfield: SkyFloatingLabelTextField!
    
    @IBOutlet weak var signinpasswordtextfield: SkyFloatingLabelTextField!
    
    private var signinButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

            
                signinmailtextfield.keyboardType = UIKeyboardType.emailAddress
                signinpasswordtextfield.keyboardType = UIKeyboardType.webSearch
                signinpasswordtextfield.isSecureTextEntry = true
                
                self.view.addSubview(signinmailtextfield)
                self.view.addSubview(signinpasswordtextfield)
        
                signinmailtextfield.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
                signinpasswordtextfield.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)

        
        // Buttonを生成する.
                signinButton = UIButton()
                signinButton.backgroundColor = UIColor.orange
                signinButton.layer.masksToBounds = true
                signinButton.layer.cornerRadius = 20.0
                signinButton.setTitle("ログイン", for: .normal)
                signinButton.setTitleColor(UIColor.white, for: .normal)
                signinButton.tag = 1

                self.view.addSubview(signinButton)
        
                signinButton.snp.makeConstraints{ make in
                    make.width.equalTo(250)
                    make.height.equalTo(50)
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview()
                }
            
               // ボタンをタップで次画面に遷移.
               signinButton.addTarget(self, action: #selector(didTapsigninButton), for: .touchUpInside)
               self.view.addSubview(signinButton)
               
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
              guard let mailtext = signinmailtextfield.text,
                    let passwordtext = signinpasswordtextfield.text else { return }
                      
                     if validateEmail(candidate: mailtext) && passwordtext.count >= 8 {
                        signinButton.isEnabled = true
                        signinButton.alpha = 1.0
                        print("成功")
                 } else {
                        signinButton.isEnabled = false
                        signinButton.alpha = 0.5
                        print("失敗")
              }
           }
    
          func validateEmail(candidate: String) -> Bool {
               let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
               return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
           }

    
    @objc func didTapsigninButton(_ sender: UIButton) {
        
      if((signinmailtextfield.text?.isEmpty)!||(signinpasswordtextfield.text?.isEmpty)!) {
      self.showAlert(message: "All fields are mandatory!")
              return
              }
              else {
           
                Auth.auth().signIn(withEmail:signinmailtextfield.text!, password: signinpasswordtextfield.text!) {(user, error) in
                   
                    if ((error == nil)) {
                       print("成功")
                       
                       let storyboard: UIStoryboard = self.storyboard!
                       let nextView = storyboard.instantiateViewController(withIdentifier: "UITabbar")
                       self.hidesBottomBarWhenPushed = true
                       self.navigationController?.pushViewController(nextView, animated: true)
                       self.hidesBottomBarWhenPushed = false
                   
                    } else {
                       print("登録失敗")
                  }
                }
              }
            }

          func showAlert(message:String){
               let alert = UIAlertController(title: message, message: "", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               self.present(alert, animated: true)
        }
     }
