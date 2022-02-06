//
//  TableViewHandler.swift
//  Cryptocurrency
//
//  Created by Archana Vetkar on 05/02/22.
// To seperate out tableview from view controller this Table view handler is used

import UIKit

final class TableViewHandler: NSObject {
    
    let tableView: UITableView
    var viewModel: CryptoViewModel!
    var delegate: TableViewToVC!
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        self.tableView.delegate = self
    }
    func reloadData(viewModel:CryptoViewModel)
    {
        self.viewModel = viewModel;
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
}
extension TableViewHandler: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.cryptoModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoTableViewCell") as? CryptoTableViewCell else { fatalError() }
        cell.setData(item: self.viewModel.cryptoModel[indexPath.row], for: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row \(indexPath.item + 1)")
        tableView.deselectRow(at: indexPath, animated: true)
//        delegate?.didPressedTableViewCell(viewModel: self.viewModel.cryptoModel[indexPath.row])
        delegate.takeToDetailScreen(index: indexPath.row)
    }
}
