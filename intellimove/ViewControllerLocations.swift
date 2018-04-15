//
//  ViewControllerLocations.swift
//  intellimove
//
//  Created by Abraham Soto on 14/04/18.
//  Copyright © 2018 Abraham. All rights reserved.
//

import UIKit

class ViewControllerLocations: UIViewController {
    
    let globals = Globals()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func pressBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pressInfo(_ sender: Any) {
        self.present(globals.simpleAlert(titulo: "Info", texto: "Las locaciones son los lugares que representan el origen y destino de tus trayectos: casa, oficina, gimnasio"), animated: true, completion: nil)
    }
    
}
