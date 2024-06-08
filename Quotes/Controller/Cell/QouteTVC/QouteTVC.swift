//
//  QouteTVC.swift
//  Quotes
//
//  Created by Afnan Ahmed on 12/12/2023.
//

import UIKit

class QouteTVC: UITableViewCell {

    @IBOutlet weak var descriptionLbL: UILabel!
    var buttonTappedCallback: (() -> Void)?
    var editTappedCallback: (() -> Void)?
    var copyTappedCallback: (() -> Void)?

    @IBOutlet weak var copyLBL: UILabel!
    @IBOutlet weak var heartBtn: UIButton!
    @IBOutlet weak var titleLBL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        heartBtn.setImage(UIImage(named: "UnfillHeart"), for: .normal)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func heartBtnPressed(_ sender: Any) {
        buttonTappedCallback?()
    }
    
    
    @IBAction func editBtnnPressed(_ sender: Any) {
        editTappedCallback?()
    }
    
    @IBAction func copyBtnPressed(_ sender: Any) {
        copyTappedCallback?()
    }
}
