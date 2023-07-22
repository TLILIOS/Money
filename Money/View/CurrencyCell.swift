//
//  CurrencyCellTableViewCell.swift
//  Money
//
//  Created by HAMDI TLILI on 17/07/2023.
//

import UIKit
import SVGKit
class CurrencyCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var icon: UIImageView!

    
    var coin: Coins! {
        didSet {
            nameLbl.text = coin.name
            priceLbl.text = coin.price
             let urlString = coin.iconUrl
                if let url = URL(string: urlString) {
                    URLSession.shared.dataTask(with: url) { d, _, _ in
                        if let data = d {
                            let img = SVGKImage(data: data)
                            DispatchQueue.main.sync {
                                self.icon.image = img?.uiImage
                            }
                        }
                    }.resume()
                }
            }
        }
        
        
    }

