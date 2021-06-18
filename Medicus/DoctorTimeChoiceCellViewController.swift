//
//  DoctorTimeChoiceCellViewController.swift
//  Medicus
//
//  Created by 西山翔太 on 2021/01/17.
//  Copyright © 2021 西山翔太. All rights reserved.
//

import UIKit

class DoctorTimeChoiceCellViewController: UICollectionViewCell {

    
    var textLabel : UILabel?
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        textLabel = UILabel(frame: CGRect(x:0, y:0, width:frame.width, height:frame.height))
        textLabel?.text = "nil"
        //textLabel?.backgroundColor = UIColor.white
        textLabel?.textColor = UIColor.white
        textLabel?.font = UIFont.systemFont(ofSize: 15)
        textLabel?.textAlignment = NSTextAlignment.center
        

        self.contentView.addSubview(textLabel!)
    }
}
