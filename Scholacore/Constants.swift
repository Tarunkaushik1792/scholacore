//
//  Profile.swift
//  Scholacore
//
//  Created by Tarun kaushik on 03/05/17.
//  Copyright © 2017 Tarun kaushik. All rights reserved.
//

import Foundation
import Firebase


struct Constants {
    
    struct dataBaseReference {
       static let userProfile = FIRDatabase.database().reference().child("scProfiles")
       static let postsRef = FIRDatabase.database().reference()
    }
    
    struct storageReference {
       static let userProfileImage = FIRStorage.storage().reference().child("scProfileImages")
    }

}
