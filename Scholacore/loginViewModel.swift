//
//  loginViewModel.swift
//  Scholacore
//
//  Created by Tarun kaushik on 30/04/17.
//  Copyright © 2017 Tarun kaushik. All rights reserved.
//

import Foundation
import Firebase

protocol loginDelegate:class{
    func userLoginSuccessFull(user : FIRUser?)
    func errorHandler(error:Error?)
}

class LoginViewModel:NSObject{
    var user = User()
    let preLoginAttemptLabel = "Login To Start"
    let activeLoginAttemptLabel = "Loging in..."
    let postLoginAttemptLabel = "Login Successful"
    let failedLoginAttemptLabel = "Try Again!"
    let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
    let emailWarning = "please enter your credentials"
    let passwordWarning = "Password is not correct"
    let initialPoint = CGPoint(x: 0 , y: 0)
    let movedPoint = CGPoint(x: 0 , y: 100)
    let profileRef = Constants.dataBaseReference.userProfile
    
    weak var delegate:loginDelegate?
    
    var homeVC:UIViewController{
    return storyboard.instantiateViewController(withIdentifier: "Home")
    }
    
    var profileVC:UIViewController{
     return storyboard.instantiateViewController(withIdentifier: "ProfilePage")
    }
    
    func checkUserLogedIn(ViewController: UIViewController){
        let view = ViewController as! testViewController
        if FIRAuth.auth()?.currentUser != nil {
        view.present(withoutAnimation: self.homeVC)
        }
    }
    
    
    func login(uEmail : String! , uPass : String!){
        FIRAuth.auth()?.signIn(withEmail: uEmail, password: uPass, completion: { (user, error) in
            if error != nil {
                self.delegate?.errorHandler(error: error)
                return
            }
           self.delegate?.userLoginSuccessFull(user: user)
        })
    }



}
