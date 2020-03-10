//
//  AddViewController.swift
//  Movie List
//
//  Created by Bree Jeune on 3/8/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol AddMovieDelegate: AnyObject {
    func addMovieToMovieList(_ movie: Movie)
}

class AddViewController: UIViewController {
    
     weak var delegate: AddMovieDelegate?
    
    var movie: Movie?
    
    @IBOutlet weak var movieNameTextField: UITextField!
    
    
    @IBAction func addMovieButton(_ sender: UIButton) {
            guard let movieName = movieNameTextField.text, !movieName.isEmpty else { return }
            delegate?.addMovieToMovieList(Movie(name: movieName))
            self.navigationController?.popViewController(animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
