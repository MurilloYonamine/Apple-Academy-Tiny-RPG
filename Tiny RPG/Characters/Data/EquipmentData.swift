//
//  EquipmentData.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

struct EquipmentData {
    public var _helmet : Equipment;
    public var _breastPlate : Equipment;
    public var _greaves : Equipment;
    public var _weapon : Equipment;
    
    public func changeEquipment(item : Item) -> Item {
        
    }
    public func printEquipmentes() -> String {
        let mensagem : String = "Helmet: \(_helmet)\nBreast Plate: \(_breastPlate)\nGreaves: \(_greaves)\nWeapon: \(_weapon)";
        
        return mensagem;
    }
}
