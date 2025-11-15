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
            _life: 35,         
            _damage: 7,     
            _critical: 18,   
            _evasion: 7,   
            _resistance: 1,   
            _agility: 6       
        )

        let helmet = Helmet(
            requiredLevel: 1, 
            name: "Elmo de Pano", 
            critical: 1
        );
        let weapon = Weapon(
            requiredLevel: 1, 
            name: "Adaga", 
            extraDamage: 2
        );
        let breastplate = Breastplate(
            requiredLevel: 1, 
            name: "Colete Velho", 
            resistance: 1
        );
        let boot = Boot(
            requiredLevel: 1, 
            name: "Botas Furadas", 
            movementSpeed: 1
        );
        let greaves = Greaves(
            requiredLevel: 1, 
            name: "Caneleiras de Pano", 
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
            _level: 2,
            _life: 70,        
            _damage: 13,      
            _critical: 7,     
            _evasion: 2,      
            _resistance: 4,    
            _agility: 2     
        )

        let helmet = Helmet(
            requiredLevel: 1, 
            name: "Elmo de Ferro", 
            critical: 2
        );
        let weapon = Weapon(
            requiredLevel: 1, 
            name: "Machado", 
            extraDamage: 4
        );
        let breastplate = Breastplate(
            requiredLevel: 1, 
            name: "Armadura de Ferro", 
            resistance: 3
        );
        let boot = Boot(
            requiredLevel: 1, 
            name: "Botas de Couro Grosso", 
            movementSpeed: 1
        );
        let greaves = Greaves(
            requiredLevel: 1, 
            name: "Caneleiras de Ferro", 
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

    private func createSkeleton() -> Enemy {
        let characterData = CharacterData(
            _name: "Skeleton",
            _level: 2,
            _life: 28,      
            _damage: 10,     
            _critical: 22,     
            _evasion: 10,    
            _resistance: 0,    
            _agility: 8       
        )

        let helmet = Helmet(
            requiredLevel: 1, 
            name: "Crânio", 
            critical: 4
        );
        let weapon = Weapon(
            requiredLevel: 1, 
            name: "Espada Enferrujada", 
            extraDamage: 2
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

    private func createOgre() -> Enemy {
        let characterData = CharacterData(
            _name: "Ogre",
            _level: 3,
            _life: 130,        
            _damage: 17,       
            _critical: 6,     
            _evasion: 1,      
            _resistance: 9,    
            _agility: 1       
        )

        let helmet = Helmet(
            requiredLevel: 1, 
            name: "Elmo de Pedra", 
            critical: 2
        );
        let weapon = Weapon(
            requiredLevel: 1, 
            name: "Clava Gigante", 
            extraDamage: 7
        );
        let breastplate = Breastplate(
            requiredLevel: 1, 
            name: "Armadura de Pedra", 
            resistance: 5
        );
        let boot = Boot(
            requiredLevel: 1, 
            name: "Botas de Pedra", 
            movementSpeed: 0.5
        );
        let greaves = Greaves(
            requiredLevel: 1, 
            name: "Caneleiras de Pedra", 
            agility: 1
        );
        let equipmentData = EquipmentData(
            _helmet: helmet,
            _breastPlate: breastplate,
            _greaves: greaves,
            _boot: boot,
            _weapon: weapon
        );

        return Enemy(characterData: characterData, equipmentData: equipmentData)
    }
}