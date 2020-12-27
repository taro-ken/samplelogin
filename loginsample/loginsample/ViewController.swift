//
//  ViewController.swift
//  loginsample
//
//  Created by 木元健太郎 on 2020/12/27.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var registarButtom: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registarButtom.isEnabled = false
        registarButtom.layer.cornerRadius = 10
        registarButtom.backgroundColor = UIColor.rgb(red: 255, green: 141, blue: 0)
        
        
    emailTextField.delegate = self
    passwordTextField.delegate = self
    usernameTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    
    @objc func showKeyboard(notification: Notification){
        let keyboardFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as
                                AnyObject).cgRectValue
        
        guard let keyboardMinY = keyboardFrame?.minY else { return }
        let registarButtomMaxY = registarButtom.frame.maxY
        let distance = registarButtomMaxY - keyboardMinY + 20
        
        let transform = CGAffineTransform(translationX: 0, y: -distance
        )
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {self.view.transform = transform})
        
        print("keyboardMinY : ", keyboardMinY, "registarButtomMaxY", registarButtomMaxY)
    }
    
    @objc func hideKeyboard(){
        print("hideKeyboard is hideing")
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {self.view.transform = .identity})
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}


extension ViewController:UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let emailIsEmpty = emailTextField.text?.isEmpty ?? true
        let passwordIsEmpty = passwordTextField.text?.isEmpty ?? true
        let usernameIssEmpty = usernameTextField.text?.isEmpty ?? true
        
        if emailIsEmpty || passwordIsEmpty || usernameIssEmpty
        {
            registarButtom.isEnabled = false
            registarButtom.backgroundColor = UIColor.rgb(red: 255, green: 221, blue: 187)
        }else{
            registarButtom.isEnabled = true
            registarButtom.backgroundColor = UIColor.rgb(red: 255, green: 141, blue: 0)
    
        }
       
    }
}
