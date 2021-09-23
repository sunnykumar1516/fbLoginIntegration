//
//  ViewController.swift
//  protocolEG
//
//  Created by Kumari Anupam on 21/09/21.
//

import UIKit
import FBSDKLoginKit
class ViewController: UIViewController,LoginButtonDelegate,SetttingsViewControllerDelegate {
    
    
    
    func didchangeProfile(name: String) {
        self.lbl.text = name;
    }
    
   
    
    @IBOutlet weak var btn: FBLoginButton!
    
    @IBOutlet weak var lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let vc = SetttingsViewController();
        vc.delegate = self;
        self.lbl.text = "snygg";
        if let token = AccessToken.current,
               !token.isExpired {
               // User is logged in, do work such as go to next view controller.
           }
        
        let loginButton = FBLoginButton()
        loginButton.center = view.center
        loginButton.delegate = self;
       // btn.delegate = self;
        loginButton.permissions = ["public_profile", "email"]
                view.addSubview(loginButton)
    }


    @IBAction func btnNext(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "second") as! SetttingsViewController
        vc.delegate = self;
        self.present(vc, animated: false, completion: nil)
    }
    
    
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString;
        let req = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                             parameters: ["fields":"email,name"],
                                             tokenString: token,
                                             version: nil,
                                             httpMethod: .get)
        req.start(completion: { connection, res, error in
            print(res)
        })
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "pass" {
//                    let vc: SetttingsViewController = segue.destination as! SetttingsViewController
//                    vc.delegate = self
//                }
    }
}


