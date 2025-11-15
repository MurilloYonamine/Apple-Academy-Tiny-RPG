enum CombatError: Error {
    case playerDead
    case enemyDead
    case invalidAction
    case noTargetSelected
    case insufficientMana
    
    var localizedDescription: String {
        switch self {
        case CombatError.playerDead:
            return "O jogador está morto e não pode agir!"
        case CombatError.enemyDead:
            return "O inimigo já foi derrotado!"
        case CombatError.invalidAction:
            return "Ação inválida no combate!"
        case CombatError.noTargetSelected:
            return "Nenhum alvo selecionado!"
        case CombatError.insufficientMana:
            return "Mana insuficiente para esta ação!"
        }
    }
}