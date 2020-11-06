//
//  ListDetailViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2020/03/08.
//  Copyright © 2020 西山翔太. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming

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
            introductiontextlabel.sizeToFit() //上寄せをリファクタする.snapkitでできるかも。
        
        
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
    
    // ボタンタップ処理
     @objc func didTapButton() {
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "ClinicList")
                self.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(nextView, animated: true)
                self.hidesBottomBarWhenPushed = false
            }
    
     }
