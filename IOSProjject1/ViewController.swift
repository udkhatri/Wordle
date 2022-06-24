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
    
    // submit and back button
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
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
        initializeDefaultKeyboard()
        makeTextFieldSelected(pos: 1)
        randomWord = loadWords()
        print("randsom word is: ",randomWord)
        
    }
   
    // call this when you want generate a new word
    func loadWords() -> String {
        var fiveLetterWordArray:[String]?
        var result = ""
        //if you get access to the directory
        if let fileLocation = Bundle.main.url(forResource: "fiveLetterWords", withExtension: "txt")
        {
            // do catch in case of an error
            do
            {
                result = try String(contentsOf: fileLocation, encoding: .utf8)
            }
            catch
            {
                print(error)
            }
            fiveLetterWordArray = result.components(separatedBy: "\n")
        }
        
        let randomWordIndex = Int.random(in: 0..<5756)
        //returns a random word in form of a string or a default one in case it breaks
        return fiveLetterWordArray?[randomWordIndex] ?? "money"
        }
    
    func initializeDefaultTextField()
    {
        for (_,item) in dictOfTextFields
        {
            item.layer.borderColor = UIColor.lightGray.cgColor
            item.layer.borderWidth = 2.0
            item.layer.cornerRadius = 5
            item.isEnabled = false
            item.textColor = UIColor.black
            item.backgroundColor = UIColor.clear
        }
    }
    
    func initializeDefaultKeyboard()
    {
        for (_,item) in dictOfKeyboardBtn
        {
            item.tintColor = UIColor.gray
        }
        btnBack.tintColor = UIColor.gray
    }
    
    func makeTextFieldSelected(pos: Int)
    {
        dictOfTextFields[pos]?.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    @IBAction func keyboardKeyPressed(_ sender: UIButton)
    {
//       Code to handle keypress will go here
        var isErase: Bool = false
        
        var key: String = "A";
        if(!btnSubmit.isEnabled)
        {
        switch sender.tag
            {
        case 1: // Q
            key = "Q"
            break;
        case 2: // W
            key = "W"
            
            break
        case 3: // E
            key = "E"
            break
        case 4: // R
            key = "R"
            break
        case 5: // T
            key = "T"
            break
        case 6: // Y
            key = "Y"
            break
        case 7: // U
            key = "U"
            break
        case 8: // I
            key = "I"
            break
        case 9: // O
            key = "O"
            break
        case 10: // P
            key = "P"
            break
        case 11: // A
            key = "A"
            break
        case 12: // S
            key = "S"
            break
        case 13: // D
            key = "D"
            break
        case 14: // F
            key = "F"
            break
        case 15: // G
            key = "G"
            break
        case 16: // H
            key = "H"
            break
        case 17: // J
            key = "J"
            break
        case 18: // K
            key = "K"
            break
        case 19: // L
            key = "L"
            break
        case 20: // Z
            key = "Z"
            break
        case 21: // X
            key = "X"
            break
        case 22: // C
            key = "C"
            break
        case 23: // V
            key = "V"
            break
        case 24: // B
            key = "B"
            break
        case 25: //N
            key = "N"
            break
        case 26: //M
            key = "M"
            break
        case 27: // Delete
            isErase = true
            break
        default:
            key = ""
            break;
            }
        
        writeToGuess(word: key, isErase: isErase)
        }
//   if submit button is enabled and pressed delete then again disable submit button and delete last element from selectedWord
        else if(btnSubmit.isEnabled && sender.tag == 27 && selectedWord.count == 5)
        {
            writeToGuess(word: "", isErase: true)
            if(selectedWord.count != 5)
            {
                btnSubmit.isEnabled = false
            }
        }
    }
    
    func changeColorArr(buttonColor: UIColor? = nil, textFieldBackgroundColor: UIColor, btnTextColor: UIColor, counter: Int, wordArray: Array<Character>)
    {
        
        dictOfTextFields[count+counter]?.isEnabled = true
        dictOfTextFields[count+counter]?.backgroundColor = textFieldBackgroundColor
        dictOfTextFields[count+counter]?.isEnabled = false
        dictOfTextFields[count+counter]?.textColor = btnTextColor
        dictOfTextFields[count+counter]?.layer.borderWidth = 0.0
        if(buttonColor != nil){
            dictOfKeyboardBtn[wordArray[counter]]?.tintColor = buttonColor
        }
    }
    
    func changeColorDic(buttonColor: UIColor? = nil, textFieldBackgroundColor: UIColor, btnTextColor: UIColor, counter: Int, wordDic: Dictionary<Int, Character>)
    {
        
        dictOfTextFields[count+counter]?.isEnabled = true
        dictOfTextFields[count+counter]?.backgroundColor = textFieldBackgroundColor
        dictOfTextFields[count+counter]?.isEnabled = false
        dictOfTextFields[count+counter]?.textColor = btnTextColor
        dictOfTextFields[count+counter]?.layer.borderWidth = 0.0
        if(buttonColor != nil){
            dictOfKeyboardBtn[wordDic[counter]!]?.tintColor = buttonColor
        }
    }
    
    @IBAction func submitButton(_ sender: Any)
    {
        // Calling the viewDidLoad methods to "refresh" the VC
        print("Submit pressed",selectedWord)
        btnSubmit.isEnabled = false
        //Main Logic for comparison and coloring
        let wordGuess = selectedWord.joined(separator: "").lowercased()
        let wordGuessArray = Array(wordGuess)
        let randomWordArray = Array(randomWord)
        var remainingLettersArray = randomWordArray
        var GreenLetters: [Int:Character] = [:]
        var RedLetters: [Int:Character] = [:]
        var OrangeLetters: [Int:Character] = [:]
        var UnknownLetters: [Int: Character] = [:]
        
        if(dictOfTextFields[30]?.text == "")
        {
            
            // itterating first time and assigning collors to ones that are at right position and ones that are not in the word bckclr blue, text white tint blue
            for i in 0...wordGuessArray.count-1
            {
                print("count+ i : ",count+i)
                if wordGuessArray[i] == randomWordArray[i]
                {
                    changeColorArr(buttonColor: UIColor.blue, textFieldBackgroundColor: UIColor.blue, btnTextColor: UIColor.white, counter: i, wordArray: wordGuessArray)
                    GreenLetters.updateValue(wordGuessArray[i], forKey: i)
                    remainingLettersArray[i] = " "
                }
                else if randomWordArray.contains(wordGuessArray[i])
                {
                    UnknownLetters.updateValue(wordGuessArray[i], forKey: i)
                    RedLetters.updateValue(wordGuessArray[i], forKey: i)
                }
                else
                {
                    // background
                    changeColorArr(buttonColor: UIColor.darkGray, textFieldBackgroundColor: UIColor.darkGray, btnTextColor: UIColor.white, counter: i, wordArray: wordGuessArray)
                    RedLetters.updateValue(wordGuessArray[i], forKey: i)
                    remainingLettersArray[i] = " "
                }
            }
                        // itterating through unknown letters and sorting them to orange ones that are out of place
            for number in 0...4
            {
                for secondNumber in 0...4
                {
                    let unknownLetter = UnknownLetters[secondNumber] ?? "^"
                    
                    if  remainingLettersArray[number] == unknownLetter && remainingLettersArray[number] != " "
                    {
                        changeColorArr(buttonColor: UIColor.orange, textFieldBackgroundColor: UIColor.orange, btnTextColor: UIColor.white, counter: secondNumber, wordArray: remainingLettersArray)
                        OrangeLetters.updateValue(unknownLetter, forKey: secondNumber)
                        UnknownLetters.removeValue(forKey: secondNumber)
                        remainingLettersArray[number] = " "
                    }
                }
//   last itteration to put the remaining letters to right color, might want to add it to dictionary in the future
            }
            for (key,_) in UnknownLetters {
                changeColorDic(textFieldBackgroundColor: UIColor.darkGray, btnTextColor: UIColor.white, counter: key, wordDic: UnknownLetters)
                RedLetters.updateValue(UnknownLetters[key] ?? " ", forKey: key)
            }
            count = count + 5
        }
        //End of Logic for coloring guessed letters
        
        
        //matching random word with user input
        if(randomWord == wordGuess)
        {
            let alert = UIAlertController(
                    title: "Congratulations!",
                    message: "You successfully guessed the word!",
                    preferredStyle: UIAlertController.Style.alert)
            
               alert.addAction(UIAlertAction(
                    title: "Play Again!",
                    style: UIAlertAction.Style.default,
                    handler:
                        {
                            (action:UIAlertAction!) in
                        self.clearTextFields()
                        self.makeTextFieldSelected(pos: 1)
                        self.randomWord = self.loadWords()
                        self.initializeDefaultKeyboard()
                        self.initializeDefaultTextField()
                        self.count = 1
                        }
               ))
            
            self.present(alert, animated: true, completion: nil)

        }
        else if(dictOfTextFields[30]?.text != "")
        {
            let alert = UIAlertController(
                title: "Correct word: \(randomWord)",
                message: "\nSo close! Better luck next time ",
                preferredStyle: UIAlertController.Style.alert)
               alert.addAction(UIAlertAction(
                title: "Play Again?",
                style: UIAlertAction.Style.default,
                handler:
                    {(action:UIAlertAction!) in
                        self.clearTextFields()
                        self.makeTextFieldSelected(pos: 1)
                        self.randomWord = self.loadWords()
                        print("New word is \(self.randomWord)")
                    }
                ))
            
                self.present(alert, animated: true, completion: nil)
        }
        else
        {
            let alert = UIAlertController(
                title: title,
                message: "Word doesn't match, Please Try again",
                preferredStyle: UIAlertController.Style.alert)
            
               alert.addAction(UIAlertAction(
                title: "Ok",
                style: UIAlertAction.Style.default,
                handler:
                    {(action:UIAlertAction!) in
                        print("Action")
                    }
              ))
            
              self.present(alert, animated: true, completion: nil)
        }
        selectedWord.removeAll()
        
        if(dictOfTextFields[30]?.text != "")
        {
            initializeDefaultKeyboard()
            initializeDefaultTextField()
            count = 1
        }
    }
    
    func writeToGuess(word: String, isErase: Bool)
    {
        
        if(isErase && selectedTFcoutRef >= 1 )
        {
            if(selectedTFcoutRef > 1)
            {
                if(!selectedWord.isEmpty)
                {
                    selectedTFcoutRef -= 1
                    makeTextFieldSelected(pos: selectedTFcoutRef)
                    dictOfTextFields[selectedTFcoutRef]?.text = ""
//                    remove last word from selected array
                    _ = selectedWord.popLast() ?? "Empty array"
                }
                
            }
            else
            {
                makeTextFieldSelected(pos: 1)
                selectedTFcoutRef = 1
                dictOfTextFields[selectedTFcoutRef]?.text = ""
            }
            
        }
        else if (!isErase &&  selectedTFcoutRef >= 1)
        {
            dictOfTextFields[selectedTFcoutRef]?.text = word
            selectedTFcoutRef += 1
            makeTextFieldSelected(pos: selectedTFcoutRef)
            selectedWord.append(word)
        }
        //   If user fills all the words of the guess, disable all the text fields
                if(selectedWord.count == 5)
                {
                    btnSubmit.isEnabled = true
                }
    }
    
    func clearTextFields()
    {
        for (_,item) in dictOfTextFields
        {
                item.layer.borderColor = UIColor.lightGray.cgColor
                item.layer.borderWidth = 2.0
                item.layer.cornerRadius = 5
                item.isEnabled = false
                item.text = ""
        }
        selectedTFcoutRef = 1

    }
}

