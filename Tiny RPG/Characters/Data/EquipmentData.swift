//
//  EquipmentData.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

struct EquipmentData {
    public var _helmet : Helmet;
    public var _breastPlate : Breastplate;
    public var _greaves : Greaves;
    public var _boot : Boot;
    public var _weapon : Weapon;
    
    public func printEquipmentes() -> String {
        let mensagem : String = "Helmet: \(_helmet.name)\nBreast Plate: \(_breastPlate.name)\nGreaves: \(_greaves.name)\nBoot: \(_boot.name)\nWeapon: \(_weapon.name)";
        
        return mensagem;
    }
}
