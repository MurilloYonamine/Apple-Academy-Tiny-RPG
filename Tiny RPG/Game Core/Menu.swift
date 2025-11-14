//
//  Menu.swift
//  Tiny RPG
//
//  Created by MURILLO GOMES YONAMINE on 14/11/25.
//

class Menu {
    private var _options : Array<String>;
    private var _chosenOption : Int = 0;
    
    init(options: Array<String>, chosenOption: Int = 0) {
        self._options = options;
        
        showMenu(texts: _options)
        _chosenOption = Int(readLine() ?? "") ?? 0;
    }
    
    public func showMenu(texts : Array<String>) {
        var message : String = "";
        for text in texts {
            message = message + "\(text)\n"
        }
        print(message)
    }
    public func getChosenOption() -> Int {
        _chosenOption;
    }
}
