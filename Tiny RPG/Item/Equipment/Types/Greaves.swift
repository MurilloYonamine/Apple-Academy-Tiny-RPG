//
//  Greaves.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class Greaves : Equipment {
    public var agility : Float;
    
    init(requiredLevel: Int, name: String, agility: Float = 2) {
        self.agility = agility;
        super.init(requiredLevel: requiredLevel, name: name)
    }
}
