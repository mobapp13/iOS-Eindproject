//
//  Artist.swift
//  iOS Eindproject
//
//  Created by Marnix Steel on 29/01/2018.
//  Copyright © 2018 EhB. All rights reserved.
//

import Foundation

class Artist {
    
    var name: String
    var stage: String
    var time: String
    var bio: String
    var bioPic: String
    
    
    init (name: String, stage: String, time: String, bio: String, bioPic: String){
        self.name = name;
        self.stage = stage;
        self.time = time;
        self.bio = bio;
        self.bioPic = bioPic;
      
    }
    
}


