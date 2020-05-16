//
//  SignupViewController.swift
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


class SignupViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var mailtextfield: SkyFloatingLabelTextField!
    
    @IBOutlet weak var passwordtextfield: SkyFloatingLabelTextField!
    
    @IBOutlet weak var emailerrormessage: UILabel!
    
    @IBOutlet weak var passworderrormessage: UILabel!

    private var signupButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
                mailtextfield.keyboardType = UIKeyboardType.emailAddress
                passwordtextfield.keyboardType = UIKeyboardType.emailAddress
                passwordtextfield.isSecureTextEntry = true
        
                self.view.addSubview(mailtextfield)
                self.view.addSubview(passwordtextfield)
        
                mailtextfield.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
                passwordtextfield.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
                passwordtextfield.addTarget(self, action: #selector(passwordErrorMessege), for: UIControl.Event.editingChanged)
        
                emailerrormessage.isHidden = true
                passworderrormessage.isHidden = true

             // Buttonを生成する.
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
        
            
        signupButton.addTarget(self, action: #selector(SignupViewController.didTapsignupButton(_:)), for: .touchUpInside)
               
     }
    
    // バリデーションチェック後にボタンアクティブ
    @objc func textFieldDidChange(_ textField: UITextField) {
        
              guard let mailtext = mailtextfield.text,
                    let passwordtext = passwordtextfield.text else { return }
                      
                     if validateEmail(candidate: mailtext) && passwordtext.count >= 8 {
                        signupButton.isEnabled = true
                        signupButton.alpha = 1.0
                        self.emailerrormessage.isHidden = true
                        print("成功")
                  } else {
                        signupButton.isEnabled = false
                        signupButton.alpha = 0.5
                        print("失敗")
               }
           }
    
          func validateEmail(candidate: String) -> Bool {
               let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
               return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
           }
    
    // パスワードエラーメッセージ
    @objc func passwordErrorMessege(_ textField: UITextField) {
    
          guard let passwordtext = passwordtextfield.text else { return }
            
                 if passwordtext.count >= 1 && passwordtext.count <= 7 {
                    passworderrormessage.isHidden = false
                    passworderrormessage.text = "8文字以上で入力してください"
              } else {
                    passworderrormessage.isHidden = true
              }
           }
    
    //firebaseでのユーザー作成
    @objc func didTapsignupButton(_ sender: UIButton) {
        
      if((mailtextfield.text?.isEmpty)!||(passwordtextfield.text?.isEmpty)!) { return
            } else {
        
             Auth.auth().createUser(withEmail:mailtextfield.text!, password: passwordtextfield.text!) {(user, error) in
                
                 if ((error == nil)) {
                    print("成功")
                    
                    let storyboard: UIStoryboard = self.storyboard!
                    let nextView = storyboard.instantiateViewController(withIdentifier: "UITabbar")
                    self.hidesBottomBarWhenPushed = true
                    self.navigationController?.pushViewController(nextView, animated: true)
                    self.hidesBottomBarWhenPushed = false
                
                  } else {
                    //firebaseからのエラー処理
                    print("登録失敗")
                    if let errorCode = AuthErrorCode(rawValue: error!._code) {
                       switch errorCode {
                        case .emailAlreadyInUse:self.emailerrormessage.text = "このメールアドレスは既に使われています"
                              self.emailerrormessage.isHidden = false
                        default:self.emailerrormessage.text = "通信に失敗しました。"
                           }
                        }
                     }
                }
            }
        }
    }

       
  
