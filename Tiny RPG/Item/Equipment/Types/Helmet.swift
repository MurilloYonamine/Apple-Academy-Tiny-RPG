//
//  Helmet.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class Helmet : Equipment {
    public var critical : Float;
    init(requiredLevel: Int, name: String, critical : Float) {
        self.critical = critical;
        super.init(requiredLevel: requiredLevel, name: name)
    }
}
