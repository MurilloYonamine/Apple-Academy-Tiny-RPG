//
//  Breastplate.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class Breastplate : Equipment {
    public private(set) var resistance : Float;
    
    init(requiredLevel: Int, name: String, resistance: Float, rarity: Rarity = .Common) {
        self.resistance = resistance;
        super.init(requiredLevel: requiredLevel, name: name, rarity: rarity);
    }
    
    public override func performEquip(on character: Character) throws {
        character.equipmentData._breastPlate = self;
        print("Equipou peitoral: \(name) (+\(resistance) resistência)");
    }
}
