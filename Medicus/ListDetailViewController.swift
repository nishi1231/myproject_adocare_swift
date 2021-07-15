//
//  ListDetailViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2020/03/08.
//  Copyright © 2020 西山翔太. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
import Foundation

class ListDetailViewController: UIViewController {
    
    
    @IBOutlet weak var doctorimageview: UIImageView!
    var doctorimage: String!
    
    @IBOutlet weak var doctornamelabel: UILabel!
    var doctornametext: String?
    
    @IBOutlet weak var hospitalnamelabel: UILabel!
    var hospitalnametext: String?
    
    @IBOutlet weak var introductiontextlabel: UILabel!
    var introductiontext: String?
    
    private var reservationButton: UIButton!
    
    var reservation_reception_start_time = [String]()
    
    var reservation_reception_end_time = [String]()
    
    var reservation_reception_dates = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
     
        let scrollView = UIScrollView()
            scrollView.frame = self.view.frame
            scrollView.contentSize = CGSize(width:self.view.frame.width, height:1000)
            self.view.addSubview(scrollView)
     
     
            doctorimageview?.sd_setImage(with: URL(string: doctorimage), placeholderImage:UIImage(named:"loading_doctor_icon"))
            doctornamelabel.text = doctornametext
            hospitalnamelabel.text = hospitalnametext
            introductiontextlabel.text = introductiontext
            introductiontextlabel.numberOfLines = 0
            introductiontextlabel.sizeToFit() 
        
        
        let reservationButton = MDCFloatingButton()
        let bWidth: CGFloat = 200
        let bHeight: CGFloat = 50
        let posbuttonX: CGFloat = self.view.frame.width/2.4 - bWidth/2
        let posbuttonY: CGFloat = self.view.frame.height/1.1 - bHeight/2
        
        reservationButton.frame = CGRect(x: posbuttonX, y: posbuttonY, width: bWidth, height: bHeight)
        reservationButton.setTitle("      オンラインでの診察を申し込む      ", for: .normal)
        reservationButton.setTitleColor(UIColor.white, for: .normal)
        reservationButton.mode = .expanded
        reservationButton.setBackgroundColor(UIColor.orange)
        reservationButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        reservationButton.sizeToFit()
        reservationButton.tag = 1
        
        getdoctorReservation()
        
        
        // ボタンをタップで次画面に遷移.
         reservationButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        self.view.addSubview(reservationButton)
        
        
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
    
    
    //次画面でカレンダーに日付を渡すために、先に呼び出す。
    func getdoctorReservation() {
        AF.request("http://127.0.0.1:8000/api/v1/product/doctorreservationreception?doctor=2")
         .responseJSON{ [self]response in
              switch response.result {
                      case .success(let value):
                          // 成功の場合
                         let reservertion_jsonObject = JSON(value)
                         
                         
                         let doctor = reservertion_jsonObject.arrayValue.map { $0["doctor"].intValue }
                        
                         let start_time = reservertion_jsonObject.arrayValue.map { $0["start_time"].stringValue }
                        
                         let end_time = reservertion_jsonObject.arrayValue.map { $0["end_time"].stringValue }
                         
                         let reservation_dates1 = reservertion_jsonObject.arrayValue.map { $0["reservation_dates"]["date1"].stringValue }
                         
                         let reservation_dates2 = reservertion_jsonObject.arrayValue.map { $0["reservation_dates"]["date2"].stringValue }
                         
                         let reservation_dates3 = reservertion_jsonObject.arrayValue.map { $0["reservation_dates"]["date3"].stringValue }
                     
                         let reservation_dates4 = reservertion_jsonObject.arrayValue.map { $0["reservation_dates"]["date4"].stringValue }
                     
                         let reservation_dates5 = reservertion_jsonObject.arrayValue.map { $0["reservation_dates"]["date5"].stringValue }
                     
                         let reservation_dates6 = reservertion_jsonObject.arrayValue.map { $0["reservation_dates"]["date6"].stringValue }
                     
                         let reservation_dates7 = reservertion_jsonObject.arrayValue.map { $0["reservation_dates"]["date7"].stringValue }
                     
                         let reservation_dates8 = reservertion_jsonObject.arrayValue.map { $0["reservation_dates"]["date8"].stringValue }
                     
                         let reservation_dates9 = reservertion_jsonObject.arrayValue.map { $0["reservation_dates"]["date9"].stringValue }
                     
                         let reservation_dates10 = reservertion_jsonObject.arrayValue.map { $0["reservation_dates"]["date10"].stringValue }
                     
                         let reservation_dates11 = reservertion_jsonObject.arrayValue.map { $0["reservation_dates"]["date11"].stringValue }
                     
                         let reservation_dates12 = reservertion_jsonObject.arrayValue.map { $0["reservation_dates"]["date12"].stringValue }
                     
                         let reservation_dates13 = reservertion_jsonObject.arrayValue.map { $0["reservation_dates"]["date13"].stringValue }
                     
                         let reservation_dates14 = reservertion_jsonObject.arrayValue.map { $0["reservation_dates"]["date14"].stringValue }
                        
                         let reservation_dates_summry =
                                    reservation_dates1 +
                                    reservation_dates2 +
                                    reservation_dates3 +
                                    reservation_dates4 +
                                    reservation_dates5 +
                                    reservation_dates6 +
                                    reservation_dates7 +
                                    reservation_dates8 +
                                    reservation_dates9 +
                                    reservation_dates10 +
                                    reservation_dates11 +
                                    reservation_dates12 +
                                    reservation_dates13 +
                                    reservation_dates14
                         
                        
                         self.reservation_reception_start_time = start_time
                         
                         self.reservation_reception_end_time = end_time
                        
                         self.reservation_reception_dates = reservation_dates_summry
                             
                
                         print(doctor)
                         print(start_time)
                         print(end_time)
                         print(self.reservation_reception_dates)
                          
                      case .failure(let error):
                          // 失敗の場合
                          print(error.localizedDescription)
                          print("エラーです")
              }
          }
        
    }
    
    // ボタンタップ処理
     @objc func didTapButton() {
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "DoctorCalendar") as! DoctorCalendarViewController
                self.hidesBottomBarWhenPushed = true
        
                nextView.reservation_reception_start_time_array = self.reservation_reception_start_time
        
                nextView.reservation_reception_end_time_array = self.reservation_reception_end_time
        
                nextView.reservation_reception_date_array = self.reservation_reception_dates
        
                navigationController?.pushViewController(nextView, animated: true)
                self.hidesBottomBarWhenPushed = false
        
            }
    
     }
