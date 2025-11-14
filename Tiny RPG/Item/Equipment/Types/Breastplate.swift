//
//  Breastplate.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class Breastplate : Equipment {
    public var resistance : Float;

    init(requiredLevel: Int, name: String, resistance : Float = 2) {
        self.resistance = resistance;
        super.init(requiredLevel: requiredLevel, name: name)
    }
}
