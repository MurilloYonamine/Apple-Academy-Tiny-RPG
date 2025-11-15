//
//  Helmet.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class Helmet : Equipment {
    public private(set) var critical : Float;
    
    init(requiredLevel: Int, name: String, critical: Float, rarity: Rarity = .Common) {
        self.critical = critical;
        super.init(requiredLevel: requiredLevel, name: name, rarity: rarity);
    }
    
    public override func performEquip(character: Character) throws {
        character.equipmentData._helmet = self;
        print("Equipou elmo: \(name) (+\(critical)% crítico)");
    }
}
