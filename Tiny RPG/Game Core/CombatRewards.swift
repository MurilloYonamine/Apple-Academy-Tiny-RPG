class CombatRewards {
    
    private let itemFactory = ItemFactory();
    
    func calculateExperience(for enemy: Enemy) -> Int {
        let baseXP = 25;
        let levelMultiplier = enemy.characterData._level;
        return baseXP + (levelMultiplier * 10);
    }
    
    func giveRewards(_ player: Player, for defeatedEnemy: Enemy) {
        let xpGained = calculateExperience(for: defeatedEnemy);
        
        print("🏆 Vitória!");
        print("Derrotou: \(defeatedEnemy.characterData._name)");
        print("XP Ganho: \(xpGained)");
        
        player.gainExperience(amount: xpGained);
        
        if Int.random(in: 1...100) <= 30 {
            giveRandomEquipment(player);
        }
    }
    
    private func giveRandomEquipment(_ player: Player) {
        let equipment = itemFactory.createRandomEquipment();
        
        do {
            print("💎 Encontrou: \(equipment.getEquipmentInfo())");
            try player.equip(equipment);
        } catch let error as EquipmentError {
            print("Não foi possível equipar: \(error.localizedDescription)");
        } catch {
            print("Erro ao equipar item");
        }
    }
}