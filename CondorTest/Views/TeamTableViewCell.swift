//
//  TeamTableViewCell.swift
//  CondorTest
//
//  Created by Mario Rúa on 2/9/19.
//  Copyright © 2019 Mario Rúa. All rights reserved.
//

import UIKit

class TeamTableViewCell: UITableViewCell, CellConfigurable {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stadiumLabel: UILabel!
    @IBOutlet weak var badgeLabel: UILabel!
    
    var viewModel: TeamViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(viewModel: CellViewModel) {
        guard let viewModel = viewModel as? TeamViewModel else { return }
        self.viewModel = viewModel
        
        nameLabel.text = viewModel.name
        stadiumLabel.text = viewModel.stadium
        badgeLabel.text = viewModel.teamBadge
    }
}
