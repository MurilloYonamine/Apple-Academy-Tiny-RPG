//
//  CombatSystem.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class CombatSystem {
    private let Player : Player
    private var Enemies : [Enemy]
    private var hasCombatEnded : Bool = false
    private let enemyFactory = EnemyFactory()
    private let combatRewards = CombatRewards()
    
    init(Player: Player, Enemies: [Enemy]) {
        self.Player = Player
        self.Enemies = Enemies
        self.hasCombatEnded = false
    }
    
    public func startCombat() {
        let count = Int.random(in: 1...4)
        Enemies.removeAll()

        for _ in 0..<count {
            let enemy = enemyFactory.createRandomEnemy()
            Enemies.append(enemy)
        }
        hasCombatEnded = false

        print("\n⚔️  Apareceram \(Enemies.count) inimigos!")
        showCombatStatus()

        while !hasCombatEnded && Player.Life > 0 {
            var algumVivo = false

            for enemy in Enemies {
                if enemy.Life > 0 {
                    algumVivo = true
                    break
                }
            }

            if !algumVivo { break }

            if Player.isCharacterTurn {
                playerTurn()

            } else {
                for i in 0..<Enemies.count {
                    if Enemies[i].Life > 0 {
                        enemyTurn(Enemies[i])
                        if Player.Life <= 0 { break }
                    }
                }
                Player.isCharacterTurn = true
            }
        }

        endCombat()
    }
    
    private func playerTurn() {
        print("\n--- SEU TURNO ---")
        for i in 0..<Enemies.count {
            let enemy = Enemies[i]
            if enemy.Life > 0 {
                print("[\(i+1)] Atacar \(enemy.characterData._name) (Vida: \(enemy.Life))")
            }
        }
        print("[0] Fugir")
        
        let input = readLine() ?? ""
        let option = Int(input) ?? -1
        
        if option == 0 {
            print("💨 Você fugiu do combate!")
            hasCombatEnded = true
            return
        }
        
        playerAttack(target: Enemies[option-1])
        Player.isCharacterTurn = false
    }
    
    private func enemyTurn(_ enemy: Enemy) {
        print("\n--- TURNO DO \(enemy.characterData._name.uppercased()) ---")
        let enemyDamage = enemy.giveDamage()
        do {
            let finalDamage = try Player.receiveDamage(damage: enemyDamage)
            Player.takeDamage(finalDamage)
            print("💥 \(enemy.characterData._name) atacou e causou \(finalDamage) de dano!")
            print("❤️ Sua vida: \(Player.Life)")
        } catch {
            print("❌ Erro no ataque do inimigo: \(error)")
        }
    }
    
    private func playerAttack(target: Enemy) {
        let playerDamage = Player.giveDamage()
        do {
            let finalDamage = try target.receiveDamage(damage: playerDamage)
            target.takeDamage(finalDamage)
            print("⚔️ Você atacou \(target.characterData._name) e causou \(finalDamage) de dano!")
            print("🩸 Vida do \(target.characterData._name): \(target.Life)")
        } catch {
            print("❌ Erro no seu ataque: \(error)")
        }
    }
    
    private func showCombatStatus() {
        print("\n📊 STATUS DO COMBATE")
        print("❤️ Sua vida: \(Player.Life)")
        for (i, enemy) in Enemies.enumerated() where enemy.Life > 0 {
            print("🩸 Inimigo \(i+1): \(enemy.characterData._name) (Vida: \(enemy.Life))")
        }
        print("------------------------")
    }
    
    private func endCombat() {
        if Player.Life <= 0 {
            print("\n💀 DERROTA!")
            print("Você foi derrotado!")
            print("")
        } else if !Enemies.contains(where: { $0.Life > 0 }) {
            print("\n🎉 VITÓRIA!")
            print("Você derrotou todos os inimigos!")
            print("")
            for enemy in Enemies {
                print("🏆 Vitória!")
                print("Derrotou: \(enemy.characterData._name)")
                let xp = combatRewards.giveRewards(Player, for: enemy)
                print("XP Ganho: \(xp)")
                print("")
            }
        }
        hasCombatEnded = true
    }
}
