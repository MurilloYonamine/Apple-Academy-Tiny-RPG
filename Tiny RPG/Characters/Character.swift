//
//  Character.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class Character {
    public var characterData : CharacterData;
    public var equipmentData : EquipmentData;
        
    public var isCharacterTurn : Bool = true;
    
    public var TotalEvasion: Float {
        get {
            let baseEvasion = characterData._evasion;
            let bootEvasion = equipmentData._boot.movementSpeed;
            return baseEvasion + bootEvasion;
        }
    }
    public var Life : Float {
        get {
            return characterData._life;
        }
    }

    public func tryToEvade() -> Bool {
        let evasionChance = min(TotalEvasion * 2, 40) ;
        let roll = Float.random(in: 0...100);
        return roll <= evasionChance;
    }
    
    public func takeDamage(_ damage: Float) {
        characterData._life -= damage;
        if characterData._life <= 0 {
            characterData._life = 0;
            HandleDeath();
        }
    }
    
    public func heal(_ amount: Float) {
        characterData._life += amount;
    }
    
    public init(characterData : CharacterData, equipmentData : EquipmentData, inventoryLimit : Int = 10) {
        isCharacterTurn = true;
        
        self.characterData = characterData;
        self.equipmentData = equipmentData;
    }
    
    public func giveDamage() -> Float {
        let baseDamage = characterData._damage + equipmentData._weapon.extraDamage;
        let criticalChance = characterData._critical + equipmentData._helmet.critical;
        
        if Float.random(in: 0...100) <= criticalChance {
            let criticalDamage = baseDamage * 1.5;
            print("💥 GOLPE CRÍTICO! 💥");
            return criticalDamage;
        }
        
        return baseDamage;
    }

    public func receiveDamage(damage: Float) throws -> Float {
        if tryToEvade() {
            print("💨 Evadiu o ataque!")
            return 0 
        }
    
        let totalResistance = characterData._resistance + equipmentData._breastPlate.resistance // Remove o ?
        let finalDamage = max(damage - totalResistance, 1) 
        
        return finalDamage
    }

    public func equip(_ equipment: Equipment) throws {
        try equipment.equipOn(character: self);
    }

    public func HandleDeath() {
        print("O \(characterData._name) morreu!");
    }
}
