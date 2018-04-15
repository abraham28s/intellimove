//
//  ViewControllerRegister.swift
//  intellimove
//
//  Created by Abraham Soto on 14/04/18.
//  Copyright © 2018 Abraham. All rights reserved.
//

import UIKit
import SDWebImage

class ViewControllerRegister: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmField: UITextField!
    @IBOutlet weak var presupuestoField: UITextField!
    
    @IBOutlet weak var tablaTransportes: UITableView!
    var transportes: [Transport] = []
    
    var campos:[UITextField?] = []
    
    let globals = Globals()

    override func viewDidLoad() {
        super.viewDidLoad()
        consumeWebServices()
        tablaTransportes.delegate = self
        tablaTransportes.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        campos = [nameField,lastnameField,emailField,passwordField,confirmField,presupuestoField]
        for cam in campos {
            cam?.layer.borderColor = UIColor.white.cgColor
            cam?.layer.borderWidth = 1.0;
            cam?.layer.cornerRadius = 5.0;
            cam?.attributedPlaceholder = NSAttributedString(string: (cam?.placeholder!)!, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        }
    }
    
    
    func consumeWebServices(){
        let secondQueue = DispatchQueue.global()
        secondQueue.async {
            
            let urlStr = self.globals.server + "/vehicles/get"
            
            let urlObject = URL(string: urlStr)
            var req = URLRequest(url: urlObject!)
            req.httpMethod = "GET"
            print(req)
            URLSession.shared.dataTask(with: req, completionHandler: {
                (data, response, error) in
                if(error != nil){
                    print("error")
                }else{
                    do{
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                        
                        DispatchQueue.main.async {
                            self.parsea(json: json!)
                        }
                        
                    }catch let error as NSError{
                        print(error)
                    }
                }
            }).resume()
        }
    }
    
    func parsea(json: NSDictionary){
        let data = json.value(forKey: "data") as! NSArray
        for vehicle in data {
            let trans = vehicle as! NSDictionary
            let costo: Int = trans.value(forKey: "cost") as! Int
            let nombre = trans.value(forKey: "name") as! String
            let aid = trans.value(forKey: "_id") as! String
            let descrip = trans.value(forKey: "description") as! String
            let maxDis = Int(trans.value(forKey: "maxDistance") as! String)
            let transObject = Transport(_id: aid, cost: costo, description: descrip , icon: trans.value(forKey: "icon") as! String, maxDistance: maxDis!, name: nombre)
            transportes.append(transObject)
            
        }
        tablaTransportes.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == UITableViewCellAccessoryType.none {
            cell?.accessoryType = .checkmark
        } else{
            cell?.accessoryType = .none
        }
    }
    
    @IBAction func pressInfo(_ sender: Any) {
        self.present(globals.simpleAlert(titulo: "Info", texto: "El presupuesto se refiere al dinero que quieres usar semanalmente en transporte, este sirve para delimitar las opciones que entren en tu presupuesto."), animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transportes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = globals.hexStringToUIColor(hex: "2D323E")
        cell.textLabel?.textColor = UIColor.white
        cell.detailTextLabel?.textColor = UIColor.white
        cell.detailTextLabel?.text = "Costo: \(transportes[indexPath.row].cost)"
        cell.textLabel?.text = transportes[indexPath.row].name
        cell.imageView?.contentMode = .scaleAspectFit
        cell.imageView?.sd_setImage(with: URL(string: transportes[indexPath.row].icon), placeholderImage: UIImage(named: "logo.png"))
        return cell
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func pressBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
