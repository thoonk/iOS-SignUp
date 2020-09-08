//
//  SignUp2ViewController.swift
//  iOS_Project2_20200907
//
//  Created by 김태훈 on 2020/09/07.
//  Copyright © 2020 thoonk. All rights reserved.
//

import UIKit

class SignUp2ViewController: UIViewController {
    
    @IBOutlet weak var phoneNumTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        completeButton.isEnabled = false
        
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
        
        if UserInformation.shared.phoneNumber != nil{
            phoneNumTextField.text = UserInformation.shared.phoneNumber
        }
        dateLabel.text = dateFormatter.string(from: datePicker.date)
    }
    
    // MARK: - DatePicker 구현
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker){
        
        let date: Date = self.datePicker.date // sender.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString
        
        if dateLabel.text != nil{
            completeButton.isEnabled = true
        }
    }
            
    // MARK: - 취소, 이전, 가입 Button 액션
    @IBAction func touchUpCancel(_ sender: UIButton){
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpPrev(_ sender: UIButton){
        UserInformation.shared.phoneNumber = phoneNumTextField.text!

        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpComp(_ sender: UIButton){
        UserInformation.shared.phoneNumber = phoneNumTextField.text!
        UserInformation.shared.birthDay = dateLabel.text!
        
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
}
