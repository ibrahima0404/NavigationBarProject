//
//  TextfieldViewController.swift
//  NavigationBarProject
//
//  Created by Ibrahima KH GUEYE on 12/05/2018.
//  Copyright © 2018 Ibrahima KH GUEYE. All rights reserved.
//

import UIKit

class TextfieldViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var textViewTest: UITextView!
    @IBOutlet weak var textFieldTest: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textViewTest.text = textField.text
        textViewTest.translatesAutoresizingMaskIntoConstraints = false
        resizeTextView()
        view.layoutIfNeeded()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        resizeTextView()
        view.layoutIfNeeded()
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    func resizeTextView() {
        let fixeWidth = textViewTest.frame.size.width
        let newSize = textViewTest.sizeThatFits(CGSize(width: fixeWidth, height: CGFloat(MAXFLOAT)))
        var newFrame = textViewTest.frame
        newFrame.size = CGSize(width: CGFloat(fmax(fixeWidth, newSize.width)), height: newSize.height)
        textViewTest.frame = newFrame
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldTest.resignFirstResponder()
        return true
    }
}
