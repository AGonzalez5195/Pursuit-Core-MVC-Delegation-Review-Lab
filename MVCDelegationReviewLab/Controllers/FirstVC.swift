//
//  SecondViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Anthony Gonzalez on 8/19/19.
//  Copyright © 2019 Anthony Gonzalez. All rights reserved.
//
import UIKit

class FirstVC: UIViewController, TextSizableDelegate {
    
    //MARK: -- Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: -- Properties
    let allMovies = Movie.allMovies
    
    //MARK: -- Custom Delegate Method
    func changeFontSize(_ size: Double) {
        let allCells = tableView.visibleCells //This makes an array of all visible cells
        for cell in allCells {
            cell.textLabel?.font = UIFont.systemFont(ofSize: CGFloat(size))
            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: CGFloat(size) - 3)
        }
    }
    
    //MARK: -- Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? SecondVC else {fatalError()}
        destination.delegate = self
    }
    
    //MARK: -- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}


//MARK: -- Table Datasource Methods
extension FirstVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = allMovies[indexPath.row].name
        cell.detailTextLabel?.text = allMovies[indexPath.row].year.description
        return cell
    }
}
