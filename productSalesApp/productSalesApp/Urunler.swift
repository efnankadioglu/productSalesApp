//
//  Urunler.swift
//  productSalesApp
//
//  Created by Efnan Kadıoğlu on 16.03.2025.
//

import Foundation

class Urunler {
    
    var id: Int?
    var ad: String?
    var resim: String?
    var fiyat: Double?
    
    init(){
        
    }

    init(id: Int, ad: String, resim: String, fiyat: Double) {
        self.id = id
        self.ad = ad
        self.resim = resim
        self.fiyat = fiyat
    }
}
