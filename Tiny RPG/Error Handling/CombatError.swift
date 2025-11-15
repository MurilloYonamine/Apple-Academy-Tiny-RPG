enum CombatError: Error {
    case playerDead
    case enemyDead
    case invalidAction
    case noTargetSelected
    case insufficientMana
    
    var localizedDescription: String {
        switch self {
        case .playerDead:
            return "O jogador está morto e não pode agir!"
        case .enemyDead:
            return "O inimigo já foi derrotado!"
        case .invalidAction:
            return "Ação inválida no combate!"
        case .noTargetSelected:
            return "Nenhum alvo selecionado!"
        case .insufficientMana:
            return "Mana insuficiente para esta ação!"
        }
    }
}