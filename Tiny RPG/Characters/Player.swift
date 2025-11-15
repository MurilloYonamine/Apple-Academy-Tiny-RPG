//
//  Player.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class Player : Character {
    private var xp : Int;
    
    init(xp: Int, characterData : CharacterData, equipmentData : EquipmentData) {
        self.xp = xp;
        super.init(characterData: characterData, equipmentData: equipmentData);
    }
    
    public func gainExperience(amount: Int) {
        xp += amount;
        print("Ganhou \(amount) XP! Total: \(xp)");
        checkLevelUp();
    }
    
    private func checkLevelUp() {
        let requiredXP = characterData._level * 100;

        if xp >= requiredXP {
            levelUp();
            xp -= requiredXP;
        }
    }
    
    private func levelUp() {
        characterData._level += 1;
        
        let lifeIncrease: Float = 20;
        let damageIncrease: Float = 3;
        let resistanceIncrease: Float = 1;
        
        characterData._life += lifeIncrease;
        characterData._damage += damageIncrease;
        characterData._resistance += resistanceIncrease;
        
        print("🎉 LEVEL UP! 🎉");
        print("Agora você é level \(characterData._level)");
        print("Vida: +\(lifeIncrease), Dano: +\(damageIncrease), Resistência: +\(resistanceIncrease)");
    }
    
    public func getExperienceInfo() -> (current: Int, required: Int, level: Int) {
        let requiredForNext = characterData._level * 100;
        return (xp, requiredForNext, characterData._level);
    }
}
