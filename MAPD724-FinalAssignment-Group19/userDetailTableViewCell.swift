//
//  userDetailTableViewCell.swift
//  MAPD724-FinalAssignment-Group19
//
//  Created by Murtaza Haider Naqvi on 2023-04-11.


import UIKit

class userDetailTableViewCell: UITableViewCell {
    
    
    @IBOutlet var labelname: UILabel!
    
    var userDetailModel: userDetailModel?{
        didSet{
            textLabel?.text = userDetailModel?.firstName
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
