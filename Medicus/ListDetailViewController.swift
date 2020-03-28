//
//  ListDetailViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2020/03/08.
//  Copyright © 2020 西山翔太. All rights reserved.
//

import UIKit

class ListDetailViewController: UIViewController {
    
    
    private var doctorImageView: UIImageView!
    var doctornamelabel: UILabel!
    var doctornametext: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    //UIScrollViewのインスタンス作成
        let scrollView = UIScrollView()
        
        scrollView.frame = self.view.frame
        
        scrollView.contentSize = CGSize(width:self.view.frame.width, height:1000)
        
        self.view.addSubview(scrollView)
     
    // 医師画像の設定
        // UIImageViewのサイズを設定する
        let iWidth: CGFloat = 300
        let iHeight: CGFloat = 300

        // UIImageViewのx,yを設定する
        let posimageX: CGFloat = (self.view.bounds.width - iWidth)/2
        let posimageY: CGFloat = (self.view.bounds.height - iHeight)/2

        // UIImageViewを作成.
        doctorImageView = UIImageView(frame: CGRect(x: posimageX, y: posimageY, width: iWidth, height: iHeight))

        // UIImageを作成.
        let doctorImage: UIImage = UIImage(named: "doctot_orange_icon")!

        // 画像をUIImageViewに設定する.
        doctorImageView.image = doctorImage

        // UIImageViewをViewに追加する
        scrollView.addSubview(doctorImageView)

        
    // 医師名の設定
        
        doctornamelabel.text = doctornametext
        
        doctornamelabel.frame = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: 300)
        
        doctornamelabel.textAlignment = NSTextAlignment.center
        /*
        doctornamedetail.text = "医師名"
        */
        doctornamelabel.textColor = UIColor.black
        
        doctornamelabel.font = UIFont(name: "HiraKakuProN-W6", size: 20)
        
        scrollView.addSubview(doctornamelabel)
    
    // 病院名の設定
        let hospitalname = UILabel()
        
        hospitalname.frame = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: 350)
        
        hospitalname.textAlignment = NSTextAlignment.center
        
        hospitalname.text = "病院名"
        
        hospitalname.textColor = UIColor.black
        
        hospitalname.font = UIFont(name: "HiraKakuProN-W6", size: 17)
        
        scrollView.addSubview(hospitalname)
        
    // 紹介文の設定
        let introductiontext = UILabel()
        
        introductiontext.frame = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: 400)
        
        introductiontext.textAlignment = NSTextAlignment.center
        
        introductiontext.text = "紹介文"
        
        introductiontext.textColor = UIColor.black
        
        introductiontext.font = UIFont(name: "HiraKakuProN-W6", size: 17)
        
        scrollView.addSubview(introductiontext)

        

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
