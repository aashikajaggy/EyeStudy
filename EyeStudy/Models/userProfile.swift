//
//  userProfile.swift
//  dyzAR
//
//  Created by Aashika Jagadeesh on 6/1/20.
//  Copyright © 2020 Aashika Jagadeesh. All rights reserved.
//

import Foundation

class UserProfile {
    var uid: String
    var username: String
    var profileImage: URL
    init(uid: String, username: String, profileImage: URL){
        self.uid = uid
        self.username = username
        self.profileImage = profileImage
    }
}
