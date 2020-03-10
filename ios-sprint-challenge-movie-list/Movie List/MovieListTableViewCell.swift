//
//  MovieListTableViewCell.swift
//  Movie List
//
//  Created by Bree Jeune on 3/8/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    @IBOutlet weak var movieNameLabel: UILabel!
    
    @IBOutlet weak var notSeenButtonLabel: UIButton!
    
    
    @IBAction func notSeenButton(_ sender: UIButton) {
        movie?.hasBeenSeen.toggle()
        updateSeenButton()
    }
    
    var movie: Movie? {
        didSet {
            guard let movie = movie else { return }
            movieNameLabel.text = movie.name
            updateSeenButton()
        }
    }
   
    func updateSeenButton() {
        guard let movie = movie else { return }
        let title = movie.hasBeenSeen ? "Seen" : "Unseen"
        notSeenButtonLabel.setTitle(title, for: .normal)
    
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
