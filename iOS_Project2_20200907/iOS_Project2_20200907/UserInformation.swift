//
//  UserInformation.swift
//  iOS_Project2_20200907
//
//  Created by 김태훈 on 2020/09/07.
//  Copyright © 2020 thoonk. All rights reserved.
//

import Foundation

class UserInformation{
    static let shared: UserInformation = UserInformation()
    
    var id: String?
    var password: String?
    var introduce: String?
    var phoneNumber: String?
    var birthDay: String?
}
