//
//  CategoryTapViewController.swift
//  Quotes
//
//  Created by apple on 06/12/2023.
//

import UIKit

@available(iOS 13.0, *)
class CategoryViewController: UIViewController {
    
    private var allquotes: [Quote] = []
    private var manager = DataBaseManager()
    
    private var titles = ["Humanity","Nature","Technology","Adventure","Love","Motivational","Inspiration","Wisdom","Humor","Friendship","Perseverance","Happiness","Creativity","Reflection"]
    private var imgaes = [UIImage(named: "Humanity"),UIImage(named: "Nature"),UIImage(named: "Technology"),UIImage(named: "Adventure"),UIImage(named: "Love"),UIImage(named: "Motivational"),UIImage(named: "Inspiration"),UIImage(named: "Wishdom"),UIImage(named: "Humor"),UIImage(named: "Friendship"),UIImage(named: "Perseverance"),UIImage(named: "Happiness"),UIImage(named: "Creativity"),UIImage(named: "Reflection")]
    
    @IBOutlet weak var CategoryTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CategoryTV.delegate = self
        CategoryTV.dataSource = self
        CategoryTV.register(UINib(nibName: "CategoryTVC", bundle: .main), forCellReuseIdentifier: "CategoryTVC")
    
}
    
}

@available(iOS 13.0, *)
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTVC", for: indexPath) as! CategoryTVC
        cell.TitleLBL.text = titles[indexPath.row]
        cell.bgImage.image = imgaes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 133
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let vc  = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AdventureViewController") as! AdventureViewController
        vc.VCtitle = titles[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    
    
}
