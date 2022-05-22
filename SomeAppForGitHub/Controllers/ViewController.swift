//
//  ViewController.swift
//  SomeAppForGitHub
//
//  Created by user on 15/5/22.
//

import UIKit
import Kingfisher
import CoreAudio

class ViewController: UIViewController {
    
    var network = ApiResponse()
    
    var news: NewsModel? = nil
    
    var timer: Timer?
    
    let idCell = "Some text"
    
    var infoPage = InformationPageViewController()
    
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        setupTableView()
        getData(searchText: nil)
        
    }
    
    // MARK: - Настройка searchControllera
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    // MARK: - Настройка tableView
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: idCell)
    }
    
    // MARK: - Обьявлении функции getData ( вызов метода network.getResponse )
    
    private func getData(searchText: String?) {
        
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&q=\(searchText ?? "")&apiKey=8a10cb9a44ed497196ccf0833200a4e9"
        network.getResponse(urlString: urlString) { (news) in
            guard let news = news else {return}
            self.news = news            
            self.tableView.reloadData()
        }
    }

}

// MARK: - extension для DataSource && Delegate tableView

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! CustomCell
        
        let model = news?.articles?[indexPath.row]
        
        cell.titleLabel?.text = model?.title
        cell.subtitleLabel?.text = model?.description
        
        if let url = URL(string: model?.urlToImage ?? "") {
            cell.imageCell.kf.setImage(with: url)
        }

        return cell
    }
    
    // MARK: - вызов функции didSelectRowAt
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "InformationPageViewController") as? InformationPageViewController
        vc?.titleOfPage = news?.articles?[indexPath.row].title ?? ""
        vc?.subtitleOfPage = news?.articles?[indexPath.row].description ?? ""
        
        if let url = URL(string: news?.articles?[indexPath.row].urlToImage ?? "") {

            vc?.imageOfPage.kf.setImage(with: url)
        }
        self.present(vc!, animated: true, completion: nil)
        
    }
}
    
// MARK: - extension UISearchBarDelegate для searchController

extension ViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: 0.9, repeats: false, block: { (_) in
            
            self.getData(searchText: searchText)
            
            print(searchText)
        })
    }
}
                                     
                                
