//
//  HomeViewController.swift
//  Quotes
//
//  Created by apple on 06/12/2023.
//

import UIKit

@available(iOS 13.0, *)
class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var QuotesTVC: UITableView!
    
    @IBOutlet weak var featuredTitleLBL: UILabel!
    @IBOutlet weak var featuredDisLBL: UILabel!
    @IBOutlet weak var featuredFavrioteBtn: UIButton!
    var models: [(title: String, note: String)] = []
    
    private var allquotes: [Quote] = []
    private var manager = DataBaseManager()
    private var tempQuote: Quote?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        QuotesTVC.delegate = self
        QuotesTVC.dataSource = self
        QuotesTVC.register(UINib(nibName: "QouteTVC", bundle: .main), forCellReuseIdentifier: "QouteTVC")
        data.append(contentsOf: AppsQoutes)
        dataManagers()
        if let random = allquotes.randomElement() {
            
            tempQuote = random
            
            featuredDisLBL.text = random.quoteDiscription
            featuredTitleLBL.text = "-\(random.quoteTitle ?? "")"
            if random.quoteFavoriote == true
            {
                featuredFavrioteBtn.setImage(UIImage(named: "WhiteHeartFill"), for: .normal)
            }
            else{
                featuredFavrioteBtn.setImage(UIImage(named: "HeartWhite"), for: .normal)

            }
            
        }


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataManagers()
    }
    
    func dataManagers()
    {
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

            
//            print(allquotes[0].quoteDiscription)
//            
//            manager.updateQoute(title: "human", Discription: "beautiful", Favorite: true, userQoute: allquotes[0])
//            
//            print(allquotes[0].quoteDiscription)
            
            QuotesTVC.reloadData()
        }
    }
    
    
    @IBAction func MusicLaibraryBTnClick(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MusicPlyerViewController") as! MusicPlyerViewController
        self.navigationController?.pushViewController( vc, animated: true)
    }
    
    @IBAction func featuredFavorioteBTnPressed(_ sender: Any) {
        
        print(tempQuote?.quoteTitle ?? "")
        
        if tempQuote?.quoteFavoriote == true
        {
            manager.updateQoute(title: tempQuote?.quoteTitle ?? "", Discription: tempQuote?.quoteDiscription ?? "", Favorite: false, userQoute: tempQuote!)
            featuredFavrioteBtn.setImage(UIImage(named: "HeartWhite"), for: .normal)
        }
        else{
            manager.updateQoute(title: tempQuote?.quoteTitle ?? "", Discription: tempQuote?.quoteDiscription ?? "", Favorite: true, userQoute: tempQuote!)
            featuredFavrioteBtn.setImage(UIImage(named: "WhiteHeartFill"), for: .normal)
        }
        
    }
    
    
    @IBAction func viewAllBtnPressed(_ sender: Any) {
        if let tabBarController = self.tabBarController {
            tabBarController.selectedIndex = 1
        }
    }
    
    @IBAction func humanityBtnnPressed(_ sender: Any) {
        let vc  = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AdventureViewController") as! AdventureViewController
        vc.VCtitle = "Humanity"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func natureBtnPressed(_ sender: Any) {
        let vc  = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AdventureViewController") as! AdventureViewController
        vc.VCtitle = "Nature"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func technologyBtnPressed(_ sender: Any) {
        let vc  = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AdventureViewController") as! AdventureViewController
        vc.VCtitle = "Technology"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

@available(iOS 13.0, *)
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if allquotes.count == 0
        {
            return 0
        }
        else
        {
            return 3
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QouteTVC", for: indexPath) as! QouteTVC
        cell.titleLBL.text = "-\(allquotes[indexPath.row].quoteTitle ?? "")"
//        print("\"\(allquotes[indexPath.row].quoteDiscription)\"")
        cell.descriptionLbL.text = "\"\(allquotes[indexPath.row].quoteDiscription ?? "")\""
        
        if allquotes[indexPath.row].quoteFavoriote == true
        {
            cell.heartBtn.setImage(UIImage(named: "FillHeart"), for: .normal)
        }
        else{
            cell.heartBtn.setImage(UIImage(named: "UnfillHeart"), for: .normal)
        }
        
        cell.buttonTappedCallback = { [self] in
            
            if allquotes[indexPath.row].quoteFavoriote == true
            {
                manager.updateQoute(title: allquotes[indexPath.row].quoteTitle ?? "", Discription: allquotes[indexPath.row].quoteDiscription ?? "", Favorite: false, userQoute: allquotes[indexPath.row])
                
                print(allquotes[indexPath.row].quoteTitle ?? "")
                cell.heartBtn.setImage(UIImage(named: "UnfillHeart"), for: .normal)
            }
            else{
                manager.updateQoute(title: allquotes[indexPath.row].quoteTitle ?? "", Discription: allquotes[indexPath.row].quoteDiscription ?? "", Favorite: true, userQoute: allquotes[indexPath.row])
                print(allquotes[indexPath.row].quoteTitle ?? "")
                cell.heartBtn.setImage(UIImage(named: "FillHeart"), for: .normal)
            }
            
         }
        
        
        cell.editTappedCallback = { [self] in
            if let tabBarController = self.tabBarController {
                tabBarController.selectedIndex = 3
            }
         }
        cell.copyTappedCallback = { [self] in
            
            UIPasteboard.general.string = allquotes[indexPath.row].quoteDiscription ?? ""
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
