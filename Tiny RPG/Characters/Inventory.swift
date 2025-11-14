//
//  Inventory.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class Inventory {
    private var _itens : Array<Item>;
    
    private init() {}
    
    private func addItem(item : Item) {
        
    }
    private func removeItem(item : Item) {
        
    }
    private func printItems() -> String {
        var mensagem : String = "";
        for item in _itens {
            mensagem += "\(item.name)\n"
        }
        
        return mensagem;
    }
}
