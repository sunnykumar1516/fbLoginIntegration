//
//  SetttingsViewController.swift
//  protocolEG
//
//  Created by Kumari Anupam on 21/09/21.
//

import UIKit


protocol SetttingsViewControllerDelegate{
    func didchangeProfile(name:String);
}

class SetttingsViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lblName: UILabel!
    var delegate:SetttingsViewControllerDelegate? = nil;
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


    @IBAction func btnClick(_ sender: Any) {
        
        delegate?.didchangeProfile(name: txtName.text!);
        
        dismiss(animated: true, completion: nil)
    }
}
