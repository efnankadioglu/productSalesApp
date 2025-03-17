//
//  UrunlerHucre.swift
//  productSalesApp
//
//  Created by Efnan Kadıoğlu on 16.03.2025.
//

import UIKit

protocol HucreProtocol {
    func sepeteEkleTiklandi(indexPath: IndexPath)
}

class UrunlerHucre: UITableViewCell {

    @IBOutlet weak var hucreArkaplan: UIView!
    
    @IBOutlet weak var imageViewUrun: UIImageView!
    
    @IBOutlet weak var labelUrunAd: UILabel!
    
    @IBOutlet weak var labelUrunFiyat: UILabel!
    
    var hucreProtocol: HucreProtocol?
    var indexPath: IndexPath?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func butttonSepeteEkle(_ sender: Any) {
        hucreProtocol?.sepeteEkleTiklandi(indexPath: indexPath!)
        
        
    }
    

}
