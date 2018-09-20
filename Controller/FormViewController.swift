//
//  FormViewController.swift
//  NavigationBarProject
//
//  Created by Ibrahima KH GUEYE on 08/05/2018.
//  Copyright © 2018 Ibrahima KH GUEYE. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var majoritySwitch: UISwitch!
    @IBOutlet weak var racePickerView: UIPickerView!
    
    //MARK: - Properties
    var dog: Pet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

//MARK: - Validate
extension FormViewController {
    @IBAction func validate() {
        createPetObject()
        checkPetStatus()
    }
    
    private func createPetObject() {
        let name = nameTextField.text
        let phone = phoneTextField.text
        let hasMajority = majoritySwitch.isOn
        let gender: Pet.Gender = (genderSegmentedControl.selectedSegmentIndex == 0) ? .male : .female
        let raceIndex = racePickerView.selectedRow(inComponent: 0)
        let race =  dogRaces[raceIndex]
        dog = Pet(name: name, hasMajority: hasMajority, phone: phone, race: race, gender: gender)
        
    }
    
    private func checkPetStatus() {
        switch dog.status {
        case .accepted:
            performSegue(withIdentifier: "segueToDogSuccess", sender: nil)
        case .rejected(let error):
            presentAlert(With: error)
        }
    }

    private func presentAlert(With error: String) {
        let alert = UIAlertController(title: "Erreur", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

//MARK: - TextField
extension FormViewController:  UITextFieldDelegate {
    @IBAction func dismissKeyboard(_ sender: UIGestureRecognizer) {
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
}

//MARK: - PickerView
extension FormViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dogRaces.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dogRaces[row]
    }
}

//MARK: Segue
extension FormViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDogSuccess" {
            let successVC = segue.destination as! SuccessViewController
            successVC.dog = dog
        }
    }
}
