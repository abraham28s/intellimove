//
//  ViewControllerMain.swift
//  intellimove
//
//  Created by Abraham Soto on 15/04/18.
//  Copyright © 2018 Abraham. All rights reserved.
//

import UIKit

class ViewControllerMain: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tabla: UITableView!
    var data : [[String]] = []
    let globals = Globals()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "recoSB") as! ViewControllerRecommendations
        
        newViewController.datos.append([data[indexPath.row][2],data[indexPath.row][3],data[indexPath.row][4],data[indexPath.row][5]])
        
        newViewController.datos.append([data[indexPath.row][6],data[indexPath.row][7],data[indexPath.row][8],data[indexPath.row][9]])
        
        newViewController.datos.append([data[indexPath.row][10],data[indexPath.row][11],data[indexPath.row][12],data[indexPath.row][13]])
        self.present(newViewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell100", for: indexPath)
        cell.textLabel?.text = data[indexPath.row][0] + " a " + data[indexPath.row][1]
        
        return cell
    }
    
    func consumeWebServices(){
        let secondQueue = DispatchQueue.global()
        secondQueue.async {
            
            let urlStr = self.globals.server + "/recommendations/get"
            
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
        for travel in data {
            let tra = travel as! NSDictionary
            var newArr = [tra.value(forKey: "fromA") as! String,tra.value(forKey: "to") as! String]
            
            
            let arrOpts = tra.value(forKey: "data") as! NSArray
            
            for opt in arrOpts{
                let optObj = opt as! NSDictionary
                newArr.append((optObj.value(forKey: "vehicle") as! String))
                newArr.append(optObj.value(forKey: "icon") as! String)
                newArr.append(optObj.value(forKey: "leave") as! String)
                newArr.append(optObj.value(forKey: "tiempo") as! String)
            }
            self.data.append(newArr)
        }
        tabla.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.delegate = self
        tabla.dataSource = self
        consumeWebServices()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
