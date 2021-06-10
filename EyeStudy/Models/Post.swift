//
//  Post.swift
//  dyzAR
//
//  Created by Aashika Jagadeesh on 5/31/20.
//  Copyright © 2020 Aashika Jagadeesh. All rights reserved.
//

import Foundation

class Post {
    var id:String
    var author:UserProfile
    var title:String
    var text:String
    var link:URL
    var createdAt: Date
    init (id: String, author: UserProfile, title: String, text: String, link: URL, timestamp: Double) {
        self.id = id
        self.author = author
        
        self.title = title
        self.text = text
        self.link = link
        self.createdAt = Date(timeIntervalSince1970: timestamp/1000)
    }
}
