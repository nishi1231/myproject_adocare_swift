//
//  PeriodInputController.swift
//  Medicus
//
//  Created by 西山翔太 on 2019/12/06.
//  Copyright © 2019 西山翔太. All rights reserved.
//

import UIKit
import SnapKit
import RealmSwift

class PeriodInputController: UIViewController, UITextFieldDelegate{

    var period: NSString!
    private var PeriodButton: UIButton!
    
    var periodText : String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
                
                let PeriodTitleLabel = UILabel()
                    PeriodTitleLabel.textAlignment = NSTextAlignment.center
                    PeriodTitleLabel.font = UIFont.systemFont(ofSize: 22)
                    PeriodTitleLabel.text = "いつから症状が出ていますか？"
                                    self.view.addSubview(PeriodTitleLabel)
                        
                    PeriodTitleLabel.snp.makeConstraints{ make in
                        make.width.equalTo(500)
                        make.height.equalTo(100)
                        make.centerX.equalToSuperview()
                        make.centerY.equalToSuperview().offset(-100)
                       }
    
        
                 let PeriodLabel = UILabel()
                     PeriodLabel.textAlignment = NSTextAlignment.center
                     PeriodLabel.font = UIFont.systemFont(ofSize: 17)
                     PeriodLabel.text = "日前"
                     self.view.addSubview(PeriodLabel)
         
                     PeriodLabel.snp.makeConstraints{ make in
                        make.width.equalTo(500)
                        make.height.equalTo(100)
                        make.centerX.equalToSuperview().offset(+50)
                        make.centerY.equalToSuperview()
                       }
        
        
                 let PeriodTextField = UITextField()
                     PeriodTextField.textAlignment = NSTextAlignment.center
                     PeriodTextField.delegate = self
                     PeriodTextField.borderStyle = .none
                     PeriodTextField.keyboardType = UIKeyboardType.phonePad
                     PeriodTextField.becomeFirstResponder()
                     PeriodTextField.placeholder = "3"
                     self.view.addSubview(PeriodTextField)
        
                     PeriodTextField.snp.makeConstraints{ make in
                          make.width.equalTo(200)
                          make.height.equalTo(50)
                          make.centerX.equalToSuperview()
                          make.centerY.equalToSuperview()
                         }
        
                     PeriodTextField.addTarget(self, action: #selector(textField), for: UIControl.Event.editingChanged)
                     PeriodTextField.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
                     PeriodTextField.addTarget(self, action: #selector(textFieldGet), for: UIControl.Event.editingChanged)
        
               
                     PeriodButton = UIButton()
                     PeriodButton.backgroundColor = UIColor.orange
                     PeriodButton.layer.masksToBounds = true
                     PeriodButton.layer.cornerRadius = 20.0
                     PeriodButton.setTitle("次へ", for: .normal)
                     PeriodButton.setTitleColor(UIColor.white, for: .normal)
                     PeriodButton.tag = 1
                     PeriodButton.isEnabled = false
                     PeriodButton.alpha = 0.5
                     self.view.addSubview(PeriodButton)
        
                     PeriodButton.snp.makeConstraints{ make in
                           make.width.equalTo(250)
                           make.height.equalTo(50)
                           make.centerX.equalToSuperview()
                           make.centerY.equalToSuperview().offset(+75)
                          }
         
                    PeriodButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
                    self.view.addSubview(PeriodButton)
        
        
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
    
                  
        @objc func textField(_ PeriodTextField: UITextField,shouldChangeCharactersIn range: NSRange, replacementString string: String)  ->Bool{

                 let maxLength = 3
                 let period: NSString = (PeriodTextField.text ?? "") as NSString
                 let newString: NSString =
                    period.replacingCharacters(in: range, with: string) as NSString
                      return newString.length <= maxLength

        }
    
         @objc func textFieldGet(PeriodTextField: UITextField) {
            //testlabelをrealmに
                 periodText = PeriodTextField.text!
                 print(periodText)
         }
    
    
    
        @objc func textFieldDidChange(_ PeriodTextField: UITextField,shouldChangeCharactersIn range: NSRange, replacementString string: String) {
               
                 let textempty = (PeriodTextField.text! as NSString).replacingCharacters(in: range, with: string)
                  if textempty.count <= 0 {
                    
                               PeriodButton.isEnabled = false
                               PeriodButton.alpha = 0.5
                           
                             } else {
                               
                               PeriodButton.isEnabled = true
                               PeriodButton.alpha = 1.0
                               
                             }
                         }
           
           // ボタンタップで次画面へ遷移
        @objc func didTapButton() {
            

                 let realm = try! Realm()
            
                 if let unwrap_period = periodText {
                    
                    var periodString : NSString = NSString.init(string: unwrap_period)
                    var periodInt : Int = periodString.integerValue
                    
                    try! realm.write {
                       realm.add(Interview(value: ["period": periodInt]))
                       print("データ書き込み")
                    }
                 }
                 else {
                   print("値が代入されていません")
                 }
            
                  let storyboard: UIStoryboard = self.storyboard!
                  let nextView = storyboard.instantiateViewController(withIdentifier: "OtherChoice")
                  self.hidesBottomBarWhenPushed = true
                  navigationController?.pushViewController(nextView, animated: true)
                  self.hidesBottomBarWhenPushed = false
            
                  let results = realm.objects(Interview.self)
                  print("データ取得")
                  print(results)
        
                }
        
     }
