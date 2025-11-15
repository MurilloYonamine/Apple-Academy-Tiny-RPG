//
//  Weapon.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class Weapon : Equipment {
    public private(set) var extraDamage : Float;
    
    init(requiredLevel: Int, name: String, extraDamage: Float, rarity: Rarity = .Common) {
        self.extraDamage = extraDamage;
        super.init(requiredLevel: requiredLevel, name: name, rarity: rarity);
    }
    
    public override func performEquip(character: Character) throws {
        character.equipmentData._weapon = self;
        print("Equipou arma: \(name) (+\(extraDamage) dano)");
    }
}
