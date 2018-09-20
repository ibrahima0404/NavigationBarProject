//
//  SuccessViewController.swift
//  NavigationBarProject
//
//  Created by Ibrahima KH GUEYE on 08/05/2018.
//  Copyright © 2018 Ibrahima KH GUEYE. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {
    
    //MARK: - Properties
    var dog: Pet!
    
    //MARK/ - Outlets
    @IBOutlet weak var successTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
    }

    private func setTextField() {
        let message = "Wouf \(dog.name!) ! \n                                                                                                     Vous avez bien été ajouté à notre base de donnée. Nous vous enverrons un SMS dès que npous aurons une âme soeur à  vous proposer !"
        successTextField.text = message
    }
    
    @IBAction func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
