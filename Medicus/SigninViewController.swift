//
//  SigninViewController.swift
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

class SigninViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var signinmailtextfield: SkyFloatingLabelTextField!
    
    @IBOutlet weak var signinpasswordtextfield: SkyFloatingLabelTextField!
    
    @IBOutlet weak var signinErrorMessage: UILabel!
    
    @IBOutlet weak var signinIndicator: NVActivityIndicatorView!
    
    
    private var signinButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

            
                signinmailtextfield.keyboardType = UIKeyboardType.emailAddress
                signinmailtextfield.textContentType = .username
        
                signinpasswordtextfield.keyboardType = UIKeyboardType.emailAddress
                signinpasswordtextfield.textContentType = .password
                signinpasswordtextfield.isSecureTextEntry = true
                signinpasswordtextfield.autocorrectionType = .no
                
        
                self.view.addSubview(signinmailtextfield)
                self.view.addSubview(signinpasswordtextfield)
        
        
                signinmailtextfield.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
                signinpasswordtextfield.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        
                
                signinErrorMessage.isHidden = true

        
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
        
               let myBackButton = UIBarButtonItem(
                   title: "",
                   style: .plain,
                   target: nil,
                   action: nil
                  )
               self.navigationItem.backBarButtonItem = myBackButton
            
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
                        
                 } else {
                        signinButton.isEnabled = false
                        signinButton.alpha = 0.5
                        
              }
           }
    
          func validateEmail(candidate: String) -> Bool {
               let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
               return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
           }

    
    @objc func didTapsigninButton(_ sender: UIButton) {
        
        signinIndicator.startAnimating()
        
       if((signinmailtextfield.text?.isEmpty)!||(signinpasswordtextfield.text?.isEmpty)!) { return } else {
             
                   let urlString: String = "http://127.0.0.1:8000/rest-auth/login/"
                   let headers: HTTPHeaders = ["Content-Type": "application/json"]
                   let parameters: Parameters = [
                       "email": signinmailtextfield.text!,
                       "password": signinpasswordtextfield.text!
                         ]
                             
                     AF.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default , headers: headers)
                         .validate(statusCode: 200..<300)
                         .responseJSON { response in
                             switch response.result {
                                   
                               case .success(let value):
                                     
                                     let json = JSON(value)
                                     let token = json["token"].string
                                     print(json)
                
                                     
                                     self.signinIndicator.stopAnimating()
                                     
                                     let storyboard: UIStoryboard = self.storyboard!
                                     let nextView = storyboard.instantiateViewController(withIdentifier: "UITabbar")
                                     self.hidesBottomBarWhenPushed = true
                                     self.navigationController?.pushViewController(nextView, animated: true)
                                     self.hidesBottomBarWhenPushed = false
                             
                               case .failure(_):
                                     print("エラー2")
                                
                                     self.signinIndicator.stopAnimating()
                                     
                                     self.signinErrorMessage.isHidden = false
                                     self.signinErrorMessage.text = "メールアドレスまたはパスワードが正しくありません"
                                     
                                }
                             }
                         }
                     }
                 }
