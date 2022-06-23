//
//  ViewController.swift
//  IOSProjject1
//
//  Created by Uday Khatri on 2022-05-30.
//

import UIKit

class ViewController: UIViewController {
    //FIRST KEYBOARD ROW
    @IBOutlet weak var Q: UIButton!
    @IBOutlet weak var W: UIButton!
    @IBOutlet weak var E: UIButton!
    @IBOutlet weak var R: UIButton!
    @IBOutlet weak var T: UIButton!
    @IBOutlet weak var Y: UIButton!
    @IBOutlet weak var U: UIButton!
    @IBOutlet weak var I: UIButton!
    @IBOutlet weak var O: UIButton!
    @IBOutlet weak var P: UIButton!
    //SECOND KEYBOARD ROW
    @IBOutlet weak var A: UIButton!
    @IBOutlet weak var S: UIButton!
    @IBOutlet weak var D: UIButton!
    @IBOutlet weak var F: UIButton!
    @IBOutlet weak var G: UIButton!
    @IBOutlet weak var H: UIButton!
    @IBOutlet weak var J: UIButton!
    @IBOutlet weak var K: UIButton!
    @IBOutlet weak var L: UIButton!
    //THIRD KEYBOARD ROW
    @IBOutlet weak var Z: UIButton!
    @IBOutlet weak var X: UIButton!
    @IBOutlet weak var C: UIButton!
    @IBOutlet weak var V: UIButton!
    @IBOutlet weak var B: UIButton!
    @IBOutlet weak var N: UIButton!
    @IBOutlet weak var M: UIButton!
    
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
    // Dictionary of all the buttons with Character as key so we can easily compare and color them
    var dictOfKeyboardBtn: [Character: UIButton] = [:]
    var selectedTF: UITextField?
    
    var selectedTFcoutRef: Int = 1;
    
    var selectedWord: [String] = []

    var randomWord: String = ""
    
    //added this count for testing but we might need a better solution to run through all 5 guesses
    var count = 1
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
        
        //keyboard buttons
        dictOfKeyboardBtn["q"] = Q
        dictOfKeyboardBtn["w"] = W
        dictOfKeyboardBtn["e"] = E
        dictOfKeyboardBtn["r"] = R
        dictOfKeyboardBtn["t"] = T
        dictOfKeyboardBtn["y"] = Y
        dictOfKeyboardBtn["u"] = U
        dictOfKeyboardBtn["i"] = I
        dictOfKeyboardBtn["o"] = O
        dictOfKeyboardBtn["p"] = P
        dictOfKeyboardBtn["a"] = A
        dictOfKeyboardBtn["s"] = S
        dictOfKeyboardBtn["d"] = D
        dictOfKeyboardBtn["f"] = F
        dictOfKeyboardBtn["g"] = G
        dictOfKeyboardBtn["h"] = H
        dictOfKeyboardBtn["j"] = J
        dictOfKeyboardBtn["k"] = K
        dictOfKeyboardBtn["l"] = L
        dictOfKeyboardBtn["z"] = Z
        dictOfKeyboardBtn["x"] = X
        dictOfKeyboardBtn["c"] = C
        dictOfKeyboardBtn["v"] = V
        dictOfKeyboardBtn["b"] = B
        dictOfKeyboardBtn["n"] = N
        dictOfKeyboardBtn["m"] = M
        
        // Do any additional setup after loading the view.
        initializeDefaultTextField()
        makeTextFieldSelected(pos: 1)
        randomWord = loadWords()
        print(randomWord)
        
    }
    
    // call this when you want generate a new word
    func loadWords() -> String {
        var fiveLetterWordArray:[String]?
        var result = ""
        //if you get access to the directory
        if let fileLocation = Bundle.main.url(forResource: "fiveLetterWords", withExtension: "txt"){
            
            // do catch in case of an error
            do{

                result = try String(contentsOf: fileLocation, encoding: .utf8)
            }
            catch{
                print(error)
            }
            fiveLetterWordArray = result.components(separatedBy: "\n")
        }
        
        let randomWordIndex = Int.random(in: 0..<5756)
        //returns a random word in form of a string
        return fiveLetterWordArray?[randomWordIndex] ?? "money"
        }
    
    func initializeDefaultTextField(){
        for (pos,item) in dictOfTextFields {
            item.layer.borderColor = UIColor.lightGray.cgColor
            item.layer.borderWidth = 2.0
            item.layer.cornerRadius = 5
            item.isEnabled = false
            item.backgroundColor = UIColor.clear
        }
    }
    func makeTextFieldSelected(pos: Int){
        dictOfTextFields[pos]?.layer.borderColor = UIColor.darkGray.cgColor
        
    }
    @IBAction func keyboardKeyPressed(_ sender: UIButton) {
//       Code to handle keypress will go here
        var isErase: Bool = false
        
        var key: String = "A";
        if(!btnSubmit.isEnabled){
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
            key = ""
            break;
        }
        
        writeToGuess(word: key, isErase: isErase)
        }
