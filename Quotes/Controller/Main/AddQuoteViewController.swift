//
//  AddQuotesViewController.swift
//  Quotes
//
//  Created by apple on 06/12/2023.
//

import UIKit
import DropDown

@available(iOS 13.0, *)
class AddQuoteViewController: UIViewController {

    @IBOutlet weak var quotesText: UITextView!
    
    @IBOutlet weak var dropDownView: UIView!
    
    @IBOutlet weak var tapDropDown: UIButton!
    
    @IBOutlet weak var categoryLebal: UILabel!
    
    private let manager = DataBaseManager()
    
    let myDropDown = DropDown()
    let categoryValuesArray = ["Humanity","Nature","Technology","Adventure","Love","Motivational","Inspiration","Wisdom","Humor","Friendship","Perseverance","Happiness","Creativity","Reflection"]
    
    var title1 = ""
    var description1 = ""
    var favotite1 = false
    
    
    @IBAction func isTapDropDown(_ sender: Any) {
        myDropDown.show()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myDropDown.anchorView = dropDownView
        myDropDown.dataSource = categoryValuesArray
        myDropDown.bottomOffset = CGPoint(x: 0, y: (myDropDown.anchorView?.plainView.bounds.height)!)
        myDropDown.topOffset = CGPoint(x: 0, y: -(myDropDown.anchorView?.plainView.bounds.height)!)
        myDropDown.direction = .bottom
        
        myDropDown.selectionAction = {(index: Int, item: String) in self.categoryLebal.text = self.categoryValuesArray[index]
            self.categoryLebal.textColor = .black
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
//        Mark:- Move Back to Home View
    }
    
    
    @IBAction func publishButton(_ sender: Any) {
//        Mark:- To Publish the Quotes or Save to Data
        
        
        
    }
    
    @IBAction func PublishBtnPressed(_ sender: Any) {
        
        print("hello word")
        print("title: \(categoryLebal.text ?? "") qoutes: \(quotesText.text ?? "") favorite: \(favotite1) ")
        
        if categoryLebal.text != "Select Category"
        {
            if quotesText.text != ""
            {
                manager.addQoute(title: categoryLebal.text ?? "", Discription: quotesText.text ?? "", Favorite: false)
                showAlert(message: "Qoute Successfully Saved")
                categoryLebal.text = "Select Category"
                quotesText.text = ""
            }
            else
            {
                showAlert(message: "Please Write the some Qoute:")
            }
        }
        else
        {
            showAlert(message: "Select Category")
        }
        
    }
    
    @objc func showAlert(message: String) {
            // Create an alert controller
            let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            
            // Create an OK action
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            // Add the OK action to the alert controller
            alertController.addAction(okAction)
            
            // Present the alert controller
            present(alertController, animated: true, completion: nil)
        }
    
    

}
