//
//  MVDMoveSearchTableViewCell.swift
//  MovieSearchObj-CwSwift
//
//  Created by Michael Di Cesare on 10/11/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

import UIKit

class MVDMoveSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieRank: UILabel!
    @IBOutlet weak var movieDescription: UILabel!

    var movieItem: MovieSearch? {
        didSet {
            guard  let item = movieItem else {return}
            movieName.text = item.title
            movieRank.text = "\(String(_cocoaString: item.rating ?? 0 ))"
            movieDescription.text = item.overview
        }
    }
}
