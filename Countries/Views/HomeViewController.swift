//
//  HomeViewController.swift
//  Countries
//
//  Created by Hümeyra Şahin on 22.08.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //private var countries: [Country]?
    let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.delegate = self
        viewModel.loadCountries()
        title = "Countries"
    
        
    }
    
}

extension HomeViewController: HomeViewModelDelegate{
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCountries
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = viewModel.country(index: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell") as! CountryCell
        cell.textLabel?.text = country?.name ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = viewModel.country(index: indexPath.row)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailVC") as! DetailsViewController
        vc.viewModel.code = country?.code ?? ""
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

