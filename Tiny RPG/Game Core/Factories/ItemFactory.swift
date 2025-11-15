class ItemFactory {
    
    func createRandomWeapon() -> Weapon {
        let weapons = [
            ("Espada de Ferro", 5, 1),
            ("Machado de Guerra", 8, 2),
            ("Espada Élfica", 12, 3),
            ("Martelo do Trovão", 15, 4)
        ];
        
        let randomWeapon = weapons.randomElement() ?? ("Espada Básica", 3, 1);
        return Weapon(requiredLevel: randomWeapon.2, name: randomWeapon.0, extraDamage: Float(randomWeapon.1));
    }
    
    func createRandomHelmet() -> Helmet {
        let helmets = [
            ("Elmo de Couro", 2, 1),
            ("Elmo de Ferro", 5, 2),
            ("Elmo Élfico", 8, 3),
            ("Coroa do Rei", 12, 4)
        ];
        
        let randomHelmet = helmets.randomElement() ?? ("Elmo Básico", 1, 1);
        return Helmet(requiredLevel: randomHelmet.2, name: randomHelmet.0, critical: Float(randomHelmet.1));
    }
    
    func createRandomBreastplate() -> Breastplate {
        let breastplates = [
            ("Armadura de Couro", 3, 1),
            ("Armadura de Ferro", 6, 2),
            ("Armadura Élfica", 9, 3),
            ("Armadura Dracônica", 15, 4)
        ];
        
        let randomBreastplate = breastplates.randomElement() ?? ("Armadura Básica", 2, 1);
        return Breastplate(requiredLevel: randomBreastplate.2, name: randomBreastplate.0, resistance: Float(randomBreastplate.1));
    }
    
    func createRandomBoot() -> Boot {
        let boots = [
            ("Botas de Couro", 1, 1),
            ("Botas de Ferro", 3, 2),
            ("Botas Élficas", 5, 3),
            ("Botas do Vento", 8, 4)
        ];
        
        let randomBoot = boots.randomElement() ?? ("Botas Básicas", 1, 1);
        return Boot(requiredLevel: randomBoot.2, name: randomBoot.0, movementSpeed: Float(randomBoot.1));
    }
    
    func createRandomGreaves() -> Greaves {
        let greaves = [
            ("Caneleiras de Couro", 1, 1),
            ("Caneleiras de Ferro", 2, 2),
            ("Caneleiras Élficas", 4, 3),
            ("Caneleiras do Guerreiro", 6, 4)
        ];
        
        let randomGreaves = greaves.randomElement() ?? ("Caneleiras Básicas", 1, 1);
        return Greaves(requiredLevel: randomGreaves.2, name: randomGreaves.0, movementSpeed: Float(randomGreaves.1));
    }
}