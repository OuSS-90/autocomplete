//
//  ViewController.swift
//  Test
//
//  Created by OuSS on 11/2/17.
//  Copyright © 2017 OuSS. All rights reserved.
//

import UIKit
import LUAutocompleteView

class ViewController : UIViewController,LUAutocompleteViewDelegate,LUAutocompleteViewDataSource {
    
    // MARK: - Properties
    
    @IBOutlet weak var textField: UITextField!
    private let autocompleteView = LUAutocompleteView()
    
    private let elements = (1...4000).map { "\($0)" }
    
    // MARK: - ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(autocompleteView)
        
        autocompleteView.textField = textField
        autocompleteView.dataSource = self
        autocompleteView.delegate = self
        
        // Customisation
        
        autocompleteView.rowHeight = 40
        //autocompleteView.autocompleteCell = CustomAutocompleteTableViewCell.self // Uncomment this line in order to use customised autocomplete cell
    }
    
    func autocompleteView(_ autocompleteView: LUAutocompleteView, elementsFor text: String, completion: @escaping ([String]) -> Void) {
        if text.count < 3 { return }
        let elementsThatMatchInput = elements.filter { $0.lowercased().contains(text.lowercased()) }
        completion(elementsThatMatchInput)
    }
    
    func autocompleteView(_ autocompleteView: LUAutocompleteView, didSelect text: String) {
        print(text + " was selected from autocomplete view")
    }
}
