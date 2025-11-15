//
//  Equipment.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class Equipment {
    private var _requiredLevel : Int;
    public private(set) var name : String;
    public var rarity: Rarity = Rarity.Common;
    
    init(requiredLevel: Int, name: String, rarity: Rarity = .Common) {
        self._requiredLevel = requiredLevel;
        self.name = name;
        self.rarity = rarity;
    }
    
    public var requiredLevel: Int {
        return _requiredLevel;
    }
    
    public func equipOn(character: Character) throws {
        if character.characterData._level < _requiredLevel {
            throw EquipmentError.levelTooLow(
                required: _requiredLevel, 
                current: character.characterData._level
            )
        }
        
        try performEquip(on: character)
    }
    
    public func performEquip(on character: Character) throws {
        throw EquipmentError.incompatibleType
    }
    
    public func getEquipmentType() -> String {
        switch self {
            case is Weapon: return "Arma"
            case is Helmet: return "Elmo"
            case is Breastplate: return "Peitoral"
            case is Boot: return "Bota"
            case is Greaves: return "Caneleira"
            default: return "Desconhecido"
        }
    }
    
    public func getEquipmentInfo() -> String {
        return "[\(getEquipmentType())] \(name) - Level \(_requiredLevel)"
    }
}
