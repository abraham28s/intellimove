//
//  ViewControllerAddPeriod.swift
//  intellimove
//
//  Created by Abraham Soto on 15/04/18.
//  Copyright © 2018 Abraham. All rights reserved.
//

import UIKit

class ViewControllerAddPeriod: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: pickerData[component][row], attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
        return attributedString
    }
    
    
    @IBOutlet weak var selectDay: UIDatePicker!
    @IBOutlet weak var selectHoraInicio: UIPickerView!
    @IBOutlet weak var selectHoraTermino: UIPickerView!
    
    @IBOutlet weak var dayField: UITextField!
    @IBOutlet weak var inicioField: UITextField!
    @IBOutlet weak var finField: UITextField!
    var campos:[UITextField?] = []
    
    let pickerData = [["00", "01", "02", "03", "04", "05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","23"],["00","05","10","15","20","25","30","35","40","45","50","55"]]
    
    let dateFormatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectHoraInicio.delegate = self
        selectHoraTermino.delegate = self
        
        selectHoraInicio.dataSource = self
        selectHoraTermino.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pickerChanged(_ sender: Any) {
        
        dayField.text = dateFormatter.string(from: (sender as! UIDatePicker).date)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dateFormatter.timeStyle = DateFormatter.Style.none
        selectDay.setValue(UIColor.white, forKeyPath: "textColor")
        selectHoraInicio.setValue(UIColor.white, forKeyPath: "textColor")
        selectHoraTermino.setValue(UIColor.white, forKeyPath: "textColor")
        dateFormatter.dateStyle = DateFormatter.Style.medium
        campos = [dayField,inicioField,finField]
        dayField.attributedPlaceholder = NSAttributedString(string: dateFormatter.string(from: selectDay.date), attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        for cam in campos {
            cam?.layer.borderColor = UIColor.white.cgColor
            cam?.layer.borderWidth = 1.0;
            cam?.layer.cornerRadius = 5.0;
            cam?.attributedPlaceholder = NSAttributedString(string: (cam?.placeholder!)!, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        }
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
