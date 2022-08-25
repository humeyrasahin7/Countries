//
//  HomeViewController.swift
//  Countries
//
//  Created by Hümeyra Şahin on 22.08.2022.
//

import UIKit

class HomeViewController: UIViewController {
 
    @IBOutlet weak var tableView: UITableView!

    private var countries = [Country]()
    lazy var service = Requests()
    private var favs = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Countries"
        tableView.delegate = self
        tableView.dataSource = self
        tabBarController?.tabBar.isUserInteractionEnabled = false
        service.fetchCountries { [weak self] countriesList in
            guard let self = self else {return}
            self.countries = countriesList
            StaticCountry.instance.countries = countriesList
            self.tabBarController?.tabBar.isUserInteractionEnabled = true
            self.reloadData()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        StaticCountry.instance.favCountries = StaticCountry.instance.userDefaults.value(forKey: "favs") as? [String] ?? [String]()
        tableView.reloadData()
        tabBarController?.tabBar.isHidden = false
    }

}

extension HomeViewController{
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = countries[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell") as! CountryCell
        cell.configCellView()
        
        cell.textLabel?.text = country.name
        if StaticCountry.instance.favCountries.contains(country.code){
            cell.addFavButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            cell.addFavButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
        
        cell.buttonPressed = {
            if StaticCountry.instance.favCountries.contains(country.code){
                StaticCountry.instance.favCountries.removeAll(where: {$0 == country.code})
                cell.addFavButton.setImage(UIImage(systemName: "star"), for: .normal)
            } else {
                StaticCountry.instance.favCountries.append(country.code)
                cell.addFavButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
                StaticCountry.instance.userDefaults.set(StaticCountry.instance.favCountries, forKey: "favs")
            }
            print(StaticCountry.instance.favCountries)
            StaticCountry.instance.userDefaults.set(StaticCountry.instance.favCountries, forKey: "favs")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = countries[indexPath.section]
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailVC") as! DetailsViewController
        vc.country = country
        self.navigationController!.pushViewController(vc, animated: true)
        
    }
    
    
}

