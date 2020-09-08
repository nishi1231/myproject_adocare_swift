//
//  OtherChoiceViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2019/12/12.
//  Copyright © 2019 西山翔太. All rights reserved.
//

import UIKit


class OtherChoiceViewController: UIViewController{
    
    // チェックボックス
    private var headacheCheckbox: UIButton!
    private var runnynoseCheckbox: UIButton!
    private var jointpainCheckbox: UIButton!
    private var dizzyCheckbox: UIButton!
    private var palpitationsCheckbox: UIButton!
    private var stomachacheCheckbox: UIButton!
    private var nauseaCheckbox: UIButton!
    
    // 入力ボタン
    private var otherButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // チェックボックスの処理
               // インスタンス生成
               headacheCheckbox = UIButton()
               runnynoseCheckbox = UIButton()
               jointpainCheckbox = UIButton()
               dizzyCheckbox = UIButton()
               palpitationsCheckbox = UIButton()
               stomachacheCheckbox = UIButton()
               nauseaCheckbox = UIButton()
        
               // 大きさと位置を指定
               headacheCheckbox.frame = CGRect(x: 70, y: 250, width: 30 ,height: 30)
               runnynoseCheckbox.frame = CGRect(x: 70, y: 300, width: 30 ,height: 30)
               jointpainCheckbox.frame = CGRect(x: 70, y: 350, width: 30 ,height: 30)
               dizzyCheckbox.frame = CGRect(x: 70, y: 400, width: 30 ,height: 30)
               palpitationsCheckbox.frame = CGRect(x: 70, y: 450, width: 30 ,height: 30)
               stomachacheCheckbox.frame = CGRect(x: 70, y: 500, width: 30 ,height: 30)
               nauseaCheckbox.frame = CGRect(x: 70, y: 550, width: 30 ,height: 30)
        
