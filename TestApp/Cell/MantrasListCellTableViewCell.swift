//
//  MantrasListCellTableViewCell.swift
//  TestApp
//
//  Created by Sona on 02.02.24.
//

import UIKit

class MantrasListCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configUI(mntr: Mantras){
        nameLabel.text = mntr.name
        durationLabel.text = timeString(time: mntr.duration)
    }
    
    func timeString(time: Int) -> String {
        let hour = time / 3600
        let minute = time / 60 % 60
        return String(format: "%02i:%02i", hour, minute)
    }
    
}
