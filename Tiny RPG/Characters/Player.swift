//
//  Player.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class Player : Character {
    private let xp : Int;
    
    init(xp: Int, characterData : CharacterData, equipmentData : EquipmentData) {
        self.xp = xp
        super.init(characterData: characterData, equipmentData: equipmentData)
    }
}
