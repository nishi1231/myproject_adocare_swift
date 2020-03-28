//
//  CoughCoiceViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2019/11/28.
//  Copyright © 2019 西山翔太. All rights reserved.
//

import UIKit

class CoughCoiceViewController: UIViewController {
    
    // ラベルのインスタンス生成
    private var CoughCoiceYesButton: UIButton!
    private var CoughCoiceNotButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

               // Buttonを生成する.
                CoughCoiceYesButton = UIButton()
                CoughCoiceNotButton = UIButton()

                // ボタンのサイズ.
                let bYesWidth: CGFloat = 100
                let bYesHeight: CGFloat = 100

                let bNotWidth: CGFloat = 100
                let bNotHeight: CGFloat = 100

               // ボタンのX,Y座標.
                let posYesX: CGFloat = self.view.frame.width/1.4 - bYesWidth/2
                let posYesY: CGFloat = self.view.frame.height/1.9 - bYesHeight/2
        
                let posNotX: CGFloat = self.view.frame.width/3.4 - bNotWidth/2
                let posNotY: CGFloat = self.view.frame.height/1.9 - bNotHeight/2
        
        
               // ボタンの設置座標とサイズを設定する.
                CoughCoiceYesButton.frame = CGRect(x: posYesX, y: posYesY, width: bYesWidth, height: bYesHeight)
                
                CoughCoiceNotButton.frame = CGRect(x: posNotX, y: posNotY, width: bNotWidth, height: bNotHeight)

              // ボタンの背景色を設定.
                CoughCoiceYesButton.backgroundColor = UIColor(red: 92/255, green: 193/255, blue: 220/255, alpha: 1)
                CoughCoiceNotButton.backgroundColor = UIColor(red: 236/255, green: 101/255, blue: 103/255, alpha: 1)

                // ボタンの枠を丸くする.
                CoughCoiceYesButton.layer.masksToBounds = true
                CoughCoiceNotButton.layer.masksToBounds = true

                // コーナーの半径を設定する.
                CoughCoiceYesButton.layer.cornerRadius = 20.0
                CoughCoiceNotButton.layer.cornerRadius = 20.0

                // タイトルを設定する(通常時).
                CoughCoiceYesButton.setTitle("はい", for: .normal)
                CoughCoiceYesButton.setTitleColor(UIColor.white, for: .normal)
                
                CoughCoiceNotButton.setTitle("いいえ", for: .normal)
                CoughCoiceNotButton.setTitleColor(UIColor.white, for: .normal)
        

                // ボタンにタグをつける.
                CoughCoiceYesButton.tag = 1
                CoughCoiceNotButton.tag = 2

                
                // ボタンをViewに追加.
                self.view.addSubview(CoughCoiceYesButton)
                self.view.addSubview(CoughCoiceNotButton)
        
               // ボタンをタップで次画面に遷移.
               CoughCoiceYesButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
               self.view.addSubview(CoughCoiceYesButton)
        
               CoughCoiceNotButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
               self.view.addSubview(CoughCoiceNotButton)
        
        

              // 次の画面のBackボタンを「戻る」に変更
              self.navigationItem.backBarButtonItem = UIBarButtonItem(
              title:  "",
              style:  .plain,
              target: nil,
              action: nil
               )
             }
    
    
    @objc func didTapButton() {
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "PeriodInput")
                self.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(nextView, animated: true)
                self.hidesBottomBarWhenPushed = false
            }
        }
    


