//
//  ViewControllerRecommendations.swift
//  intellimove
//
//  Created by Abraham Soto on 15/04/18.
//  Copyright © 2018 Abraham. All rights reserved.
//

import UIKit

class ViewControllerRecommendations: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellmil", for: indexPath)
        cell.textLabel?.text = datos[indexPath.row][0]
        cell.imageView?.contentMode = .scaleAspectFit
       cell.imageView?.sd_setImage(with: URL(string: datos[indexPath.row][1]), placeholderImage: UIImage(named: "logo.png"))
        //cell.imageView?.image = UIImage(data: Data(contentsOf: URL(string: datos[indexPath.row][1])!))
        cell.imageView?.layer.masksToBounds = true
        let detalle:String = "Salida: " +  datos[indexPath.row][2] + ". Tiempo aproximado: " + datos[indexPath.row][3]
        cell.detailTextLabel?.text = detalle
        return cell
    }
    
    @IBOutlet weak var tabla: UITableView!
    
    var datos : [[String]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.delegate = self
        tabla.dataSource = self
        tabla.isUserInteractionEnabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
