enum EquipmentError: Error {
    case levelTooLow(required: Int, current: Int)
    case incompatibleType
    case equipmentNotFound
    case inventoryFull
    case alreadyEquipped
    
    var localizedDescription: String {
        switch self {
        case EquipmentError.levelTooLow(let required, let current):
            return "Level insuficiente! Requerido: \(required), Atual: \(current)"
        case EquipmentError.incompatibleType:
            return "Tipo de equipamento incompatível!"
        case EquipmentError.equipmentNotFound:
            return "Equipamento não encontrado!"
        case EquipmentError.inventoryFull:
            return "Inventário cheio!"
        case EquipmentError.alreadyEquipped:
            return "Equipamento já está equipado!"
        }
    }
}