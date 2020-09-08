//
//  AccountViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2020/08/25.
//  Copyright © 2020 西山翔太. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
        var tableView:UITableView!
        let systemIcons = ["profile_icon","health_insurance_card_icon","notification_icon","terms_of_service_icon","signout_icon"]
        var items: [String] = ["プロフィール", "健康保険証", "通知", "利用規約", "ログアウト"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
          tableView = UITableView()
          tableView.frame = self.view.frame
          tableView.tableFooterView = UIView(frame: .zero)
          tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SampleCell")
          tableView.dataSource = self
          tableView.delegate = self
          tableView.separatorStyle = .none
          view.addSubview(self.tableView)
        
          
        }
    //セルタップし、値を渡し、遷移させる
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            switch indexPath.row {
            case 0:
                // 数学Iのセルタップ時処理
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "OtherChoice")as!OtherChoiceViewController
                self.navigationController?.pushViewController(nextView, animated: true)
                self.hidesBottomBarWhenPushed = true

            case 1:
                // 数学Aのセルタップ時
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "OtherChoice")as!OtherChoiceViewController
                self.navigationController?.pushViewController(nextView, animated: true)
                self.hidesBottomBarWhenPushed = true

            case 2:
                // 数学IIのセルタップ時
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "OtherChoice")as!OtherChoiceViewController
                self.navigationController?.pushViewController(nextView, animated: true)
                self.hidesBottomBarWhenPushed = true

            case 3:
                // 数学Bのセルタップ時
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "OtherChoice")as!OtherChoiceViewController
                self.navigationController?.pushViewController(nextView, animated: true)
                self.hidesBottomBarWhenPushed = true

            case 4:
                // 数学IIIのセルタップ時
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "OtherChoice")as!OtherChoiceViewController
                self.navigationController?.pushViewController(nextView, animated: true)
                self.hidesBottomBarWhenPushed = true

            case 5:
                // 数学Cのセルタップ時
                /*let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "OtherChoice")as!OtherChoiceViewController
                self.navigationController?.pushViewController(nextView, animated: true)
                self.hidesBottomBarWhenPushed = true*/
                
                //アラート生成
                //UIAlertControllerのスタイルがalert
                let alert: UIAlertController = UIAlertController(
                    title: "ログアウトしますか？",
                    message:  "",
                    preferredStyle:  UIAlertController.Style.alert
                    )
                // 確定ボタンの処理
                let confirmAction: UIAlertAction = UIAlertAction(title: "ログアウトする", style: UIAlertAction.Style.default, handler:{
                    // 確定ボタンが押された時の処理をクロージャ実装する
                    (action: UIAlertAction!) -> Void in
                    //実際の処理
                    print("ログアウト")
                    
                    
                    
                    
                    
                    
                })
                // キャンセルボタンの処理
                let cancelAction: UIAlertAction = UIAlertAction(title: "戻る", style: UIAlertAction.Style.cancel, handler:{
                    // キャンセルボタンが押された時の処理をクロージャ実装する
                    (action: UIAlertAction!) -> Void in
                    //実際の処理
                    print("キャンセル")
                })

                //UIAlertControllerにキャンセルボタンと確定ボタンをActionを追加
                alert.addAction(cancelAction)
                alert.addAction(confirmAction)

                //実際にAlertを表示する
                        present(alert, animated: true, completion: nil)
                
            default:
               
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "OtherChoice")as!OtherChoiceViewController
                self.navigationController?.pushViewController(nextView, animated: true)
                self.hidesBottomBarWhenPushed = true

            }
        }

    // cellの数
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return items.count
        
            }
    
    
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 50
        
             }

    // cellの作成
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->     UITableViewCell {
            
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
                cell.textLabel?.text = items[indexPath.row]
                cell.imageView?.image = UIImage(named:systemIcons[indexPath.row])?.withRenderingMode(.alwaysTemplate)
                cell.imageView?.tintColor = .orange
                return cell
               
              }
    
    }

