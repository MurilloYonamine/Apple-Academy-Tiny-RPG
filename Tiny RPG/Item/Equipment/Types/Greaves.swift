//
//  Greaves.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class Greaves : Equipment {
    public private(set) var agility : Float;
    
    init(requiredLevel: Int, name: String, agility: Float, rarity: Rarity = .Common) {
        self.agility = agility;
        super.init(requiredLevel: requiredLevel, name: name, rarity: rarity);
    }
    
    public override func performEquip(on character: Character) throws {
        character.equipmentData._greaves = self;
        print("Equipou caneleira: \(name) (+\(agility) velocidade)");
    }
}
