//
//  Weapon.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class Weapon : Equipment {
    public var extraDamage : Float;
    
    init(requiredLevel: Int, name: String, extraDamage : Float) {
        self.extraDamage = extraDamage;
        super.init(requiredLevel: requiredLevel, name: name)
    }
}
