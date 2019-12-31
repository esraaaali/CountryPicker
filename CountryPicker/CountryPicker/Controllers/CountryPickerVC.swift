//
//  CountryPickerVC.swift
//  SmartLab
//
//  Created by Esraa Ali on 10/3/19.
//  Copyright © 2019 Asgatech. All rights reserved.
//

import UIKit

typealias CountryPickerCompletion = (_ county: Country?) -> Void

class CountryPickerVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variable
    var countries: [Country] = [] {
        didSet {
            filteredCountries = countries
        }
    }
    var filteredCountries: [Country] = []
    var completion: CountryPickerCompletion?
    var locale: Language!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(named: "CountryPickerCell")
        searchTF.addTarget(self, action: #selector(search(_:)), for: .editingChanged)
        loadFileContent()
    }
    
    // MARK: - Functions
    @objc func search(_ sender: UITextField){
        if sender.text!.isEmpty {
            filteredCountries = countries
            tableView.reloadData()
            return
        }
        filteredCountries = countries.filter { $0.name.lowercased().contains(sender.text!.lowercased()) }
        tableView.reloadData()
    }
    
    static func show(on viewController: UIViewController, locale: Language, completion: @escaping CountryPickerCompletion) {
        let controller = CountryPickerVC()
        controller.completion = completion
        controller.locale = locale
        controller.modalPresentationStyle = .overCurrentContext
        viewController.present(controller, animated: true)
    }
    
    func loadFileContent() {
        if let path = Bundle.main.path(forResource: locale.rawValue, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [[String: String]] {
                    countries = jsonResult.map({ json in
                        return Country(name: json["name"] ?? "", code: json["code"] ?? "", phoneCode: json["phone_code"] ?? "")
                    })
                    tableView.reloadData()
                }
            } catch {
                print("error")
            }
        }
    }
    
    // MARK: - Actions
    @IBAction func cancelClicked(_ sender: UIButton) {
        completion!(nil)
        dismiss(animated: true)
    }
}

extension CountryPickerVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryPickerCell") as! CountryPickerCell
        cell.country = filteredCountries[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        completion!(filteredCountries[indexPath.row])
        dismiss(animated: true)
    }
    
}

extension UITableView {
    func registerNib(named: String, identifier: String = "") {
        register(UINib.init(nibName: named, bundle: nil), forCellReuseIdentifier: identifier.isEmpty ? named : identifier)
    }
}
