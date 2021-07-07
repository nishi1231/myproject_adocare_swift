//
//  DoctorCalendarViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2020/11/26.
//  Copyright © 2020 西山翔太. All rights reserved.
//

import UIKit
import Foundation
import FSCalendar
import Alamofire
import SwiftyJSON



class DoctorCalendarViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var somedays : Array = [String]()
    
    var reservation_reception_date_array = [String]()

    
    fileprivate let gregorian = Calendar(identifier: .gregorian)
        fileprivate let formatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter
        }()
        
        fileprivate weak var calendar: FSCalendar!
        fileprivate weak var eventLabel: UILabel!
    
    
    var myCollectionView : UICollectionView!
    let items = ["8:00", "8:15", "8:30", "8:45", "9:00", "9:15","9:30","9:45","10:00","10:15","10:30","10:45","11:00","11:15","11:30","11:45","12:00","12:15","12:30","12:45","13:00","13:15","13:30","13:45","14:00","14:15","14:30","14:45","15:00","15:00","15:15","15:30","15:45","16:00","16:15","16:30","16:45","17:00","17:15","17:30","17:45","18:00","18:15","18:30","18:45","19:00","19:15","19:30","19:45","20:00","20:15","20:30","20:45"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let view = UIView(frame: UIScreen.main.bounds)
            view.backgroundColor = UIColor.white
            self.view = view
            
        let height: CGFloat = UIDevice.current.model.hasPrefix("iPad") ? 400 : 300
        let calendar = FSCalendar(frame: CGRect(x: 0, y: self.navigationController!.navigationBar.frame.maxY, width: view.frame.size.width, height: height))
            calendar.dataSource = self
            calendar.delegate = self
            calendar.allowsMultipleSelection = false
            view.addSubview(calendar)
            self.calendar = calendar
            
            calendar.appearance.headerDateFormat = "YYYY/MM"
            calendar.locale = Locale(identifier: "ja_JP")
            calendar.calendarWeekdayView.weekdayLabels[0].text = "日"
            calendar.calendarWeekdayView.weekdayLabels[1].text = "月"
            calendar.calendarWeekdayView.weekdayLabels[2].text = "火"
            calendar.calendarWeekdayView.weekdayLabels[3].text = "水"
            calendar.calendarWeekdayView.weekdayLabels[4].text = "木"
            calendar.calendarWeekdayView.weekdayLabels[5].text = "金"
            calendar.calendarWeekdayView.weekdayLabels[6].text = "土"
            calendar.calendarHeaderView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
            calendar.calendarWeekdayView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
            calendar.appearance.headerTitleColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
            calendar.appearance.weekdayTextColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 0.7)
            calendar.appearance.selectionColor = UIColor.orange
            calendar.appearance.eventOffset = CGPoint(x: 0, y: -7)
            calendar.appearance.todayColor = UIColor.lightGray

        
        let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 80, height: 50)
            layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)
            layout.scrollDirection = .horizontal
            myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)

        let screenSize: CGSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            myCollectionView = UICollectionView(
            frame: CGRect(x: 0, y:self.view.bounds.midY, width: screenSize.width, height: 70), collectionViewLayout: layout
             )
        
        
           myCollectionView.register(DoctorTimeChoiceCellViewController.self, forCellWithReuseIdentifier: "MyCell")
           myCollectionView.backgroundColor = UIColor.clear
           myCollectionView.delegate = self
           myCollectionView.dataSource = self
           self.view.addSubview(myCollectionView)  
        
        
           self.navigationController?.navigationBar.barTintColor = .white
           self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
           self.navigationController?.navigationBar.shadowImage = UIImage()
           self.navigationItem.backBarButtonItem = UIBarButtonItem(
                title:  "",
                style:  .plain,
               target: nil,
               action: nil
           )
        
        /*
           AF.request("http://127.0.0.1:8000/api/v1/product/doctorreservationreception?doctor=2")
            .responseJSON{ [self]response in
                 switch response.result {
                         case .success(let value):
                             // 成功の場合
                            let reservertion_jsonObject = JSON(value)
                            
                            
                            let doctor = reservertion_jsonObject.arrayValue.map { $0["doctor"].intValue }
                            
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
                            
                            self.reservation_reception_dates = reservation_dates_summry
                                
                            print("テスト")
                            print(doctor)
                            print(self.reservation_reception_dates)
                             
                         case .failure(let error):
                             // 失敗の場合
                             print(error.localizedDescription)
                             print("エラーです")
                 }
             }*/
        
        
    }


    
 
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "DoctorCalendar")
            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(nextView, animated: true)
            self.hidesBottomBarWhenPushed = false

    }
    
    
    
   func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int{
            
    
        let gregorian: Calendar = Calendar(identifier: .gregorian)
        var dateFormatter1: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
        }()

    //ここから前のコード
     /*   somedays = ["2021-06-03",
     
                    "2021-06-06",
                    "2021-06-12",
                    "2021-06-25"]*/
    
    //呼び出しタイミングで、値取得できていなさそう。
       print("関数で表示できるかテスト")
       print(self.reservation_reception_date_array)

    
        let dateString : String = dateFormatter1.string(from:date)
            
        if self.somedays.contains(dateString) {
             
              return 1
            
            } else {
            
              return 0
            
            }
       }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 53
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : DoctorTimeChoiceCellViewController = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! DoctorTimeChoiceCellViewController
            cell.layer.borderWidth = 2
            cell.layer.cornerRadius  = 14
        
            cell.textLabel?.text = self.items[indexPath.row]
        
        if(indexPath.row % 2 == 0){
            cell.layer.backgroundColor = UIColor.orange.cgColor
            cell.layer.borderColor = UIColor.orange.cgColor
        
        } else {
            cell.layer.backgroundColor = UIColor.lightGray.cgColor
            cell.layer.borderColor = UIColor.lightGray.cgColor
            
        }
        
        return cell
    }


}