               // アクションを定義
               headacheCheckbox.addTarget(self, action: #selector(headacheCheckButton), for: .touchUpInside)
               runnynoseCheckbox.addTarget(self, action: #selector(runnynoseCheckButton), for: .touchUpInside)
               jointpainCheckbox.addTarget(self, action: #selector(jointpainCheckButton), for: .touchUpInside)
               dizzyCheckbox.addTarget(self, action: #selector(dizzyCheckButton), for: .touchUpInside)
               palpitationsCheckbox.addTarget(self, action: #selector(palpitationsCheckButton), for: .touchUpInside)
               stomachacheCheckbox.addTarget(self, action: #selector(stomachacheCheckButton), for: .touchUpInside)
               nauseaCheckbox.addTarget(self, action: #selector(nauseaCheckButton), for: .touchUpInside)
        
        
               // ボタンに画像セット
               headacheCheckbox.setImage(UIImage(named: "checkbox_checked_icon"), for: UIControl.State.selected)
               runnynoseCheckbox.setImage(UIImage(named: "checkbox_checked_icon"), for: UIControl.State.selected)
               jointpainCheckbox.setImage(UIImage(named: "checkbox_checked_icon"), for: UIControl.State.selected)
               dizzyCheckbox.setImage(UIImage(named: "checkbox_checked_icon"), for: UIControl.State.selected)
               palpitationsCheckbox.setImage(UIImage(named: "checkbox_checked_icon"), for: UIControl.State.selected)
               stomachacheCheckbox.setImage(UIImage(named: "checkbox_checked_icon"), for: UIControl.State.selected)
               nauseaCheckbox.setImage(UIImage(named: "checkbox_checked_icon"), for: UIControl.State.selected)
        
               headacheCheckbox.setImage(UIImage(named: "checkbox_unchecked_icon"), for: UIControl.State.normal)
               runnynoseCheckbox.setImage(UIImage(named: "checkbox_unchecked_icon"), for: UIControl.State.normal)
               jointpainCheckbox.setImage(UIImage(named: "checkbox_unchecked_icon"), for: UIControl.State.normal)
               dizzyCheckbox.setImage(UIImage(named: "checkbox_unchecked_icon"), for: UIControl.State.normal)
               palpitationsCheckbox.setImage(UIImage(named: "checkbox_unchecked_icon"), for: UIControl.State.normal)
               stomachacheCheckbox.setImage(UIImage(named: "checkbox_unchecked_icon"), for: UIControl.State.normal)
               nauseaCheckbox.setImage(UIImage(named: "checkbox_unchecked_icon"), for: UIControl.State.normal)

        
               self.view.addSubview(headacheCheckbox)
               self.view.addSubview(runnynoseCheckbox)
               self.view.addSubview(jointpainCheckbox)
               self.view.addSubview(dizzyCheckbox)
               self.view.addSubview(palpitationsCheckbox)
               self.view.addSubview(stomachacheCheckbox)
               self.view.addSubview(nauseaCheckbox)

        // ここからテキストの処理
               // ラベルの生成
               let headacheLabel = UILabel()
               let runnynoseLabel = UILabel()
               let jointpainLabel = UILabel()
               let dizzyLabel = UILabel()
               let palpitationsLabel = UILabel()
               let stomachacheLabel = UILabel()
               let nauseaLabel = UILabel()
        
               // 位置とサイズの指定
               headacheLabel.frame = CGRect(x: 130, y: 250, width: UIScreen.main.bounds.size.width, height: 30)
               runnynoseLabel.frame = CGRect(x: 130, y: 300, width: UIScreen.main.bounds.size.width, height: 30)
               jointpainLabel.frame = CGRect(x: 130, y: 350, width: UIScreen.main.bounds.size.width, height: 30)
               dizzyLabel.frame = CGRect(x: 130, y: 400, width: UIScreen.main.bounds.size.width, height: 30)
               palpitationsLabel.frame = CGRect(x: 130, y: 450, width: UIScreen.main.bounds.size.width, height: 30)
               stomachacheLabel.frame = CGRect(x: 130, y: 500, width: UIScreen.main.bounds.size.width, height: 30)
               nauseaLabel.frame = CGRect(x: 130, y: 550, width: UIScreen.main.bounds.size.width, height: 30)
        
               // 横揃えの設定
               headacheLabel.textAlignment = NSTextAlignment.left
               runnynoseLabel.textAlignment = NSTextAlignment.left
               jointpainLabel.textAlignment = NSTextAlignment.left
               dizzyLabel.textAlignment = NSTextAlignment.left
               palpitationsLabel.textAlignment = NSTextAlignment.left
               stomachacheLabel.textAlignment = NSTextAlignment.left
               nauseaLabel.textAlignment = NSTextAlignment.left
        
               // テキストの設定
               headacheLabel.text = "頭痛がする"
               runnynoseLabel.text = "鼻水が出る"
               jointpainLabel.text = "手足の関節が痛い"
               dizzyLabel.text = "めまいがする"
               palpitationsLabel.text = "動悸がする"
               stomachacheLabel.text = "腹痛がある"
               nauseaLabel.text = "吐き気がする"
        
              // テキストカラーの設定
               headacheLabel.textColor = UIColor.black
               runnynoseLabel.textColor = UIColor.black
               jointpainLabel.textColor = UIColor.black
               dizzyLabel.textColor = UIColor.black
               palpitationsLabel.textColor = UIColor.black
               stomachacheLabel.textColor = UIColor.black
               nauseaLabel.textColor = UIColor.black
        
               // フォントの設定
               headacheLabel.font = UIFont(name: "Arial", size: 17)
               runnynoseLabel.font = UIFont(name: "Arial", size: 17)
               jointpainLabel.font = UIFont(name: "Arial", size: 17)
               dizzyLabel.font = UIFont(name: "Arial", size: 17)
               palpitationsLabel.font = UIFont(name: "Arial", size: 17)
               stomachacheLabel.font = UIFont(name: "Arial", size: 17)
               nauseaLabel.font = UIFont(name: "Arial", size: 17)
        
               // ラベルの追加
               self.view.addSubview(headacheLabel)
               self.view.addSubview(runnynoseLabel)
               self.view.addSubview(jointpainLabel)
               self.view.addSubview(dizzyLabel)
               self.view.addSubview(palpitationsLabel)
               self.view.addSubview(stomachacheLabel)
               self.view.addSubview(nauseaLabel)

        
        // ここからボタンの処理
        
              // Buttonを生成する.
                otherButton = UIButton()

                // ボタンのサイズ.
                let bWidth: CGFloat = 200
                let bHeight: CGFloat = 50

                // ボタンのX,Y座標.
                let posbuttonX: CGFloat = self.view.frame.width/2 - bWidth/2
                let posbuttonY: CGFloat = self.view.frame.height/1.3 - bHeight/2

                // ボタンの設置座標とサイズを設定する.
                otherButton.frame = CGRect(x: posbuttonX, y: posbuttonY, width: bWidth, height: bHeight)

                // ボタンの背景色を設定.
                otherButton.backgroundColor = UIColor.orange

                // ボタンの枠を丸くする.
                otherButton.layer.masksToBounds = true

                // コーナーの半径を設定する.
                otherButton.layer.cornerRadius = 20.0

                // タイトルを設定する(通常時).
                otherButton.setTitle("次へ", for: .normal)
                otherButton.setTitleColor(UIColor.white, for: .normal)

                // ボタンにタグをつける.
                otherButton.tag = 1

                // ボタンをViewに追加.
                self.view.addSubview(otherButton)
        
               // ボタンをタップで次画面に遷移.
                otherButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
                self.view.addSubview(otherButton)
         
               // 次の画面のBackボタンを「戻る」に変更
                self.navigationItem.backBarButtonItem = UIBarButtonItem(
                   title:  "",
                   style:  .plain,
                   target: nil,
                   action: nil
                 )

    }
    
    
 override func didReceiveMemoryWarning() {
               super.didReceiveMemoryWarning()
    }
    
            // チェックボックスのON/OFF処理
    @objc func headacheCheckButton(sender: UIButton){
                  headacheCheckbox.isSelected = !headacheCheckbox.isSelected
    }
    @objc func runnynoseCheckButton(sender: UIButton){
                  runnynoseCheckbox.isSelected = !runnynoseCheckbox.isSelected
    }
    @objc func jointpainCheckButton(sender: UIButton){
                  jointpainCheckbox.isSelected = !jointpainCheckbox.isSelected
    }
    @objc func dizzyCheckButton(sender: UIButton){
                  dizzyCheckbox.isSelected = !dizzyCheckbox.isSelected
    }
    @objc func palpitationsCheckButton(sender: UIButton){
                  palpitationsCheckbox.isSelected = !palpitationsCheckbox.isSelected
    }
    @objc func stomachacheCheckButton(sender: UIButton){
                  stomachacheCheckbox.isSelected = !stomachacheCheckbox.isSelected
    }
    @objc func nauseaCheckButton(sender: UIButton){
                  nauseaCheckbox.isSelected = !nauseaCheckbox.isSelected
    }

    
            // ボタンタップ処理
    @objc func didTapButton() {
               let storyboard: UIStoryboard = self.storyboard!
               let nextView = storyboard.instantiateViewController(withIdentifier: "ClinicList")
               self.hidesBottomBarWhenPushed = true
               navigationController?.pushViewController(nextView, animated: true)
               self.hidesBottomBarWhenPushed = false
   }
    
}
