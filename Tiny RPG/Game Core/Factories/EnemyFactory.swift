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
            _name: "Goblin",
            _level: 1,
            _life: 40,
            _damage: 8,
            _critical: 15,
            _evasion: 5,
            _resistance: 2,
            _agility: 3
        );

        let helmet = Helmet(
            requiredLevel: 1, 
            name: "Elmo Básico", 
            critical: 0
        );
        let weapon = Weapon(
            requiredLevel: 1, 
            name: "Adaga", 
            extraDamage: 2
        );
        let breastplate = Breastplate(
            requiredLevel: 1, 
            name: "Armadura Básica", 
            resistance: 1
        );
        let boot = Boot(
            requiredLevel: 1, 
            name: "Botas Básicas", 
            movementSpeed: 1
        );
        let greaves = Greaves(
            requiredLevel: 1, 
            name: "Caneleiras Básicas", 
            agility: 1
        );
        
        let equipmentData = EquipmentData(
            _helmet: helmet,
            _breastPlate: breastplate,
            _greaves: greaves,
            _boot: boot,
            _weapon: weapon
        )
        
        return Enemy(characterData: characterData, equipmentData: equipmentData)
    }

    private func createOrc() -> Enemy {
        let characterData = CharacterData(
            _name: "Orc",
            _level: 3,
            _life: 80,
            _damage: 15,
            _critical: 8,
            _evasion: 3,
            _resistance: 5,
            _agility: 2
        );
        
        let helmet = Helmet(
            requiredLevel: 1, 
            name: "Elmo de Ferro", 
            critical: 2
        );
        let weapon = Weapon(
            requiredLevel: 1, 
            name: "Machado", 
            extraDamage: 5
        );
        let breastplate = Breastplate(
            requiredLevel: 1, 
            name: "Armadura de Ferro", 
            resistance: 3
        );
        let boot = Boot(
            requiredLevel: 1, 
            name: "Botas de Ferro", 
            movementSpeed: 1
        );
        let greaves = Greaves(
            requiredLevel: 1, 
            name: "Caneleiras de Ferro", 
            agility: 2
        );
        
        let equipmentData = EquipmentData(
            _helmet: helmet,
            _breastPlate: breastplate,
            _greaves: greaves,
            _boot: boot,
            _weapon: weapon
        )
        
        return Enemy(characterData: characterData, equipmentData: equipmentData)
    }

    private func createSkeleton() -> Enemy {
        let characterData = CharacterData(
            _name: "Skeleton",
            _level: 2,
            _life: 35,
            _damage: 12,
            _critical: 20,
            _evasion: 8,
            _resistance: 1,
            _agility: 6
        );
        
        let helmet = Helmet(
            requiredLevel: 1, 
            name: "Crânio", 
            critical: 5
        );
        let weapon = Weapon(
            requiredLevel: 1, 
            name: "Espada Enferrujada", 
            extraDamage: 3
        );
        let breastplate = Breastplate(
            requiredLevel: 1, 
            name: "Ossos", 
            resistance: 0
        );
        let boot = Boot(
            requiredLevel: 1, 
            name: "Pés Descalços", 
            movementSpeed: 2
        );
        let greaves = Greaves(
            requiredLevel: 1, 
            name: "Ossos da Perna", 
            agility: 3
        );
        
        let equipmentData = EquipmentData(
            _helmet: helmet,
            _breastPlate: breastplate,
            _greaves: greaves,
            _boot: boot,
            _weapon: weapon
        )
        
        return Enemy(characterData: characterData, equipmentData: equipmentData)
    }

    private func createOgre() -> Enemy {
        let characterData = CharacterData(
            _name: "Ogre",
            _level: 4,
            _life: 120,
            _damage: 18,
            _critical: 5,
            _evasion: 2,
            _resistance: 8,
            _agility: 1
        );
        
        let helmet = Helmet(requiredLevel: 1, name: "Elmo de Pedra", critical: 3)
        let weapon = Weapon(requiredLevel: 1, name: "Clava Gigante", extraDamage: 8)
        let breastplate = Breastplate(requiredLevel: 1, name: "Armadura de Pedra", resistance: 5)
        let boot = Boot(requiredLevel: 1, name: "Botas de Pedra", movementSpeed: 0.5)
        let greaves = Greaves(requiredLevel: 1, name: "Caneleiras de Pedra", agility: 1)
        
        let equipmentData = EquipmentData(
            _helmet: helmet,
            _breastPlate: breastplate,
            _greaves: greaves,
            _boot: boot,
            _weapon: weapon
        )
        
        return Enemy(characterData: characterData, equipmentData: equipmentData)
    }
}