//
//  CombatSystem.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class CombatSystem {
    let Player : Player;
    let Enemys : Array<Enemy>;
    
    init(Player: Player, Enemys: Array<Enemy>) {
        print("Vamos iniciar o Combate!")
        
        self.Player = Player;
        self.Enemys = Enemys;
    }
    
    public func startCombat() {
        sortFasterCharacter();
    }
    private func sortFasterCharacter() {
        var arrayCharacters : Array<Character> = Enemys;
        for enemy in Enemys {
            arrayCharacters.append(enemy);
        }
        arrayCharacters.append(Player);
        
        for character in arrayCharacters {
            arrayCharacters.sort {$0.characterData._agility > $1.characterData._agility}
        }

    }
}
