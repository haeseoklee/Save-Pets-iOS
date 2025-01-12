//
//  ModalViewController.swift
//  SavePets
//
//  Created by Haeseok Lee on 2021/05/04.
//

import UIKit

enum ModalViewUsage {
    case breed, birthYear, gender
}

protocol ModalViewControllerDelegate {
    func selectPickerView(selection: String, usage: ModalViewUsage)
}

class ModalViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    // MARK: - Variables
    
    var modalViewUsage: ModalViewUsage = .breed
    var modalViewControllerDelegate: ModalViewControllerDelegate?
    private var pickerList = [String]()
    private var breedList: [String] = ["푸들", "포메라니안", "불독", "진돗개", "치와와"]
    private var birthYearList: [String] = ["2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021"]
    private var genderList: [String] = ["남", "여"]
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeModalViewController()
        self.initializePickerView()
    }
    
    // MARK: - Functions
    
    
    private func initializeModalViewController() {
        
    }
    
    private func initializePickerView() {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        switch self.modalViewUsage {
        case .breed:
            self.pickerList = self.breedList
        case .birthYear:
            self.pickerList = self.birthYearList
        case .gender:
            self.pickerList = self.genderList
        }
        
        self.pickerView.selectRow(2, inComponent: 0, animated: true)
    }

    @IBAction func cancelButtonTouchUp(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func confirmButtonTouchUp(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ModalViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
        return self.pickerList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selection = self.pickerList[row]
        self.modalViewControllerDelegate?.selectPickerView(selection: selection, usage: self.modalViewUsage)
    }
    
}
