class CombatRewards {
    
    private let itemFactory = ItemFactory();
    
    func calculateExperience(for enemy: Enemy) -> Int {
        let baseXP = 25;
        let levelMultiplier = enemy.characterData._level;
        return baseXP + (levelMultiplier * 10);
    }
    
    func giveRewards(_ player: Player, for enemy: Enemy) -> Int {
        let xp = calculateExperience(for: enemy);
        player.gainExperience(amount: xp);
        
        if Int.random(in: 1...100) <= 30 {
            giveRandomEquipment(player);
        }
        
        return xp
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