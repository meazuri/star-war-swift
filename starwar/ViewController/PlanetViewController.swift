//
//  FirstViewController.swift
//  starwar
//
//  Created by seintsan on 28/5/20.
//  Copyright © 2020 seintsan. All rights reserved.
//

import UIKit

class PlanetViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var planetTableView: UITableView!
    private var planets = [Planet]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        planetTableView.delegate = self
        planetTableView.dataSource = self
        
        
        DataService.shared.fetchPlanets { (result) in
            switch result {
            case .success(let planetsResponse):
                self.planets = planetsResponse.results
                
                
            case .failure(let error):
                print(error)
            }
            
            DispatchQueue.main.async {
                self.planetTableView.reloadData()
                
            }
        }
    }
    
    
    //MARK: TableView Data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.planets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PlanetTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)  as? PlanetTableViewCell else {
            fatalError("The dequeued cell is not an instance of PlanetTableViewCell.")
        }
        let planet = self.planets[indexPath.row]
        cell.lblName.text = "Planet : \( planet.name ?? "-")"
        cell.lblTerrain.text = "Climate : \(planet.climate ?? "-")"
        return cell
    }
    
}

