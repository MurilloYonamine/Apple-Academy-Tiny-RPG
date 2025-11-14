//
//  CombatSystem.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class CombatSystem {
    private let Player : Player;
    private let Enemy : Enemy;
    private var hasCombatEnded : Bool = false;
    
    init(Player: Player, Enemy: Enemy) {
        print("Vamos iniciar o Combate!")
        
        self.Player = Player;
        self.Enemy = Enemy;
        self.hasCombatEnded = false;
    }
    
    public func startCombat() {
        print("Voce enfrentará \(Enemy.characterData._name)!");

        while !hasCombatEnded {
            if Player.isCharacterTurn {
                let options : Array<String> = [
                    "[1] Atacar",
                    "[2] Fugir"
                ]
                
                let menu = Menu(options: options);
                let chosenOption = menu.getChosenOption()
                
                handleOption(option: chosenOption, player: Player)
            } else {
                let enemyDamage : Float = Enemy.giveDamage();
                Player.Life -= enemyDamage;
                print("Player levou: \(enemyDamage) de dano!");
                print("Player esta com: \(Player.Life)!");
                Enemy.isCharacterTurn = false;
                Player.isCharacterTurn = true;
            }
            
            if Player.Life <= 0 || Enemy.Life <= 0 {
                hasCombatEnded = true;
            }
        }
    }
        
    public func handleOption(option : Int, player : Character) {
        switch option {
            case 1:
                let playerDamage : Float = player.giveDamage();
            
            print("Deu \(playerDamage) de dano!")
            
            let damage = Enemy.receiveDamage(damage: playerDamage);
            Enemy.Life -= damage;
            print("Inimigo \(Enemy.characterData._name) esta com \(Enemy.Life)!")
            player.isCharacterTurn = false;
            Enemy.isCharacterTurn = true;
            case 2:
            hasCombatEnded = true;
                
            default:
                print("Não existe essa opcão!");
        }
    }
}
