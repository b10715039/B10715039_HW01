//
//  ViewController.swift
//  B10715039_HW01
//
//  Created by Jia-Ru Song on 2022/2/28.
//

import UIKit

class ViewController: UIViewController {
    
    let symbol = ["🍏", "🍊", "🍌", "🍉", "🍇", "🍅", "🥝"]
    var score = 0
    var col1 = [String]()
    var col2 = [String]()
    var col3 = [String]()
    @IBOutlet weak var helloLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for _ in 1...100 {
            col1.append(symbol[(Int)(arc4random() % 7)])
            col2.append(symbol[(Int)(arc4random() % 7)])
            col3.append(symbol[(Int)(arc4random() % 7)])
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
                if (acc.text!) == "" || (pwd.text!) == ""{
                    return
                }
                self.helloLabel.text = "您好，\(acc.text!)"
                
            }
            alert.addAction(confirmAction)
            present(alert, animated: true)
        }
        
        login()
    }

}

