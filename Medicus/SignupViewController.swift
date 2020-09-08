//
//  SignupViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2020/01/09.
//  Copyright © 2020 西山翔太. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import Alamofire
import SwiftyJSON
import SnapKit
import NVActivityIndicatorView


class SignupViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var mailtextfield: SkyFloatingLabelTextField!
    
    @IBOutlet weak var passwordtextfield: SkyFloatingLabelTextField!
    
    @IBOutlet weak var emailerrormessage: UILabel!
    
    @IBOutlet weak var passworderrormessage: UILabel!

    private var signupButton: UIButton!
    
    @IBOutlet weak var activityIndicator: NVActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
                mailtextfield.keyboardType = UIKeyboardType.emailAddress
                mailtextfield.textContentType = .username
        
                passwordtextfield.keyboardType = UIKeyboardType.emailAddress
                passwordtextfield.isSecureTextEntry = true
                passwordtextfield.autocorrectionType = .no
                passwordtextfield.textContentType = .newPassword
               //password autofillは原因不明なので後回しで修正
        
                
                self.view.addSubview(mailtextfield)
                self.view.addSubview(passwordtextfield)
        
        
                mailtextfield.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
                passwordtextfield.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
                passwordtextfield.addTarget(self, action: #selector(passwordErrorMessege), for: UIControl.Event.editingChanged)
        
                emailerrormessage.isHidden = true
                passworderrormessage.isHidden = true

        
                signupButton = UIButton()
                signupButton.backgroundColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
                signupButton.layer.masksToBounds = true
                signupButton.layer.cornerRadius = 20.0
                signupButton.setTitle("登録する", for: .normal)
                signupButton.setTitleColor(UIColor.white, for: .normal)
                signupButton.tag = 1

                self.view.addSubview(signupButton)
        
                signupButton.isEnabled = false
                signupButton.alpha = 0.5
        
                signupButton.snp.makeConstraints{ make in
                    make.width.equalTo(250)
                    make.height.equalTo(50)
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview()
                    
                }
                
                let myBackButton = UIBarButtonItem(
                    title: "",
                    style: .plain,
                    target: nil,
                    action: nil
                   )
                self.navigationItem.backBarButtonItem = myBackButton

            
        signupButton.addTarget(self, action: #selector(SignupViewController.didTapsignupButton(_:)), for: .touchUpInside)
         
       }
    
    // バリデーションチェック後にボタンアクティブ
    @objc func textFieldDidChange(_ textField: UITextField) {
        
              guard let mailtext = mailtextfield.text,
                    let passwordtext = passwordtextfield.text else { return }
                      
                     if validateEmail(candidate: mailtext) && validatePassword(candidate: passwordtext) {
                        
                        signupButton.isEnabled = true
                        signupButton.alpha = 1.0
                        self.emailerrormessage.isHidden = true
                    
                      } else {
                        
                        signupButton.isEnabled = false
                        signupButton.alpha = 0.5
                        
                      }
                  }

          func validateEmail(candidate: String) -> Bool {
               let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
               return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
               }
    
    //バリデーションチェックでパスワードのメッセージ
    @objc func passwordErrorMessege(_ textField: UITextField) {
    
          guard let passwordtext = passwordtextfield.text else { return }
            
                     if validatePassword(candidate: passwordtext) || passwordtext.count == 0 {
                        
                        passworderrormessage.isHidden = true
                        
                      } else {
                        
                        passworderrormessage.isHidden = false
                        passworderrormessage.text = "英数字8文字以上で入力してください"
                    
                     }
                  }
    
        func validatePassword(candidate: String) -> Bool {
             let passwordRegex = "^(?=.*?[A-Za-z])(?=.*?[0-9])[A-Za-z0-9]{8,}$"
             return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: candidate)
             }
    
    //ボタンタップでサーバーにPOST
    @objc func didTapsignupButton(_ sender: UIButton) {
        
      activityIndicator.startAnimating()
        
      if((mailtextfield.text?.isEmpty)!||(passwordtextfield.text?.isEmpty)!) { return } else {
        
              let urlString: String = "http://127.0.0.1:8000/rest-auth/registration/"
              let headers: HTTPHeaders = ["Content-Type": "application/json"]
              let parameters: Parameters = [
                  "email": mailtextfield.text!,
                  "password": passwordtextfield.text!
                    ]
                        
                AF.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default , headers: headers)
                    .validate(statusCode: 200..<300)
                    .responseJSON { response in
                        switch response.result {
                              
                          case .success(_):
                                print("成功2")
                                
                                self.activityIndicator.stopAnimating()
                                
                                let storyboard: UIStoryboard = self.storyboard!
                                let nextView = storyboard.instantiateViewController(withIdentifier: "UITabbar")
                                self.hidesBottomBarWhenPushed = true
                                self.navigationController?.pushViewController(nextView, animated: true)
                                self.hidesBottomBarWhenPushed = false
                        
                          case .failure(_):
                                print("エラー2")
                                
                                //他のユーザーが使っているメアドの分岐を記載
                                self.activityIndicator.stopAnimating()
                                
                                self.emailerrormessage.isHidden = false
                                self.emailerrormessage.text = "通信に失敗しました。"
                                
                           }
                        }
                    }
                }
        }
       
  
