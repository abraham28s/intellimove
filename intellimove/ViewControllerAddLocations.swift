//
//  ViewControllerAddLocations.swift
//  intellimove
//
//  Created by Abraham Soto on 15/04/18.
//  Copyright © 2018 Abraham. All rights reserved.
//

import UIKit

class ViewControllerAddLocations: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    
    
    var data:[[String]] = []
    let globals = Globals()
    var campos:[UITextField] = []
    
    @IBOutlet weak var tabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.delegate = self
        tabla.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        campos = [name,address]
        for cam in campos {
            cam.layer.borderColor = UIColor.white.cgColor
            cam.layer.borderWidth = 1.0;
            cam.layer.cornerRadius = 5.0;
            cam.attributedPlaceholder = NSAttributedString(string: (cam.placeholder!), attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        }
    }
    
    @IBAction func pressAdd(_ sender: Any) {
        let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addperiodSB") as! ViewControllerAddPeriod
        self.present(newViewController, animated: true, completion: nil)
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pressInfo(_ sender: Any) {
        self.present(globals.simpleAlert(titulo: "Info", texto: "Los periodos es el espacio en el tiempo que estaras en esta locación."), animated: true, completion: nil)
    }
    
    @IBAction func pressGuardar(_ sender: Any) {
        if (name.text == "" && address.text == ""){
            self.present(globals.simpleAlert(titulo: "Error", texto: "Faltan campos requeridos."), animated: true, completion: nil)
        }else{
            let papa = self.presentingViewController as! ViewControllerLocations
            papa.data.append([name.text!,address.text!])
            papa.tabla.reloadData()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        cell.textLabel?.text = data[indexPath.row][0]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}
