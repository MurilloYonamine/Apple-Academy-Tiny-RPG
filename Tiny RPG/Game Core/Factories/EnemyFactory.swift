class EnemyFactory {

    func createRandomEnemy() -> Enemy {
        let enemyTypes = ["Ogre", "Goblin", "Orc", "Skeleton"]
        let randomType = enemyTypes.randomElement() ?? "Ogre"

        switch randomType {
            case "Goblin": return createGoblin()
            case "Orc": return createOrc()
            case "Skeleton": return createSkeleton()
            default: return createOgre()
        }
    }

    private func createGoblin() -> Enemy {
        let characterData = CharacterData(
            name: "Goblin",
            life: 40,
            damage: 8,
            resistance: 2,
            critical: 15,
            level: 1
        )

        let equipmentData = EquipmentData()
        return Enemy(characterData: characterData, equipmentData: equipmentData)
    }

    private func createOrc() -> Enemy {
        let characterData = CharacterData(
            name: "Orc",
            life: 80,
            damage: 15,
            resistance: 5,
            critical: 8,
            level: 3
        )

        let equipmentData = EquipmentData()
        return Enemy(characterData: characterData, equipmentData: equipmentData)
    }

    private func createSkeleton() -> Enemy {
        let characterData = CharacterData(
            name: "Skeleton",
            life: 35,
            damage: 12,
            resistance: 1,
            critical: 20,
            level: 2
        )

        let equipmentData = EquipmentData()
        return Enemy(characterData: characterData, equipmentData: equipmentData)
    }

    private func createOgre() -> Enemy {
        let (character, equipment) = createOgre(name: "Ogre")
        return Enemy(characterData: character, equipmentData: equipment)
    }
}