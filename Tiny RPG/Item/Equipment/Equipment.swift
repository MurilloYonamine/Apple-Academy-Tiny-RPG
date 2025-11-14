//
//  Equipment.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class Equipment : Item {
    private var _nivelRequerido : Float;
    
    init(_nivelRequerido: Float) {
        self._nivelRequerido = _nivelRequerido;
        super.init(ID: <#T##Int#>, price: <#T##Double#>, rarity: <#T##Rarity#>, name: <#T##String#>);
    }
}
