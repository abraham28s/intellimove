//
//  ViewControllerLogin.swift
//  intellimove
//
//  Created by Abraham Soto on 14/04/18.
//  Copyright © 2018 Abraham. All rights reserved.
//

import UIKit

class ViewControllerLogin: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    let globals = Globals()
    var campos:[UITextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let period1 = Period(day: "lunes", initialTime: "09.00", finalTime: "10.00")
        let period2 = Period(day: "lunes", initialTime: "09.00", finalTime: "11.00")
        let location = Direction(name: "Casa", street: "Calle", zipCode: "11400", state: "Mex", city: "CDMX", country: "MEx", period: [period1,period2])
        //print(location.toJSON())
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        campos = [emailField, passwordField]
        for cam in campos {
            cam.layer.borderColor = UIColor.white.cgColor
            cam.layer.borderWidth = 1.0;
            cam.layer.cornerRadius = 5.0;
            cam.attributedPlaceholder = NSAttributedString(string: (cam.placeholder!), attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        }
    }

    @IBAction func pressLogin(_ sender: Any) {
        if emailField.text == "" && passwordField.text == ""{
            self.present(globals.simpleAlert(titulo: "Error", texto: "Falta llenar campos requeridos"), animated: true, completion: nil)
        }else{
            let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainSB") as! ViewControllerMain
            self.present(newViewController, animated: true, completion: nil)
        }
        
        
    }
    
    @IBAction func pressRegister(_ sender: Any) {
        
    }
    
}
