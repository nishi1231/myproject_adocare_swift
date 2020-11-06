//
//  AccountViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2020/08/25.
//  Copyright © 2020 西山翔太. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import KeychainSwift



class AccountViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
        var tableView:UITableView!
        let systemIcons = ["profile_icon","health_insurance_card_icon","notification_icon","terms_of_service_icon","signout_icon"]
        var items: [String] = ["プロフィール", "健康保険証", "通知", "利用規約", "ログアウト"]
    
        let keychain = KeychainSwift()
        var AccountKey = String()
        var LogoutKey = String()
        
    
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
    //セルタップし、値を渡し、遷移させる
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            switch indexPath.row {
                
            case 0:
                
                
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "OtherChoice")as!OtherChoiceViewController
                self.navigationController?.pushViewController(nextView, animated: true)
                self.hidesBottomBarWhenPushed = true

                
            case 1:
                
                
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "OtherChoice")as!OtherChoiceViewController
                self.navigationController?.pushViewController(nextView, animated: true)
                self.hidesBottomBarWhenPushed = true
                

            case 2:
                
                
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "OtherChoice")as!OtherChoiceViewController
                self.navigationController?.pushViewController(nextView, animated: true)
                self.hidesBottomBarWhenPushed = true
                

            case 3:
                
                
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "OtherChoice")as!OtherChoiceViewController
                self.navigationController?.pushViewController(nextView, animated: true)
                self.hidesBottomBarWhenPushed = true

                
            case 4:
                
                
                let alert: UIAlertController = UIAlertController(
                    title: "ログアウトしますか？",
                    message:  "",
                    preferredStyle:  UIAlertController.Style.alert
                    )
                
                let confirmAction: UIAlertAction = UIAlertAction(title: "ログアウトする", style: UIAlertAction.Style.default, handler:{
                    (action: UIAlertAction!) -> Void in
                    
                    //simulatorではnilになる。実機は未検証
                    self.keychain.accessGroup = "com.ADoCare.Medicus"
                    guard self.keychain.get(self.AccountKey) != nil else {
                        print("LogoutKeyがnilかも")
                        print(self.AccountKey)
                        return
                        
                    }
                    
                    print(self.AccountKey)
                    print("ログアウト処理")
                
                    let urlString: String = "http://127.0.0.1:8000/rest-auth/logout/"
                    let headers: HTTPHeaders = ["Authorization" : "Bearer "+self.AccountKey+"","Content-Type": "application/json"]
                    
                    AF.request(urlString, method: .post, parameters: nil, encoding: JSONEncoding.default , headers: headers)
                          .validate(statusCode: 200..<300)
                          .responseJSON { response in
                              switch response.result {
                                    
                                case .success(_):
                                      
                                    
                                      let storyboard: UIStoryboard = self.storyboard!
                                      let nextView = storyboard.instantiateViewController(withIdentifier: "Landing")
                                      self.hidesBottomBarWhenPushed = true
                                      self.navigationController?.pushViewController(nextView, animated: true)
                                      self.hidesBottomBarWhenPushed = false
                              
                                      print("ログアウト成功")
                                       
                                case .failure(_):
                                 
                                      print("ログアウト失敗")
                                      
                               }
                          }
                     }
        
               )
                // キャンセルボタンの処理
                let cancelAction: UIAlertAction = UIAlertAction(title: "戻る", style: UIAlertAction.Style.cancel, handler:{
                    (action: UIAlertAction!) -> Void in

                    
                    let when = DispatchTime.now() + 5
                            DispatchQueue.main.asyncAfter(deadline: when){
                                // your code with delay
                                alert.dismiss(animated: true, completion: nil)
                                
                            }
                       }
                )

                //UIAlertControllerにキャンセルボタンと確定ボタンをActionを追加
                alert.addAction(cancelAction)
                alert.addAction(confirmAction)

                //実際にAlertを表示する
                self.present(alert, animated: true, completion: nil)
                
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

