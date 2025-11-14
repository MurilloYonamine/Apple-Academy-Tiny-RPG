//
//  GameCore.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class GameCore {
    private let _inventoryLimit = 15;
    
    public func StartGame() {
        var hasTheGameEnded : Bool = false;

        while !hasTheGameEnded {
            print("Qual será o nome de seu guerreiro? ");
            let nome : String = readLine() ?? "";
            
            let (character, equipment) = createPlayer(name: nome)
            
            let player : Player = Player(
                characterData: character,
                equipmentData: equipment,
                inventoryLimit: _inventoryLimit
            )
            
            let enemies : Array<Enemy> = generateEnemies();
            
            let combatSystem = CombatSystem(
                Player: player,
                Enemys: enemies
            )
            
            combatSystem.startCombat();
            
            hasTheGameEnded = true;
        }
    }
    private func generateEnemies() -> Array<Enemy> {
        let randomInt : Int = Int.random(in: 1...4)
        var arrayEnemies = [Enemy]();
        for _ in 0...randomInt {
            let (character, equipment) = createOgre(name: "Ogre")
            
            let enemy : Enemy = Enemy(
                characterData: character,
                equipmentData: equipment
            )
            arrayEnemies.append(enemy)
        }
        return arrayEnemies;
    }

    // Deus eu queria fazer um json ou um txt, mas nao vai dar tempo
    private func createPlayer(name : String) -> (CharacterData, EquipmentData) {
        
        let statsValue : Float = 5.0;
        let characterData : CharacterData = CharacterData(
            _name: name,
            _level: Int(statsValue),
            _life: statsValue,
            _damage: statsValue,
            _critical: statsValue,
            _evasion: statsValue,
            _resistance: statsValue,
            _agility: statsValue
        )
        
        let requiredLevel : Int = 1;
        
        let equipmentData : EquipmentData = EquipmentData(
            _helmet: Helmet(
                requiredLevel: requiredLevel,
                name: "Capacete de Couro",
                critical: statsValue
            ),
            
            _breastPlate: Breastplate(
                requiredLevel: requiredLevel,
                name: "Peitoral de Couro",
                resistance: statsValue
            ),
            
            _greaves: Greaves(
                requiredLevel: requiredLevel,
                name: "Grevas de Couro",
                agility: statsValue
            ),
            
            _boot: Boot(
                requiredLevel: requiredLevel,
                name: "Bota de Couro",
                evasion: statsValue
            ),
            
            _weapon: Weapon(
                requiredLevel: requiredLevel,
                name: "Espada de Madeira",
                extraDamage: statsValue
            )
        )
        
        return (characterData, equipmentData);
    }
    private func createOgre(name : String) -> (CharacterData, EquipmentData) {
        
        let statsValue : Float = 3.0;
        let characterData : CharacterData = CharacterData(
            _name: name,
            _level: Int(statsValue),
            _life: statsValue,
            _damage: statsValue,
            _critical: statsValue,
            _evasion: statsValue,
            _resistance: statsValue,
            _agility: statsValue
        )
        
        let requiredLevel : Int = 1;
        
        let equipmentData : EquipmentData = EquipmentData(
            _helmet: Helmet(
                requiredLevel: requiredLevel,
                name: "",
                critical: statsValue
            ),
            
            _breastPlate: Breastplate(
                requiredLevel: requiredLevel,
                name: "Peitoral de Couro"),
            
            _greaves: Greaves(
                requiredLevel: requiredLevel,
                name: ""
            ),
            
            _boot: Boot(
                requiredLevel: requiredLevel,
                name: "",
                evasion: statsValue
            ),
            
            _weapon: Weapon(
                requiredLevel: requiredLevel,
                name: "Porrete",
                extraDamage: statsValue
            )
        )
        
        return (characterData, equipmentData);
    }
}
