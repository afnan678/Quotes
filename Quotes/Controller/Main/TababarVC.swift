//
//  TababarVC.swift
//  Quotes
//
//  Created by Afnan Ahmed on 12/12/2023.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
class TabbarVC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        // Create view controllers for each tab
        let selectedColor   = UIColor(red: 246.0/255.0, green: 155.0/255.0, blue: 13.0/255.0, alpha: 1.0)
            let unselectedColor = UIColor(red: 16.0/255.0, green: 224.0/255.0, blue: 223.0/255.0, alpha: 1.0)

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        
//        custom.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "tab_icon_normal"), selectedImage: UIImage(named: "tab_icon_selected"))
        
        let vc11 = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let vc1 = UINavigationController(rootViewController: vc11)
        vc1.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "TabbarHeart"), tag: 0)
        vc1.tabBarItem.image = UIImage(named: "TabbarHome")!.withRenderingMode(.alwaysOriginal)
        vc1.tabBarItem.selectedImage = UIImage(named: "TabbarHome3")!.withRenderingMode(.alwaysOriginal)
        
        
        let vc20 = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        let vc2 = UINavigationController(rootViewController: vc20)
        vc2.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "TabbarCategorie"), tag: 1)
        vc2.tabBarItem.image = UIImage(named: "TabbarCategorie")!.withRenderingMode(.alwaysOriginal)
        vc2.tabBarItem.selectedImage = UIImage(named: "TabbarCategorie3")!.withRenderingMode(.alwaysOriginal)
        
        
        let vc30 = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AdventureViewController") as! AdventureViewController
        vc30.VCtitle = "Favorite"
        let vc3 = UINavigationController(rootViewController: vc30)
        vc3.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "TabbarHeart"), tag: 1)
        vc3.tabBarItem.image = UIImage(named: "TabbarHeart")!.withRenderingMode(.alwaysOriginal)
        vc3.tabBarItem.selectedImage = UIImage(named: "TabbarHeart3")!.withRenderingMode(.alwaysOriginal)

        
        let vc40 = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddQuoteViewController") as! AddQuoteViewController
        let vc4 = UINavigationController(rootViewController: vc40)
        vc4.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "TabbarPlus"), tag: 1)
        vc4.tabBarItem.image = UIImage(named: "TabbarPlus")!.withRenderingMode(.alwaysOriginal)
        vc4.tabBarItem.selectedImage = UIImage(named: "TabbarPlus3")!.withRenderingMode(.alwaysOriginal)
        
        let vc50 = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let vc5 = UINavigationController(rootViewController: vc50)
        vc5.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "Clock"), tag: 1)
    
//        self.tabBar.clipsToBounds = true
        self.tabBar.layer.cornerRadius = 13
        self.tabBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        self.viewControllers = [vc1, vc2, vc3, vc4]
        self.tabBar.backgroundColor = .white
        self.tabBar.barTintColor = UIColor.black
//        self.tabBar.tintColor = AppColor.Primary500 ?? .clear
        
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 0.5
//        tabBar.layer.shadowColor = AppColor.C200?.cgColor
        tabBar.layer.shadowOpacity = 0.6

        self.delegate = self
    }
}
