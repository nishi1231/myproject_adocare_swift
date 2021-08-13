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
import SnapKit

class ListDetailViewController: UIViewController {
    
    var doctor_id  = Int()
    
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
    
    var reservation_reception_date_add = [String]()
    
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

        reservationButton.setTitle("      オンラインでの診察を申し込む      ", for: .normal)
        reservationButton.setTitleColor(UIColor.white, for: .normal)
        reservationButton.mode = .expanded
        reservationButton.setBackgroundColor(UIColor.orange)
        reservationButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        reservationButton.sizeToFit()
        reservationButton.tag = 1
        self.view.addSubview(reservationButton)
        reservationButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        reservationButton.snp.makeConstraints{ make in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-50)
        }
        
        
        getdoctorReservation()
        
        
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
        AF.request("http://127.0.0.1:8000/api/v1/product/doctorreservationreception?doctor=\(doctor_id)")
         .responseJSON{ [self]response in
              switch response.result {
                      case .success(let value):
                          // 成功の場合
                         let reservertion_jsonObject = JSON(value)
                         
                         
                         let doctor = reservertion_jsonObject.arrayValue.map { $0["doctor"].intValue }
                        
                         let start_time = reservertion_jsonObject.arrayValue.map { $0["start_time"].stringValue }
                        
                         let end_time = reservertion_jsonObject.arrayValue.map { $0["end_time"].stringValue }
                            
                         var number_count = 0
                        
                         for _ in 1..<14 {
                            number_count += 1
                            
                            var number_count_str:String = String(number_count)
                            var date_number: String = "date_number"
                            var date = date_number.replacingOccurrences(of: "_number", with: number_count_str)
                            
                            var reservation_date = reservertion_jsonObject.arrayValue.map { $0["reservation_dates"]["\(date)"].stringValue }
                            
                            reservation_reception_dates.append(contentsOf: reservation_date)
                            
                        }
                        
                         self.reservation_reception_start_time = start_time
                         self.reservation_reception_end_time = end_time
                             
                
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
