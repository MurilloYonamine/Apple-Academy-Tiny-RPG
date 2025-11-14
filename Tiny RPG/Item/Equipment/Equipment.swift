//
//  Equipment.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class Equipment {
    private var _requiredLevel : Int;
    public private(set) var name : String;
    
    init(requiredLevel: Int, name : String) {
        self._requiredLevel = requiredLevel;
        self.name = name;
    }
    
    public func Execute(value : Float) -> Float {
        return value;
    }
}
