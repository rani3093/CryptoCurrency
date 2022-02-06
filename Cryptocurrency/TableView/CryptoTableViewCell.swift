//
//  CryptoTableViewCell.swift
//  Cryptocurrency
//
//  Created by Archana Vetkar on 05/02/22.
// Table view cell resposible for cell UI

import UIKit

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var coinImage: UIImageView!
    
    func setData(item:CryptoModel,for index:Int)
    {
        self.name.text = item.name
        self.price.text = String(format: "%.2f",item.currentPrice)
        self.percentage.text = String(format: "%.2f",item.priceChangePercentage24H)
        ImageDownloader.shared.setImage(with: item.image, imageView: self.coinImage)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
