//
//  ViewController.swift
//  IOSProjject1
//
//  Created by Uday Khatri on 2022-05-30.
//

import UIKit

class ViewController: UIViewController {

//    for first guess
    @IBOutlet weak var guess15: UITextField!
    @IBOutlet weak var guess14: UITextField!
    @IBOutlet weak var guess11: UITextField!
    @IBOutlet weak var guess12: UITextField!
    @IBOutlet weak var guess13: UITextField!
    
//    for second guess
    @IBOutlet weak var guess21: UITextField!
    @IBOutlet weak var guess22: UITextField!
    @IBOutlet weak var guess23: UITextField!
    @IBOutlet weak var guess24: UITextField!
    @IBOutlet weak var guess25: UITextField!
    
//    for third guess
    @IBOutlet weak var guess31: UITextField!
    @IBOutlet weak var guess32: UITextField!
    @IBOutlet weak var guess33: UITextField!
    @IBOutlet weak var guess34: UITextField!
    @IBOutlet weak var guess35: UITextField!
    
//    for fourth guess
    @IBOutlet weak var guess41: UITextField!
    @IBOutlet weak var guess42: UITextField!
    @IBOutlet weak var guess43: UITextField!
    @IBOutlet weak var guess44: UITextField!
    @IBOutlet weak var guess45: UITextField!
    
//    for fifth guess
    @IBOutlet weak var guess51: UITextField!
    @IBOutlet weak var guess52: UITextField!
    @IBOutlet weak var guess53: UITextField!
    @IBOutlet weak var guess54: UITextField!
    @IBOutlet weak var guess55: UITextField!
    
//    for sixth guess
    @IBOutlet weak var guess61: UITextField!
    @IBOutlet weak var guess62: UITextField!
    @IBOutlet weak var guess63: UITextField!
    @IBOutlet weak var guess64: UITextField!
    @IBOutlet weak var guess65: UITextField!
    
    var listOfTF:[UITextField] = []
    var dictOfTextFields: [Int: UITextField] = [:]
    var selectedTF: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dictOfTextFields[11] = guess11
        dictOfTextFields[12] = guess12
        dictOfTextFields[13] = guess13
        dictOfTextFields[14] = guess14
        dictOfTextFields[15] = guess15
        dictOfTextFields[21] = guess21
        dictOfTextFields[22] = guess22
        dictOfTextFields[23] = guess23
        dictOfTextFields[24] = guess24
        dictOfTextFields[25] = guess25
        dictOfTextFields[31] = guess31
        dictOfTextFields[32] = guess32
        dictOfTextFields[33] = guess33
        dictOfTextFields[34] = guess34
        dictOfTextFields[35] = guess35
        dictOfTextFields[41] = guess41
        dictOfTextFields[42] = guess42
        dictOfTextFields[43] = guess43
        dictOfTextFields[44] = guess44
        dictOfTextFields[45] = guess45
        dictOfTextFields[51] = guess51
        dictOfTextFields[52] = guess52
        dictOfTextFields[53] = guess53
        dictOfTextFields[54] = guess54
        dictOfTextFields[55] = guess55
        dictOfTextFields[61] = guess61
        dictOfTextFields[62] = guess62
        dictOfTextFields[63] = guess63
        dictOfTextFields[64] = guess64
        dictOfTextFields[65] = guess65
        // Do any additional setup after loading the view.
       
        
        for (pos,item) in dictOfTextFields {
            item.layer.borderColor = UIColor.darkGray.cgColor
            item.layer.borderWidth = 2.0
            item.layer.cornerRadius = 5
            item.isEnabled = false
        }
    }
    
    func initializeDefaultTextField(_ :UITextField){
        
    }

}

