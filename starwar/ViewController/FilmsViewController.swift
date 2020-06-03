//
//  SecondViewController.swift
//  starwar
//
//  Created by seintsan on 28/5/20.
//  Copyright © 2020 seintsan. All rights reserved.
//

import UIKit

class FilmsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    private var films = [Film]()
    
    @IBOutlet weak var filmsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmsTableView.delegate = self
        filmsTableView.dataSource = self
        
        
        DataService.shared.fetchFilms(){ (result) in
            
            switch result{
                 case .success (let filmsResponse):
            self.films = filmsResponse.results
                          
            case .failure(let error):
                print(error)
            }
           DispatchQueue.main.async {
               self.filmsTableView.reloadData()
               
           }
        }
    }
    
    //MARK: TableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "FilmsTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)  as? FilmTableViewCell else {
            fatalError("The dequeued cell is not an instance of PlanetTableViewCell.")
        }
        let film = self.films[indexPath.row]
        cell.lblFilmName.text = "Title : \(film.title)"
        cell.lblDirector.text = "Director : \(film.director)"
        cell.lblProducer.text = "Producer : \(film.producer)"
        
       

        return cell
    }
    
    
}

