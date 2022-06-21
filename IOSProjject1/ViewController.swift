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
    
// for button disable and enable
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    //    Dictonary of all the guesses text fields
    var dictOfTextFields: [Int: UITextField] = [:]
    var selectedTF: UITextField?
    
    var selectedTFcoutRef: Int = 1;
    
    var selectedIndex: [Int] = []
    var selectedWord: [String] = []
    var dummyArray: [String] = ["MONEY", "LILLY", "VOGUE", "SHINE", "JIMMY"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSubmit.isEnabled = false

        dictOfTextFields[1] = guess11
        dictOfTextFields[2] = guess12
        dictOfTextFields[3] = guess13
        dictOfTextFields[4] = guess14
        dictOfTextFields[5] = guess15
        dictOfTextFields[6] = guess21
        dictOfTextFields[7] = guess22
        dictOfTextFields[8] = guess23
        dictOfTextFields[9] = guess24
        dictOfTextFields[10] = guess25
        dictOfTextFields[11] = guess31
        dictOfTextFields[12] = guess32
        dictOfTextFields[13] = guess33
        dictOfTextFields[14] = guess34
        dictOfTextFields[15] = guess35
        dictOfTextFields[16] = guess41
        dictOfTextFields[17] = guess42
        dictOfTextFields[18] = guess43
        dictOfTextFields[19] = guess44
        dictOfTextFields[20] = guess45
        dictOfTextFields[21] = guess51
        dictOfTextFields[22] = guess52
        dictOfTextFields[23] = guess53
        dictOfTextFields[24] = guess54
        dictOfTextFields[25] = guess55
        dictOfTextFields[26] = guess61
        dictOfTextFields[27] = guess62
        dictOfTextFields[28] = guess63
        dictOfTextFields[29] = guess64
        dictOfTextFields[30] = guess65
        // Do any additional setup after loading the view.
        initializeDefaultTextField()
        makeTextFieldSelected(pos: 1)
        
    }
    
    
    func initializeDefaultTextField(){
        for (pos,item) in dictOfTextFields {
            item.layer.borderColor = UIColor.lightGray.cgColor
            item.layer.borderWidth = 2.0
            item.layer.cornerRadius = 5
            item.isEnabled = false
        }
    }
    func makeTextFieldSelected(pos: Int){
        dictOfTextFields[pos]?.layer.borderColor = UIColor.darkGray.cgColor
        
    }
    @IBAction func keyboardKeyPressed(_ sender: UIButton) {
//       Code to handle keypress will go here
        var isErase: Bool = false
        btnBack.isEnabled = true

        var key: String = "a";
       
        switch sender.tag{
        case 1: // Q
            key = "Q"
            print("Q pressed")
            break;
        case 2: // W
            key = "W"
            print("W pressed")
            break
        case 3: // E
            key = "E"
            print("E pressed")
            break
        case 4: // R
            key = "R"
            print("R pressed")
            break
        case 5: // T
            key = "T"
            print("T pressed")
            break
        case 6: // Y
            key = "Y"
            print("Y pressed")
            break
        case 7: // U
            key = "U"
            print("U pressed")
            break
        case 8: // I
            key = "I"
            print("I pressed")
            break
        case 9: // O
            key = "O"
            print("O pressed")
            break
        case 10: // P
            key = "P"
            print("P pressed")
            break
        case 11: // A
            key = "A"
            print("A pressed")
            break
        case 12: // S
            key = "S"
            print("S pressed")
            break
        case 13: // D
            key = "D"
            print("D pressed")
            break
        case 14: // F
            key = "F"
            print("F pressed")
            break
        case 15: // G
            key = "G"
            print("G pressed")
            break
        case 16: // H
            key = "H"
            print("H pressed")
            break
        case 17: // J
            key = "J"
            print("J pressed")
            break
        case 18: // K
            key = "K"
            print("K pressed")
            break
        case 19: // L
            key = "L"
            print("L pressed")
            break
        case 20: // Z
            key = "Z"
            print("Z pressed")
            break
        case 21: // X
            key = "X"
            print("X pressed")
            break
        case 22: // C
            key = "C"
            print("C pressed")
            break
        case 23: // V
            key = "V"
            print("V pressed")
            break
        case 24: // B
            key = "B"
            print("B pressed")
            break
        case 25: //N
            key = "N"
            print("N pressed")
            break
        case 26: //M
            key = "M"
            print("M pressed")
            break
        case 27: // Delete
            print("Delete pressed")
            isErase = true
            break
        default:
            key = "A"
            break;
        }
        
        writeToGuess(word: key, isErase: isErase)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        
        print("Submit pressed")
        for item in selectedIndex {
            print("selectedIndex: \(item)")
            
        }
        for word in selectedWord {
            print("Selected word:\(word)")
        }
        let myFirstWord = selectedWord.joined(separator: "")
        //print(selectedWord.contains(selectedWord))
        print(myFirstWord)

        if(dummyArray.contains(myFirstWord)){
            let alert = UIAlertController(title: title, message: "You are Successfully added first word", preferredStyle: UIAlertController.Style.alert)
               alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
                   print("Action")
                   self.selectedIndex.removeAll()
                   self.selectedWord.removeAll()
                   self.btnBack.isEnabled = false
               }))
            self.present(alert, animated: true, completion: nil)

        }else{
            let alert = UIAlertController(title: title, message: "Word doesn't match, Please Try again", preferredStyle: UIAlertController.Style.alert)
               alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
                   print("Action")
                   self.btnBack.isEnabled = false

               }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func writeToGuess(word: String, isErase: Bool){
        
        print(word)
        if(isErase && selectedTFcoutRef >= 1 ){
          
            
            
            if(selectedTFcoutRef > 1){
                
                selectedTFcoutRef -= 1
                initializeDefaultTextField()
                makeTextFieldSelected(pos: selectedTFcoutRef)
                dictOfTextFields[selectedTFcoutRef]?.text = ""

                if(selectedWord.count > 0){
                    selectedWord.remove(at: selectedWord.count-1)
                }
                if(selectedIndex.count>0){
                    selectedIndex.remove(at: selectedIndex.count-1)

                }
            }else{
                initializeDefaultTextField()
                makeTextFieldSelected(pos: 1)
                selectedTFcoutRef = 1
                dictOfTextFields[selectedTFcoutRef]?.text = ""

            }
            
        }
        else if (!isErase &&  selectedTFcoutRef >= 1){
            dictOfTextFields[selectedTFcoutRef]?.text = word
            selectedTFcoutRef += 1
            initializeDefaultTextField()
            makeTextFieldSelected(pos: selectedTFcoutRef)
            //            we can change background color of specific text field here
            selectedIndex.append(selectedTFcoutRef)
            selectedWord.append(word)

        }
        print("index: ",selectedTFcoutRef)
        if(selectedIndex.count == 5){
            btnSubmit.isEnabled = true
        }else{
            btnSubmit.isEnabled = false
        }
        
    }
    
    
    
}

