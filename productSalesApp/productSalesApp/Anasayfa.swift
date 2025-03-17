//
//  ViewController.swift
//  productSalesApp
//
//  Created by Efnan Kadıoğlu on 16.03.2025.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var urunlerTableView: UITableView!
    
    var urunlerListesi = [Urunler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urunlerTableView.delegate = self
        urunlerTableView.dataSource = self
      
        let u1 = Urunler(id: 1, ad: "Ribbon Notebook", resim: "defter1", fiyat: 13.99 )
        let u2 = Urunler(id: 2, ad: "Golden Twist Ring", resim: "yüzük", fiyat: 23.00 )
        let u3 = Urunler(id: 3, ad: "Elegant Bows Journal", resim: "defter3", fiyat: 13.23 )
        let u4 = Urunler(id: 4, ad: "Golden Necklace", resim: "kolye1", fiyat: 32.40 )
        let u5 = Urunler(id: 5, ad: "Chic Bow Laptop Case", resim: "kılıf", fiyat: 57.99 )
        let u6 = Urunler(id: 6, ad: "Disco Spark Notebook", resim: "defter4", fiyat: 12.30 )
        let u7 = Urunler(id: 17, ad: "Coral Charm Necklace", resim: "kolye2", fiyat: 47.00 )
        let u8 = Urunler(id: 8, ad: "Butterfly Notebook", resim: "defter2", fiyat: 16.00 )
  
        urunlerListesi.append(u1)
        urunlerListesi.append(u2)
        urunlerListesi.append(u3)
        urunlerListesi.append(u4)
        urunlerListesi.append(u5)
        urunlerListesi.append(u6)
        urunlerListesi.append(u7)
        urunlerListesi.append(u8)
        
        urunlerTableView.separatorColor = UIColor(red: 0.95, green: 0.75, blue: 0.92, alpha: 1.0)
    }

}

extension Anasayfa : UITableViewDataSource, UITableViewDelegate, HucreProtocol {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunlerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let urun = urunlerListesi[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre") as! UrunlerHucre
        
        hucre.imageViewUrun.image = UIImage(named: urun.resim!)
        hucre.labelUrunAd.text = urun.ad
        hucre.labelUrunFiyat.text = "$ \(urun.fiyat!)"
        hucre.backgroundColor = UIColor(red: 0.95, green: 0.75, blue: 0.92, alpha: 1.0)
        hucre.hucreArkaplan.layer.cornerRadius = 10.0
        hucre.selectionStyle = .none
        hucre.hucreProtocol = self
        hucre.indexPath = indexPath
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let urun = urunlerListesi[indexPath.row]
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") {contextualAction, view , bool in
            print("\(urun.ad!) silindi")
      }
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle") {contextualAction, view , bool in
            print("\(urun.ad!) düzenlendi")
        }
        
        return UISwipeActionsConfiguration(actions: [silAction,duzenleAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urun = urunlerListesi[indexPath.row]
       performSegue(withIdentifier: "toDetay", sender: urun)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
                if let urun = sender as? Urunler {
                    let gidilecekVC = segue.destination as! DetaySayfa
                    gidilecekVC.urun = urun
                }
        }
    }
    
    func sepeteEkleTiklandi(indexPath: IndexPath) {
        let urun = urunlerListesi[indexPath.row]
        print("\(urun.ad!) sepete eklendi")
    }
    
}
