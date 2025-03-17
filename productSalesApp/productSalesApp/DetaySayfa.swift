//
//  DetaySayfa.swift
//  productSalesApp
//
//  Created by Efnan Kadıoğlu on 16.03.2025.
//

import UIKit

class DetaySayfa: UIViewController {

    @IBOutlet weak var labelUrunFiyat: UILabel!
    
    @IBOutlet weak var imageViewUrun: UIImageView!
    
    var urun:Urunler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let u = urun{
            self.navigationItem.title = u.ad
            
            imageViewUrun.image = UIImage(named: u.resim!)
            labelUrunFiyat.text = "$\(u.fiyat!)"
            imageViewUrun.image = UIImage(named: u.resim!)
            
          //  navigationController?.navigationBar.prefersLargeTitles = false
        }

    }

    @IBAction func buttonSepeteEkle(_ sender: Any) {
        
        if let u = urun{
            print("Detay Sayfa : \(u.ad!) sepete eklendi. ")
        }
    }
}
