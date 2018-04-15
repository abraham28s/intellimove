//
//  ViewControllerLocations.swift
//  intellimove
//
//  Created by Abraham Soto on 14/04/18.
//  Copyright © 2018 Abraham. All rights reserved.
//

import UIKit

class ViewControllerLocations: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath)
        cell.textLabel?.text = data[indexPath.row][0]
        cell.detailTextLabel?.text = data[indexPath.row][1]
        return cell
    }
    
    
    @IBOutlet weak var tabla: UITableView!
    let globals = Globals()
    var data : [[String]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.delegate = self
        tabla.dataSource = self
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
