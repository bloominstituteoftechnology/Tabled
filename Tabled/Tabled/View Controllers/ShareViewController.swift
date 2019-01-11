//
//  ShareViewController.swift
//  Tabled
//
//  Created by Angel Buenrostro on 1/10/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit
import MessageUI

class ShareViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    @IBAction func send(_ sender: UIButton) {
        let picker = MFMailComposeViewController()
        picker.mailComposeDelegate = self
        
        if let subjectText = subjectTextField.text {
            picker.setSubject(subjectText)
        }
        picker.setMessageBody(bodyTextView.text, isHTML: true)
        
        present(picker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subjectTextField.delegate = self
        bodyTextView.delegate = self
        var i = 0
        var todoText : String = ""
        while i < Model.shared.itemCount(){
            todoText += ("\(Model.shared.item(at: i))" + "\n")
            i += 1
        }
        bodyTextView.text = todoText
    }
    
    
    
    // MFMailComposeViewControllerDelegate
    
    // 1
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
    
    // UITextFieldDelegate
    
    // 2
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    // UITextViewDelegate
    
    // 3
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        bodyTextView.text = textView.text
        
        if text == "\n" {
            textView.resignFirstResponder()
            
            return false
        }
        
        return true
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
