//
//  ViewController.swift
//  Cryptocurrency
//
//  Created by Archana Vetkar on 04/02/22.
// List view controller to responsible to change in UI of ListTable View

import UIKit

class ListViewController: UITableViewController, Storyboarded{
    
    //MARK:- Variables
    private let cryptoViewModel = CryptoViewModel()
    private var adapter: TableViewHandler!
    var activityIndicator = UIActivityIndicatorView() {
        didSet{
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            activityIndicator.center=self.view.center;
            self.view.addSubview(activityIndicator);
        }
    }
    
    //    MARK:- Outlets
    @IBOutlet weak var refControl: UIRefreshControl!
    
    //    MARK:- Actions
    @IBAction func PulledToRefresh(_ sender: Any) {
        cryptoViewModel.getList()
    }
    
    //    MARK:- View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        cryptoViewModel.vcDelegate = self
        cryptoViewModel.getList()
        self.adapter = TableViewHandler(tableView: self.tableView)
        self.adapter.delegate=self
    }
    
}
//Updating View based on received response
extension ListViewController: ViewModelToVC{
    func startLoading()
    {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.startAnimating()
    }
    func stopLoading()
    {
        activityIndicator.stopAnimating()
    }
    func SucessResponse()
    {
        refControl.endRefreshing()
        self.adapter.reloadData(viewModel: cryptoViewModel)
    }
    func ErrorResponse() {
        
    }
}
//Take to Detail Screen when user clicks on table view cell
extension ListViewController: TableViewToVC{
    
    func takeToDetailScreen(index:Int)
    {
        // Keeping this simple as there's only one navigation
        let data = self.cryptoViewModel.cryptoModel[index];
        let detailVC = DetailViewController.instantiate()
        detailVC.viewModel = data;
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

