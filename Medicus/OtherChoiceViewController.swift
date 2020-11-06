//
//  OtherChoiceViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2019/12/12.
//  Copyright © 2019 西山翔太. All rights reserved.
//

import UIKit
import SnapKit


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
        
        
               let  OtherChoiceLabel = UILabel()
               OtherChoiceLabel.textAlignment = NSTextAlignment.center
               OtherChoiceLabel.font = UIFont.systemFont(ofSize: 20)
               OtherChoiceLabel.text = "その他に出ている症状はありますか？"
               self.view.addSubview(OtherChoiceLabel)
              
               OtherChoiceLabel.snp.makeConstraints{ make in
                    make.width.equalTo(500)
                    make.height.equalTo(100)
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview().offset(-200)
               }
        
        
               headacheCheckbox = UIButton()
               runnynoseCheckbox = UIButton()
               jointpainCheckbox = UIButton()
               dizzyCheckbox = UIButton()
               palpitationsCheckbox = UIButton()
               stomachacheCheckbox = UIButton()
               nauseaCheckbox = UIButton()
        
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
    
        
               headacheCheckbox.snp.makeConstraints{ make in
                   make.width.equalTo(30)
                   make.height.equalTo(30)
                   make.centerX.equalToSuperview().offset(-100)
                   make.centerY.equalToSuperview().offset(-150)
               }
        
               runnynoseCheckbox.snp.makeConstraints{ make in
                   make.width.equalTo(30)
                   make.height.equalTo(30)
                   make.centerX.equalToSuperview().offset(-100)
                   make.centerY.equalToSuperview().offset(-100)
               }
               
               jointpainCheckbox.snp.makeConstraints{ make in
                   make.width.equalTo(30)
                   make.height.equalTo(30)
                   make.centerX.equalToSuperview().offset(-100)
                   make.centerY.equalToSuperview().offset(-50)
               }
        
               dizzyCheckbox.snp.makeConstraints{ make in
                   make.width.equalTo(30)
                   make.height.equalTo(30)
                   make.centerX.equalToSuperview().offset(-100)
                   make.centerY.equalToSuperview()
               }
               
               palpitationsCheckbox.snp.makeConstraints{ make in
                   make.width.equalTo(30)
                   make.height.equalTo(30)
                   make.centerX.equalToSuperview().offset(-100)
                   make.centerY.equalToSuperview().offset(+50)
               }
         
               stomachacheCheckbox.snp.makeConstraints{ make in
                   make.width.equalTo(30)
                   make.height.equalTo(30)
                   make.centerX.equalToSuperview().offset(-100)
                   make.centerY.equalToSuperview().offset(+100)
               }
        
               nauseaCheckbox.snp.makeConstraints{ make in
                   make.width.equalTo(30)
                   make.height.equalTo(30)
                   make.centerX.equalToSuperview().offset(-100)
                   make.centerY.equalToSuperview().offset(+150)
               }
        
        
        
        
        
        // ここからテキストの処理
               // ラベルの生成
               let headacheLabel = UILabel()
               let runnynoseLabel = UILabel()
               let jointpainLabel = UILabel()
               let dizzyLabel = UILabel()
               let palpitationsLabel = UILabel()
               let stomachacheLabel = UILabel()
               let nauseaLabel = UILabel()
        
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
        
               
               headacheLabel.snp.makeConstraints{ make in
                  make.width.equalTo(200)
                  make.height.equalTo(30)
                  make.centerX.equalToSuperview().offset(+50)
                  make.centerY.equalToSuperview().offset(-150)
                  }
       
               runnynoseLabel.snp.makeConstraints{ make in
                  make.width.equalTo(200)
                  make.height.equalTo(30)
                  make.centerX.equalToSuperview().offset(+50)
                  make.centerY.equalToSuperview().offset(-100)
                  }
              
               jointpainLabel.snp.makeConstraints{ make in
                  make.width.equalTo(200)
                  make.height.equalTo(30)
                  make.centerX.equalToSuperview().offset(+50)
                  make.centerY.equalToSuperview().offset(-50)
                  }
       
               dizzyLabel.snp.makeConstraints{ make in
                  make.width.equalTo(200)
                  make.height.equalTo(30)
                  make.centerX.equalToSuperview().offset(+50)
                  make.centerY.equalToSuperview()
                  }
              
               palpitationsLabel.snp.makeConstraints{ make in
                  make.width.equalTo(200)
                  make.height.equalTo(30)
                  make.centerX.equalToSuperview().offset(+50)
                  make.centerY.equalToSuperview().offset(+50)
                 }
        
               stomachacheLabel.snp.makeConstraints{ make in
                  make.width.equalTo(200)
                  make.height.equalTo(30)
                  make.centerX.equalToSuperview().offset(+50)
                  make.centerY.equalToSuperview().offset(+100)
                  }
       
               nauseaLabel.snp.makeConstraints{ make in
                  make.width.equalTo(200)
                  make.height.equalTo(30)
                  make.centerX.equalToSuperview().offset(+50)
                  make.centerY.equalToSuperview().offset(+150)
                 }

        
        // ここからボタンの処理
        
                otherButton = UIButton()
                otherButton.backgroundColor = UIColor.orange
                otherButton.layer.masksToBounds = true
                otherButton.layer.cornerRadius = 20.0
                otherButton.setTitle("次へ", for: .normal)
                otherButton.setTitleColor(UIColor.white, for: .normal)
                otherButton.tag = 1
                self.view.addSubview(otherButton)
                
                otherButton.snp.makeConstraints{ make in
                    make.width.equalTo(250)
                    make.height.equalTo(50)
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview().offset(+250)
                }
               
        
               // ボタンをタップで次画面に遷移.
                otherButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
                self.view.addSubview(otherButton)
         
               
                self.navigationController?.navigationBar.barTintColor = .white
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
                self.navigationController?.navigationBar.shadowImage = UIImage()
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
