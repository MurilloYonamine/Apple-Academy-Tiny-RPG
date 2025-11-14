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
    public var isCharacterTurn : Bool;
    
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
        
        isCharacterTurn = false;
        
        self.characterData = characterData;
        self.equipmentData = equipmentData;
    }
    
//    public func giveDamage() -> Int {
//        
//    }
//    public func receiveDamage() -> Int {
//        
//    }
        public func HandleDeath() {
            print("Morreu!");
        }
}
