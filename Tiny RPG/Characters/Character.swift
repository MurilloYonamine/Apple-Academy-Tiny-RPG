//
//  Character.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class Character {
    public let characterData : CharacterData;
    public let equipmentData : EquipmentData;
        
    // Combat
    public var isCharacterTurn : Bool = true;
    
    // Stats
    public var Life : Float {
        get {
            return characterData._life;
        } set {
            if(characterData._life <= 0) {
                HandleDeath();
            }
        }
    }
    
    public init(characterData : CharacterData, equipmentData : EquipmentData, inventoryLimit : Int = 10) {
        
        isCharacterTurn = true;
        
        self.characterData = characterData;
        self.equipmentData = equipmentData;
    }
    
        public func giveDamage() -> Float {
            //let critMultiplier = 1.5;
            let damage : Float = characterData._damage + equipmentData._weapon.extraDamage;
            
            return damage;
        }
        public func receiveDamage(damage : Float) -> Float {
            let receivedDamage : Float = Life - (damage - (characterData._resistance + equipmentData._breastPlate.resistance));
            
            return receivedDamage
        }
        public func HandleDeath() {
            print("O \(characterData._name) morreu!");
        }
}
