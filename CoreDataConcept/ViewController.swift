//
//  ViewController.swift
//  CoreDataConcept
//
//  Created by Rapipay Macintoshn on 08/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var idTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var phoneTF: UITextField!
    
    @IBOutlet weak var addressTF: UITextField!
    
    var employees: [Employee]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showDataAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ShowDataVC") as? ShowDataVC
        navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func saveDataAction(_ sender: Any) {
        CoreDataHelper.shared.save(data: ["name": nameTF.text!, "id": idTF.text!, "email": emailTF.text!, "phone": phoneTF.text!, "address": addressTF.text!])
    }
    
}

