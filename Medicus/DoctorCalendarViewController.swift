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
    
    
    var reservation_reception_start_time_array = [String]()
    
    
    var reservation_reception_end_time_array = [String]()
    
    var reservation_reception_date_array = [String]()
        
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
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
        }()

    
        let dateString : String = dateFormatter1.string(from:date)
        print(dateString)
            
        if self.reservation_reception_date_array.contains(dateString) {
             
              return 1
            
            } else {
              print("失敗")
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
        
        for reservation_select_time in items {
        
        
            
           if reservation_reception_start_time_array <= reservation_select_time &&
              reservation_select_time <= reservation_reception_end_time_array/*(indexPath.row % 2 == 0)*/{
               cell.layer.backgroundColor = UIColor.orange.cgColor
               cell.layer.borderColor = UIColor.orange.cgColor
        
            } else {
               cell.layer.backgroundColor = UIColor.lightGray.cgColor
               cell.layer.borderColor = UIColor.lightGray.cgColor
            
          }
        
       }
        return cell
    }


}