//        if submit button is enabled and pressed delete then again disable submit button and delete last element from selectedWord
        else if(btnSubmit.isEnabled && sender.tag == 27 && selectedWord.count == 5){
            writeToGuess(word: "", isErase: true)
            if(selectedWord.count != 5){
                btnSubmit.isEnabled = false
            }
        }
    }
    
    
    @IBAction func submitButton(_ sender: Any) {
        // Calling the viewDidLoad methods to "refresh" the VC
        print("Submit pressed",selectedWord)
       

        
        btnSubmit.isEnabled = false
        
        let myFirstWord = selectedWord.joined(separator: "").lowercased()

        //Main Logic for comparison and coloring
        let myFirstWordArray = Array(myFirstWord)
        let randomWordArray = Array(randomWord)
        var testArray = randomWordArray
        var GreenLetters: [Int:Character] = [:]
        var RedLetters: [Int:Character] = [:]
        var OrangeLetters: [Int:Character] = [:]
        var UnknownLetters: [Int: Character] = [:]
        
        // itterating first time and assigning collors to ones that are at right position and ones that are not in the word
        for i in 0...myFirstWordArray.count-1 {
    
            if myFirstWordArray[i] == randomWordArray[i] {
                dictOfTextFields[i+count]?.isEnabled = true
                dictOfTextFields[i+count]?.backgroundColor = UIColor.green
                dictOfTextFields[i+count]?.isEnabled = false
                dictOfKeyboardBtn[myFirstWordArray[i]]?.tintColor = UIColor.green
                GreenLetters.updateValue(myFirstWordArray[i], forKey: i)
                testArray[i] = " "
            }
            else if randomWordArray.contains(myFirstWordArray[i]){
                
                UnknownLetters.updateValue(myFirstWordArray[i], forKey: i)
          }
            else{
                dictOfTextFields[i+count]?.isEnabled = true
                dictOfTextFields[i+count]?.backgroundColor = UIColor.red
                dictOfTextFields[i+count]?.isEnabled = false
                RedLetters.updateValue(myFirstWordArray[i], forKey: i)
            }
        }
        
        // itterating through unknown letters and sorting them to orange ones that are out of place
        for number in 0...4{
            for secondNumber in 0...4{
                let unknownLetter = UnknownLetters[secondNumber] ?? "^"
                if  testArray[number] == unknownLetter && testArray[number] != " "{
                    // just some testing, we may still need it
                    print("Test array value \(testArray[number])")
                    print("Unknown letter value \(unknownLetter)")
                    print("Index aka number is \(number)")
                    
                    
                    dictOfTextFields[secondNumber+count]?.isEnabled = true
                    dictOfTextFields[secondNumber+count]?.backgroundColor = UIColor.orange
                    dictOfTextFields[secondNumber+count]?.isEnabled = false
                    OrangeLetters.updateValue(unknownLetter, forKey: secondNumber)
                    UnknownLetters.removeValue(forKey: secondNumber)
                    testArray[number] = " "
                    // same here, checking the status after each itteration
                    print("My test array \(testArray)")
                    print("These are orange now \(OrangeLetters)")
                    print("These are still unknown \(UnknownLetters)")

                }
            }
            // last itteration to put the remaining letters to right color, might want to add it to dictionary in the future
            for (key,_) in UnknownLetters {
                dictOfTextFields[key+count]?.isEnabled = true
                dictOfTextFields[key+count]?.backgroundColor = UIColor.red
                dictOfTextFields[key+count]?.isEnabled = false
            }
        }
        
        //End of Logic for coloring guessed letters
        
        //matching random word with user input
        if(randomWord == myFirstWord){
            let alert = UIAlertController(title: "Congratulations!", message: "You successfully guessed the word!", preferredStyle: UIAlertController.Style.alert)
               alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
                   self.clearTextFields()
                   self.makeTextFieldSelected(pos: 1)
                   self.randomWord = self.loadWords()
                   print("Action")
               }))
            self.present(alert, animated: true, completion: nil)

        }else if(dictOfTextFields[30]?.text != ""){
            let alert = UIAlertController(title: "Game Over", message: "So close! Better luck next time", preferredStyle: UIAlertController.Style.alert)
               alert.addAction(UIAlertAction(title: "Play Again?", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
                   self.clearTextFields()
                   self.makeTextFieldSelected(pos: 1)
                   self.randomWord = self.loadWords()
                   print("Action")
                   print("New word is \(self.randomWord)")
               }))
            
            
            self.present(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: title, message: "Word doesn't match, Please Try again", preferredStyle: UIAlertController.Style.alert)
               alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
                   print("Action")

               }))
            self.present(alert, animated: true, completion: nil)
        }
        selectedWord.removeAll()
        
        //resetting game
//        if(!(dictOfTextFields[30]?.text?.isEmpty ?? false)){
//            clearTextFields()
//            makeTextFieldSelected(pos: 1)
//
//        }
        count = +6
    }
    
    func writeToGuess(word: String, isErase: Bool){
        
        print("letter is: ",word)
        
        if(isErase && selectedTFcoutRef >= 1 ){
            if(selectedTFcoutRef > 1){
                if(!selectedWord.isEmpty){
                    selectedTFcoutRef -= 1
                    initializeDefaultTextField()
                    makeTextFieldSelected(pos: selectedTFcoutRef)
                    dictOfTextFields[selectedTFcoutRef]?.text = ""
//                    remove last word from selected array
                    let last = selectedWord.popLast() ?? "Empty array"
                    print("word is: ",selectedWord, selectedWord.count)
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
            selectedWord.append(word)

        }
        print("index: ",selectedWord.count)
        //        If user fills all the words of the guess, disable all the text fields
                if(selectedWord.count == 5){
                    initializeDefaultTextField()
                    btnSubmit.isEnabled = true
                }
        
    }
    func clearTextFields(){
            for (pos,item) in dictOfTextFields {
                item.layer.borderColor = UIColor.lightGray.cgColor
                item.layer.borderWidth = 2.0
                item.layer.cornerRadius = 5
                item.isEnabled = false
                item.text = ""
            }
        selectedTFcoutRef = 1

        }
 
    
}

