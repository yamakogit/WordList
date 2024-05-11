//
//  AddViewController.swift
//  WordList
//
//  Created by 山田航輝 on 2024/05/07.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [Dictionary<String,String>] = []
    
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if saveData.array(forKey: "WORD") != nil {
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String,String>]
        }

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveWord() {
        let english = englishTextField.text ?? ""
        let japanese = japaneseTextField.text ?? ""
        
        
        if english.isEmpty || japanese.isEmpty {
            let alert = UIAlertController(
            title: "保存できません",
            message: "単語を入力してください",
            preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
            self.present(alert, animated: true, completion: nil)
        } else {
            
            
            let wordDictionary = ["english": englishTextField.text!, "japanese": japaneseTextField.text!]
            wordArray.append(wordDictionary)
            saveData.set(wordArray, forKey: "WORD")
            
            let alert = UIAlertController(
                title: "保存完了",
                message: "単語の登録が完了しました",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
            self.present(alert, animated: true, completion: nil)
            englishTextField.text = ""
            japaneseTextField.text = ""
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
