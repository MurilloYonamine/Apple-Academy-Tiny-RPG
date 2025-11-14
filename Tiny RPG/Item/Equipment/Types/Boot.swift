//
//  Boot.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class Boot : Equipment {
    public var evasion : Float;
    
    init(requiredLevel: Int, name: String, evasion : Float) {
        self.evasion = evasion;
        super.init(requiredLevel: requiredLevel, name: name);
    }
}
