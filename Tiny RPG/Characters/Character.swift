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
    
    public var Life : Float {
        get {
            return characterData._life;
        }
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
        if characterData._life <= 0 {
            throw CombatError.playerDead;
        }
        
        let totalResistance = characterData._resistance + equipmentData._breastPlate.resistance;
        let finalDamage = max(1, damage - totalResistance);
        return finalDamage;
    }

    public func equip(_ equipment: Equipment) throws {
        try equipment.equipOn(character: self);
    }

    public func HandleDeath() {
        print("O \(characterData._name) morreu!");
    }
}
