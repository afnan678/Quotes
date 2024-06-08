//
//  AdventureViewController.swift
//  Quotes
//
//  Created by apple on 08/12/2023.
//

import UIKit

@available(iOS 13.0, *)
class AdventureViewController: UIViewController {

    
    @IBOutlet weak var tableViewAdventure: UITableView!
    
    @IBOutlet weak var titleLBL: UILabel!
    var VCtitle = ""
    var count = 0
    var tempArry: [Quote] = []
    private var allquotes: [Quote] = []
    private var manager = DataBaseManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        tableViewAdventure.delegate = self
        tableViewAdventure.dataSource = self
        tableViewAdventure.register(UINib(nibName: "QouteTVC", bundle: .main), forCellReuseIdentifier: "QouteTVC")
        titleLBL.text = VCtitle
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleLBL.text = VCtitle
        dataManagers()
    }
    
    
    func dataManagers()
    {
        tempArry = []
        allquotes = manager.fetchQuotes()
        if allquotes.count == 0
        {
            for i in 0..<data.count
            {
                manager.addQoute(title: data[i].titel, Discription: data[i].description, Favorite: data[i].favoriote)
            }
        }
        else{
            allquotes = manager.fetchQuotes()
            allquotes = allquotes.reversed()
            
            if titleLBL.text == "Favorite"
            {
                for i in 0..<allquotes.count
                {
                    if allquotes[i].quoteFavoriote == true
                    {
                        tempArry.append(allquotes[i])
                    }
                }
            }
            else
            {
                for i in 0..<allquotes.count
                {
                    if titleLBL.text == allquotes[i].quoteTitle
                    {
                        tempArry.append(allquotes[i])
                    }
                }
            }
            tableViewAdventure.reloadData()

        }
    }

    @IBAction func backButton(_ sender: Any) {
//        Mark:- Move back to Home View
        self.navigationController?.popViewController(animated: true)
    }
    
}
@available(iOS 13.0, *)
extension AdventureViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return tempArry.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QouteTVC", for: indexPath) as! QouteTVC
        
        
        cell.titleLBL.text = "-\(tempArry[indexPath.row].quoteTitle ?? "")"
//        print("\"\(allquotes[indexPath.row].quoteDiscription)\"")
        cell.descriptionLbL.text = "\"\(tempArry[indexPath.row].quoteDiscription ?? "")\""
        
        if tempArry[indexPath.row].quoteFavoriote == true
        {
            cell.heartBtn.setImage(UIImage(named: "FillHeart"), for: .normal)
        }
        else{
            cell.heartBtn.setImage(UIImage(named: "UnfillHeart"), for: .normal)
        }
        
        cell.buttonTappedCallback = { [self] in
            
            if tempArry[indexPath.row].quoteFavoriote == true
            {
                manager.updateQoute(title: tempArry[indexPath.row].quoteTitle ?? "", Discription: tempArry[indexPath.row].quoteDiscription ?? "", Favorite: false, userQoute: tempArry[indexPath.row])
                
                print(tempArry[indexPath.row].quoteTitle ?? "")
                cell.heartBtn.setImage(UIImage(named: "UnfillHeart"), for: .normal)
            }
            else{
                manager.updateQoute(title: tempArry[indexPath.row].quoteTitle ?? "", Discription: tempArry[indexPath.row].quoteDiscription ?? "", Favorite: true, userQoute: tempArry[indexPath.row])
                print(tempArry[indexPath.row].quoteTitle ?? "")
                cell.heartBtn.setImage(UIImage(named: "FillHeart"), for: .normal)
            }
            
         }
        
        cell.editTappedCallback = { [self] in
            if let tabBarController = self.tabBarController {
                tabBarController.selectedIndex = 3
            }
         }
        cell.copyTappedCallback = { [self] in
            
            UIPasteboard.general.string = tempArry[indexPath.row].quoteDiscription ?? ""
            cell.copyLBL.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                UIView.animate(withDuration: 0.5, animations: {
                    cell.copyLBL.isHidden = true
                })
            }

         }
        
     
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 175
        }
}

