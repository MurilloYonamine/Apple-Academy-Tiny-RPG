enum EquipmentError: Error {
    case levelTooLow(required: Int, current: Int)
    case incompatibleType
    case equipmentNotFound
    case inventoryFull
    case alreadyEquipped
    
    var localizedDescription: String {
        switch self {
        case .levelTooLow(let required, let current):
            return "Level insuficiente! Requerido: \(required), Atual: \(current)"
        case .incompatibleType:
            return "Tipo de equipamento incompatível!"
        case .equipmentNotFound:
            return "Equipamento não encontrado!"
        case .inventoryFull:
            return "Inventário cheio!"
        case .alreadyEquipped:
            return "Equipamento já está equipado!"
        }
    }
}