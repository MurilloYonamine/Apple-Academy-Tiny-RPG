//
//  GameCore.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class GameCore {
    private let _inventoryLimit = 15;
    private var hasTheGameEnded : Bool = false;

    public func StartGame() {
        print("Qual será o nome de seu guerreiro? ");
        let nome : String = readLine() ?? "";
        
        while !hasTheGameEnded {
            let (character, equipment) = createPlayer(name: nome)
            
            let player : Player = Player(
                xp: 10,
                characterData: character,
                equipmentData: equipment
            )
            let enemy : Enemy = generateEnemy();
            
            print("O que deseja fazer?")
            let options = [
                "[1] Comecar Combate",
                "[2] Sair do Jogo"
            ]
            
            let menu = Menu(options: options);
            let chosenOption = menu.getChosenOption();
            
            handleOption(option: chosenOption, player: player, enemy: enemy)
        }
    }
    private func handleOption(option : Int, player : Player, enemy : Enemy) {
        switch option {
        case 1:
            let combatSystem = CombatSystem(Player: player, Enemy: enemy)
            combatSystem.startCombat();
        case 2:
            hasTheGameEnded = true;
        default:
            print("Nao reconheco esse numero")
        }
    }
    private func generateEnemy() -> Enemy {
        let (character, equipment) = createOgre(name: "Ogre")
            
        let enemy : Enemy = Enemy(
            characterData: character,
            equipmentData: equipment
        )
        
        return enemy;
    }

    // Deus eu queria fazer um json ou um txt, mas nao vai dar tempo
    private func createPlayer(name : String) -> (CharacterData, EquipmentData) {
        
        let statsValue : Float = 5.0;
        let characterData : CharacterData = CharacterData(
            _name: name,
            _level: Int(statsValue),
            _life: 200,
            _damage: 20,
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
            _life: 200,
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
