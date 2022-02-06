//
//  DetailViewController.swift
//  Cryptocurrency
//
//  Created by Archana Vetkar on 06/02/22.
// Detail view of the clicked Currency 

import UIKit

class DetailViewController: UIViewController,Storyboarded {
    
    // MARK:- Outlets
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var lb_symbol: UILabel!
    @IBOutlet weak var lb_marketRank: UILabel!
    @IBOutlet weak var lb_lastUpdatedDate: UILabel!
    @IBOutlet weak var lb_per: UILabel!
    @IBOutlet weak var lb_price: UILabel!
    @IBOutlet weak var lb_name: UILabel!
    @IBOutlet weak var lb_priceChange24H: UILabel!
    @IBOutlet weak var lb_totalSupply: UILabel!
    @IBOutlet weak var lb_maxSupply: UILabel!
    @IBOutlet weak var lb_valuation: UILabel!
    @IBOutlet weak var lb_marketCap: UILabel!
    //    Variables
    var viewModel : CryptoModel!
    //    MARK:- ViewDidLaod
    override func viewDidLoad() {
        super.viewDidLoad()
        setData();
    }
    //    MARK:- Functions
    func setData()
    {
        lb_name.text = viewModel.name
        lb_symbol.text = viewModel.symbol;
        lb_marketRank.text = String(viewModel.marketCapRank)
        lb_lastUpdatedDate.text = viewModel.lastUpdated
        lb_per.text = String(format: "%.2f",viewModel.priceChangePercentage24H)
        lb_price.text = String(format: "%.2f",viewModel.currentPrice)
        ImageDownloader.shared.setImage(with: viewModel.image, imageView: self.coinImage)
        lb_priceChange24H.text = String(format: "%.2f",viewModel.priceChange24H)
        lb_totalSupply.text = String(format: "%.2f",viewModel.totalSupply ?? 0)
        lb_maxSupply.text = String(format: "%.2f",viewModel.maxSupply ?? 0)
        lb_valuation.text = String(format: "%.2f",viewModel.fullyDilutedValuation ?? 0)
        lb_marketCap.text = String(format: "%.2f",viewModel.marketCap)
    }
    
}
