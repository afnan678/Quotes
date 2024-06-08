//
//  MusicTableViewCell.swift
//  Quotes
//
//  Created by apple on 09/12/2023.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    @IBOutlet weak var mainCellView: UIView!
    
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var TitleLBL: UILabel!
    @IBOutlet weak var timerLBL: UILabel!
    @IBOutlet weak var musicBtn: UIButton!
    
    var buttonTappedCallback: (() -> Void)?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        musicBtn.setImage(UIImage(named: "Play"), for: .normal)
        
       
//        mainCellView?.layer.cornerRadius = (UIView.frame.size.height ?? 0.0) / 2.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func musicPlayerButton(_ sender: Any) {
//        Mark:- To Play the Music
        buttonTappedCallback?()
    }
    
}

