//
//  PeriodInputController.swift
//  Medicus
//
//  Created by 西山翔太 on 2019/12/06.
//  Copyright © 2019 西山翔太. All rights reserved.
//

import UIKit

class PeriodInputController: UIViewController, UITextFieldDelegate{
    
    // 数値入力
    private var myTextField: UITextField!
            var currentLength = 0
        
    // 入力ボタン
    private var periodButton: UIButton!

    
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

                      myTextField.placeholder = "3"
                      myTextField.layer.addSublayer(border)
           
                       // UITextFieldへ入力時にイベントを取得
                      myTextField.addTarget(self, action: #selector(textField), for: UIControl.Event.editingChanged)
        
                //期間選択ドラムロール
                       /*pickerView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: UIScreen.main.bounds.size.width,
                                  height: pickerView.bounds.size.height)

                       pickerView.dataSource = self
                       pickerView.delegate = self
                       pickerView.selectRow(0, inComponent: 0, animated: true)
                       periodchoice.inputView = pickerView*/
               
               
               // ここからボタンの処理
               
                     // Buttonを生成する.
                       periodButton = UIButton()

                       // ボタンのサイズ.
                       let bWidth: CGFloat = 200
                       let bHeight: CGFloat = 50

                       // ボタンのX,Y座標.
                       let posbuttonX: CGFloat = self.view.frame.width/2 - bWidth/2
                       let posbuttonY: CGFloat = self.view.frame.height/1.6 - bHeight/2

                       // ボタンの設置座標とサイズを設定する.
                       periodButton.frame = CGRect(x: posbuttonX, y: posbuttonY, width: bWidth, height: bHeight)

                       // ボタンの背景色を設定.
                       periodButton.backgroundColor = UIColor.orange

                       // ボタンの枠を丸くする.
                       periodButton.layer.masksToBounds = true

                       // コーナーの半径を設定する.
                       periodButton.layer.cornerRadius = 20.0

                       // タイトルを設定する(通常時).
                       periodButton.setTitle("次へ", for: .normal)
                       periodButton.setTitleColor(UIColor.white, for: .normal)

                       // ボタンにタグをつける.
                       periodButton.tag = 1

                       // ボタンをViewに追加.
                       self.view.addSubview(periodButton)
                
        
                       periodButton.isEnabled = false
                       periodButton.alpha = 0.5
               
                      // ボタンをタップで次画面に遷移.
                       periodButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
                       self.view.addSubview(periodButton)
                
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
                     if textempty.count <= 0 {
                      periodButton.isEnabled = false
                      periodButton.alpha = 0.5
                     }
                     else {
                      periodButton.isEnabled = true
                      periodButton.alpha = 1.0
                     }
                      return true
                    }
        
              //ここからドラムロール設定
                      // ドラムロールの数です。今回は一つなので1を返します
                      /*func numberOfComponents(in pickerView: UIPickerView) -> Int {
                          return 1
                      }
    
                      // ドラムロールに表示する値の数を返します
                      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
                          return array.count
                      }
    
                      // ドラムロールに表示する値（文字列）をここで返します
                          func pickerView(_ pickerView: UIPickerView, viewForRow row: Int,forComponent component: Int, reusing view: UIView?) -> UIView{
                          let label = UILabel()
                          label.text = array[row]
                          label.textAlignment = NSTextAlignment.center
                          return label
                      }
    
                      // ドラムロールにて選択した値をtextViewに設定します
                      func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
                          periodchoice.text = array[row]
                      }*/
    
    
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
           
           // ボタンタップで次画面へ遷移
    @objc func didTapButton() {
                        let storyboard: UIStoryboard = self.storyboard!
                        let nextView = storyboard.instantiateViewController(withIdentifier: "OtherChoice")
                        self.hidesBottomBarWhenPushed = true
                        navigationController?.pushViewController(nextView, animated: true)
                        self.hidesBottomBarWhenPushed = false
          }
        
    }
