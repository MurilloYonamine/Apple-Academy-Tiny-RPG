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
            let (character, equipment) = createPlayer(name: nome);
            
            let player : Player = Player(
                xp: 10,
                characterData: character,
                equipmentData: equipment
            );
            let enemy : Enemy = generateEnemy();
            
            print("")
            print("O que deseja fazer?")
            let options = [
                "[1] Comecar Combate",
                "[2] Sair do Jogo"
            ];
            
            let menu = Menu(options: options);
            let chosenOption = menu.getChosenOption();
            
            handleOption(option: chosenOption, player: player, enemy: enemy);
        }
    }
    private func handleOption(option : Int, player : Player, enemy : Enemy) {
        switch option {
        case 1:
            print("")
            let combatSystem = CombatSystem(Player: player, Enemies: [enemy])
            combatSystem.startCombat()
            print("")
        case 2:
            hasTheGameEnded = true;
        default:
            print("Nao reconheco esse numero");
        }
    }
    
    private func generateEnemy() -> Enemy {
        let enemyFactory = EnemyFactory()
        return enemyFactory.createRandomEnemy()
    }

    // Deus eu queria fazer um json ou um txt, mas nao vai dar tempo
    private func createPlayer(name : String) -> (CharacterData, EquipmentData) {
        
        let characterData : CharacterData = CharacterData(
            _name: name,
            _level: 1,
            _life: 100,
            _damage: 10,
            _critical: 5,
            _evasion: 3,
            _resistance: 4,
            _agility: 4
        );
        
        let requiredLevel : Int = 1;
        
        let equipmentData : EquipmentData = EquipmentData(
            _helmet: Helmet(
                requiredLevel: requiredLevel,
                name: "Capacete de Couro",
                critical: 2
            ),
            
            _breastPlate: Breastplate(
                requiredLevel: requiredLevel,
                name: "Peitoral de Couro",
                resistance: 2
            ),
            
            _greaves: Greaves(
                requiredLevel: requiredLevel,
                name: "Grevas de Couro",
                agility: 2
            ),
            
            _boot: Boot(
                requiredLevel: requiredLevel,
                name: "Bota de Couro",
                movementSpeed: 2
            ),
            
            _weapon: Weapon(
                requiredLevel: requiredLevel,
                name: "Espada de Madeira",
                extraDamage: 3
            )
        );
        
        return (characterData, equipmentData);
    }
}
