//
//  MVDMovieSearchTableViewController.swift
//  MovieSearchObj-CwSwift
//
//  Created by Michael Di Cesare on 10/11/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

import UIKit

class MVDMovieSearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBarField: UISearchBar!
    
    // landing pad
    
    var movieSearchResults: [MovieSearch] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarField.delegate = self
        self.tableView.estimatedRowHeight = 150
        self.tableView.rowHeight = 150
    }

    // MARK: - Table view data source

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        MVDMovieSearchModelController.fetchMovieDetails(withTitle: searchText) { (arrayOfMovie) in
            self.movieSearchResults = arrayOfMovie
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movieSearchResults.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieViewCell", for: indexPath) as! MVDMoveSearchTableViewCell

        let movieItem = movieSearchResults[indexPath.row]
        cell.movieItem = movieItem
        return cell
    }
}
