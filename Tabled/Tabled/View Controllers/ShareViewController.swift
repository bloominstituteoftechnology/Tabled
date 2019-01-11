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
        sendEmail()
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
    
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["you@yoursite.com"])
            mail.setMessageBody(bodyTextView.text, isHTML: true)
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }

}
