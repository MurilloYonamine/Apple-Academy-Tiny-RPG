//
//  Item.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class Item {
    private var ID : Int;
    public var price : Double;
    public var rarity : Rarity;
    public var name : String;
    
    init(ID: Int, price: Double, rarity: Rarity, name: String) {
        self.ID = ID
        self.price = price
        self.rarity = rarity
        self.name = name
    }
}
