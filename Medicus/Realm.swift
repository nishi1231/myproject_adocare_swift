//
//  Realm.swift
//  Medicus
//
//  Created by 西山翔太 on 2021/08/14.
//  Copyright © 2021 西山翔太. All rights reserved.
//

import Foundation
import RealmSwift


class Interview: Object {

    @objc dynamic var temperature: Float = 0.0
    @objc dynamic var cough: Bool = false
    @objc dynamic var period: Int = 0
    @objc dynamic var headache: Bool = false
    @objc dynamic var runnynose: Bool = false
    @objc dynamic var jointpain: Bool = false
    @objc dynamic var dizzy: Bool = false
    @objc dynamic var palpitations: Bool = false
    @objc dynamic var stomachache: Bool = false
    @objc dynamic var nausea: Bool = false

}
