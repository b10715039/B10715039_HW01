//
//  ViewController.swift
//  B10715039_HW01
//
//  Created by Jia-Ru Song on 2022/2/28.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource ,UIPickerViewDelegate {
    
    let symbol = ["🍏", "🍊", "🍌",
                  "🍉", "🍇", "🍅", "🥝"
    ]
    var score = 0
    var scroll = 0
    var col1 = [String]()
    var col2 = [String]()
    var col3 = [String]()
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var bingoLabel: UILabel!
    @IBOutlet weak var scrollCountLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBAction func spinButtonClick(_ sender: Any) {
        pickerView.selectRow(Int(arc4random() % 100), inComponent: 0, animated: true)
        pickerView.selectRow(Int(arc4random() % 100), inComponent: 1, animated: true)
        pickerView.selectRow(Int(arc4random() % 100), inComponent: 2, animated: true)
        if (col1[pickerView.selectedRow(inComponent: 0)] == col2[pickerView.selectedRow(inComponent: 1)] && col2[pickerView.selectedRow(inComponent: 1)] == col3[pickerView.selectedRow(inComponent: 2)]) {
            bingoLabel.text = "Bingo!"
            score += 1
            scoreLabel.text = "Score: \(score)"
        } else {
            bingoLabel.text = "沒中獎!"
        }
        scroll += 1
        scrollCountLabel.text = "Scroll: \(scroll)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for _ in 1...100 {
            col1.append(symbol[(Int)(Int(arc4random()) % symbol.count)])
            col2.append(symbol[(Int)(Int(arc4random()) % symbol.count)])
            col3.append(symbol[(Int)(Int(arc4random()) % symbol.count)])
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        print("test")
        func login() {
            let alert = UIAlertController(title: "登入", message: "請輸入帳號密碼", preferredStyle: .alert)
            
            alert.addTextField { (textFieldAccount) in
                textFieldAccount.placeholder = "Login"
            }
            alert.addTextField { (textFieldPassword) in
                textFieldPassword.placeholder = "Password"
                textFieldPassword.isSecureTextEntry = true
            }
            let cancelAction = UIAlertAction(title: "取消", style: .cancel) {(action) in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(cancelAction)
            
            let confirmAction = UIAlertAction(title: "登入", style: .default) {(action) in
                let acc = (alert.textFields?.first)! as UITextField
                let pwd = (alert.textFields?.last)! as UITextField
                if (acc.text!) == ""{
                    let alert2 = UIAlertController(title: "", message: "請輸入帳號！", preferredStyle: .alert)
                    alert2.addAction(UIAlertAction(title: "確定", style: .cancel) {(action) in
                        self.present(alert, animated: true)
                    })
                    
                    self.present(alert2, animated: true)
                    return
                }
                self.helloLabel.text = "您好，\(acc.text!)"
                
            }
            alert.addAction(confirmAction)
            present(alert, animated: true)
        }
        
        login()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
                return col1.count
        }
        if component == 1 {
            return col2.count
        }
        return col3.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return col1[row]
        }
        if component == 1 {
            return col2[row]
        }
        return col3[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
}

