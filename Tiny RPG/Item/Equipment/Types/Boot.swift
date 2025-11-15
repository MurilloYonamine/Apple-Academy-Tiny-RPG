//
//  Boot.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class Boot : Equipment {
    public private(set) var movementSpeed : Float;
    
    init(requiredLevel: Int, name: String, movementSpeed: Float, rarity: Rarity = .Common) {
        self.movementSpeed = movementSpeed;
        super.init(requiredLevel: requiredLevel, name: name, rarity: rarity);
    }
    
    public override func performEquip(on character: Character) throws {
        character.equipmentData._boot = self;
        print("Equipou bota: \(name) (+\(movementSpeed) velocidade)");
    }
}
