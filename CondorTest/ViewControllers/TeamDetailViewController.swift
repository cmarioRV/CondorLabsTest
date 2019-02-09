//
//  TeamDetailViewController.swift
//  CondorTest
//
//  Created by Mario Rúa on 2/9/19.
//  Copyright © 2019 Mario Rúa. All rights reserved.
//

import UIKit

class TeamDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var foundationLabel: UILabel!
    @IBOutlet weak var badgeLabel: UILabel!
    @IBOutlet weak var webLabel: UILabel!
    
    let viewModel: TeamViewModel
    
    public init(viewModel: TeamViewModel)
    {
        self.viewModel = viewModel
        super.init(nibName: String(describing: TeamDetailViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = viewModel.name
        descriptionLabel.text = "Description: \(viewModel.description)"
        foundationLabel.text = "Formed year: \(viewModel.foundation)"
//        badgeLabel.text = viewModel.teamBadge
        webLabel.text = viewModel.webPage
    }
}
