//
//  TemperatureChoiceViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2019/10/12.
//  Copyright © 2019 西山翔太. All rights reserved.
//

import UIKit

class TemperatureChoiceViewController: UIViewController, UITextFieldDelegate {
    
    private var myTextField: UITextField!
            var currentLength = 0
    
    private var temperatureButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         // ここからテキストフィールドの処理
              // UITextFieldの配置するx,yと幅と高さを設定.
               let tWidth: CGFloat = 200
               let tHeight: CGFloat = 50
               let posTextX: CGFloat = (self.view.bounds.width - tWidth)/2
               let posTextY: CGFloat = (self.view.bounds.height - tHeight)/2

               // UITextFieldを作成する.
               myTextField = UITextField(frame: CGRect(x: posTextX, y: posTextY, width: tWidth, height: tHeight))

              // 文字を中央に表示
               myTextField.textAlignment = NSTextAlignment.center

               // Delegateを自身に設定する
               myTextField.delegate = self

               // 枠を表示する.
               myTextField.borderStyle = .none

               /*クリアボタンを追加.
               myTextField.clearButtonMode = .whileEditing*/
        
               // 数字入力
               myTextField.keyboardType = UIKeyboardType.phonePad

               // Viewに追加する
               self.view.addSubview(myTextField)
        
                let border = CALayer()
                let width = CGFloat(2.0)

                border.borderColor = UIColor.gray.cgColor
                border.frame = CGRect(x: 0, y: myTextField.frame.size.height - width, width:  myTextField.frame.size.width, height: 1)
                border.borderWidth = width

                myTextField.placeholder = "37.5"
                myTextField.layer.addSublayer(border)
    
                // UITextFieldへ入力時にイベントを取得
                myTextField.addTarget(self, action: #selector(textField), for: UIControl.Event.editingChanged)
        
        
        // ここからボタンの処理
        
              // Buttonを生成する.
                temperatureButton = UIButton()

                // ボタンのサイズ.
                let bWidth: CGFloat = 200
                let bHeight: CGFloat = 50

                // ボタンのX,Y座標.
                let posbuttonX: CGFloat = self.view.frame.width/2 - bWidth/2
                let posbuttonY: CGFloat = self.view.frame.height/1.6 - bHeight/2

                // ボタンの設置座標とサイズを設定する.
                temperatureButton.frame = CGRect(x: posbuttonX, y: posbuttonY, width: bWidth, height: bHeight)

                // ボタンの背景色を設定.
                temperatureButton.backgroundColor = UIColor.orange

                // ボタンの枠を丸くする.
                temperatureButton.layer.masksToBounds = true

                // コーナーの半径を設定する.
                temperatureButton.layer.cornerRadius = 20.0

                // タイトルを設定する(通常時).
                temperatureButton.setTitle("次へ", for: .normal)
                temperatureButton.setTitleColor(UIColor.white, for: .normal)

                // ボタンにタグをつける.
                temperatureButton.tag = 1

                
                // ボタンをViewに追加.
                self.view.addSubview(temperatureButton)
        
        
               temperatureButton.isEnabled = false
               temperatureButton.alpha = 0.5
        
               // ボタンをタップで次画面に遷移.
               temperatureButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
               self.view.addSubview(temperatureButton)
         
               // 次の画面のBackボタンを「戻る」に変更
              self.navigationItem.backBarButtonItem = UIBarButtonItem(
                   title:  "",
                   style:  .plain,
                  target: nil,
                  action: nil
               )
            }
                // 小数点を入力チェック
               @objc func textField(_ myTextField: UITextField,shouldChangeCharactersIn range: NSRange, replacementString string: String)  ->Bool{
                     guard let text = myTextField.text else {return true
                        }
                           let length = text.count

                     if (length > currentLength) {
                     // テキストを追加したとき
                     if (length == 3 ) {
                     let content = NSMutableString(string: text)
                     content.insert(".", at: length - 1)
                     myTextField.text = content as String
                   }
                   }
                     else{
                // テキストを削除したとき
                     if (length == 3 ) {
                     myTextField.text = (text as NSString).substring(to: length - 1)
                    }
                    }
                     currentLength = length
                
                // テキスト入力後にボタン活性化
                 let textempty = (myTextField.text! as NSString).replacingCharacters(in: range, with: string)
                     if textempty.count <= 3 {
                      temperatureButton.isEnabled = false
                      temperatureButton.alpha = 0.5
                     }
                     else {
                      temperatureButton.isEnabled = true
                      temperatureButton.alpha = 1.0
                     }
                      return true
                     }
          
    
    
           override func didReceiveMemoryWarning() {
               super.didReceiveMemoryWarning()
           }
           
    
           //UITextFieldが編集された直前に呼ばれる
           func textFieldDidBeginEditing(_ textField: UITextField) {
               print("textFieldDidBeginEditing: \(textField.text!)")
           }

           //UITextFieldが編集された直後に呼ばれる
           func textFieldDidEndEditing(_ textField: UITextField) {
               print("textFieldDidEndEditing: \(textField.text!)")
           }

           //改行ボタンが押された際に呼ばれる
           func textFieldShouldReturn(_ textField: UITextField) -> Bool {
               print("textFieldShouldReturn \(textField.text!)")

               // 改行ボタンが押されたらKeyboardを閉じる処理.
               textField.resignFirstResponder()

               return true
           }
    
     @objc func didTapButton() {
                        let storyboard: UIStoryboard = self.storyboard!
                        let nextView = storyboard.instantiateViewController(withIdentifier: "CoughCoice")
                        self.hidesBottomBarWhenPushed = true
                        navigationController?.pushViewController(nextView, animated: true)
                        self.hidesBottomBarWhenPushed = false
            }
    }



