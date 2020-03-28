//
//  ClinicListViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2020/01/30.
//  Copyright © 2020 西山翔太. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

  struct Doctor : Codable{
    let id : Int
    let full_name: String
    let hospital_name : String
    let introduction_text : String
    let profile_image : String
   }

class ClinicListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var doctors : [Doctor]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView : UITableView!
        tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        tableView.estimatedRowHeight = 500
        
        // 次の画面のBackボタンを「戻る」に変更
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
           title:  "",
           style:  .plain,
          target: nil,
          action: nil
         )
        
        //DoctorテーブルからAPIで取得
        Alamofire.request("http://127.0.0.1:8000/api/v1/product/")
            .responseJSON{res in
                guard let json = res.data
                else{
                    return
                }
                self.doctors = try! JSONDecoder().decode([Doctor].self, from: json)

                //Debug
                print("--- Doctors JSON ---")
                print(JSON(json))
                print("--- Doctors Info ---")
                for doctor in self.doctors!{
                    print("NAME:" + doctor.full_name)
                    print("NAME:" + doctor.hospital_name)
                    print("NAME:" + doctor.introduction_text)
                    print("NAME:" + doctor.profile_image)
                }
                tableView.reloadData()
           }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cnt = self.doctors?.count{return cnt}
        return 0
    }
    
    //セルの高さを指定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    //セルの表示情報を指定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CELL")
        if let doctor = self.doctors?[indexPath.row]{
            cell.textLabel?.text = doctor.full_name
            cell.detailTextLabel?.text = doctor.introduction_text
            cell.imageView?.sd_setImage(with: URL(string: doctor.profile_image), placeholderImage:UIImage(named:"loading_doctor_icon"))
        }
        return cell
    }
    
    //セルタップし、値を渡し、遷移させる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //選択したいdoctorを取得
        if let selecteddoctor = self.doctors?[indexPath.row]{
        
        //ListDetailViewへ遷移する
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "ListDetail")as!ListDetailViewController
        self.hidesBottomBarWhenPushed = true
        
        //ListDetailViewへ値を渡す
        nextView.doctornametext? = selecteddoctor.full_name
        
        //pushで遷移する
        navigationController?.pushViewController(nextView, animated: true)
        self.hidesBottomBarWhenPushed = false
        }
        
       }
    
    }
    


    

