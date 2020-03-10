//
//  MovieListViewController.swift
//  Movie List
//
//  Created by Bree Jeune on 3/8/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

//private let movieCellID = "movieTitleCell"
//private let addSegueID = "AddMovieSegue"

class MovieListViewController: UIViewController {
    
    
    var movie = [Movie]()
    let movieController = MovieController()
    
    lazy var movieTableData = movieController.movies

    @IBOutlet weak var movieListTableView: UITableView!
    

    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        self.navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieListTableView.dataSource = self
        movieListTableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        movieListTableView.reloadData()
    }
    
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "MovieAddedToTableView", let addMovieVC = segue.destination as? AddViewController {
        guard let selectedIndex = movieListTableView.indexPathForSelectedRow else { return }
        addMovieVC.movie = movie[selectedIndex.row]
    }
}
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        movieListTableView.setEditing(editing, animated: animated)
    }
    
    
    func addMovieToMovieList(_ movie: Movie) {
    
        movieController.movies.insert(name, at: 0)
        
       
       let indexPath: IndexPath = IndexPath(row: 0, section: 0)
        movieListTableView.insertRows(at: [indexPath], with: .automatic)
       movieListTableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
       self.performSegue(withIdentifier: "addMovieVC", sender: nil)
       movieListTableView.reloadData()
    }

}

    
extension MovieListViewController: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieCell = movieListTableView.dequeueReusableCell(withIdentifier: "movieTitleCell", for: indexPath) as? MovieListTableViewCell else {
            fatalError("Unable to dequeue cell with identifier \("movieTitleCell")")
        }
        movieCell.movie = movie[indexPath.row]
        return movieCell
    }
    }

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            movie.remove(at: indexPath.row)
            movieListTableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}
