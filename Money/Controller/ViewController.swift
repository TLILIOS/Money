//
//  ViewController.swift
//  Money
//
//  Created by HAMDI TLILI on 15/07/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var datas: [Coins ] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        getAPI("EUR", "24h")
    }
    func getAPI(_ currency: String, _ period: String) {
        let base = "https://api.coinranking.com/v2/coins"
        let currency = "base=\(currency.uppercased())"
        let period = "timePeriod=\(period)"
        let urlString = base + "?" + currency + "&" + period
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { d, r, e in
                if let data = d {
                    do {
                        let result = try JSONDecoder().decode(APIResponse.self, from: data)
                        let datas = result.data.coins
                        DispatchQueue.main.async {
                            self.datas = datas
                            print(datas)
                            self.tableView.reloadData()
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                        
                    
                }
                if let response = r {
                   //print("response: \(response)")
                }
                if let error = e {
                    //print("Error: \(error.localizedDescription)")
                }
            }.resume()
        } else {
            print("Erreur ctte url n'existe pas !!!")
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Currency") as? CurrencyCell {
            cell.coin = datas[indexPath.row ]
            return cell
        }
        return UITableViewCell()
    }
}

