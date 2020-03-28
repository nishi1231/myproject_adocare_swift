//
//  feverchoiceViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2019/10/07.
//  Copyright © 2019 西山翔太. All rights reserved.
//

import UIKit
 
class feverchoiceViewController: UIViewController {
 
    // ボタンのインスタンス生成
    private var medicusButton: UIButton!
    
    // 画像のインスタンス生成
    private var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
               // Buttonを生成する.
                medicusButton = UIButton()

                // ボタンのサイズ.
                let bWidth: CGFloat = 200
                let bHeight: CGFloat = 50

                // ボタンのX,Y座標.
                let posX: CGFloat = self.view.frame.width/2 - bWidth/2
                let posY: CGFloat = self.view.frame.height/1.3 - bHeight/2

                // ボタンの設置座標とサイズを設定する.
                medicusButton.frame = CGRect(x: posX, y: posY, width: bWidth, height: bHeight)

                // ボタンの背景色を設定.
                medicusButton.backgroundColor = UIColor.orange

                // ボタンの枠を丸くする.
                medicusButton.layer.masksToBounds = true

                // コーナーの半径を設定する.
                medicusButton.layer.cornerRadius = 20.0

                // タイトルを設定する(通常時).
                medicusButton.setTitle("受診する", for: .normal)
                medicusButton.setTitleColor(UIColor.white, for: .normal)

                // ボタンにタグをつける.
                medicusButton.tag = 1

                
                // ボタンをViewに追加.
                self.view.addSubview(medicusButton)
        
               // ボタンをタップで次画面に遷移.
               medicusButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
               self.view.addSubview(medicusButton)
        
        
        // ここから画像の設定
              // UIImageViewのサイズを設定する
               let iWidth: CGFloat = 300
               let iHeight: CGFloat = 300

              // UIImageViewのx,yを設定する
               let posimageX: CGFloat = (self.view.bounds.width - iWidth)/2
               let posimageY: CGFloat = (self.view.bounds.height - iHeight)/2

              // UIImageViewを作成.
              myImageView = UIImageView(frame: CGRect(x: posimageX, y: posimageY, width: iWidth, height: iHeight))

              // UIImageを作成.
              let myImage: UIImage = UIImage(named: "doctot_orange_icon")!

              // 画像をUIImageViewに設定する.
              myImageView.image = myImage

              // UIImageViewをViewに追加する
              self.view.addSubview(myImageView)
        
              self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
              self.navigationController?.navigationBar.shadowImage = UIImage()
              
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
                let nextView = storyboard.instantiateViewController(withIdentifier: "TemperatureChoice")
                self.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(nextView, animated: true)
                self.hidesBottomBarWhenPushed = false
           }

}

        

