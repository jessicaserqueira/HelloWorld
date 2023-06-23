//
//  File.swift
//  Features
//
//  Created by Jessica Serqueira on 21/06/23.
//

import Foundation

class StateUpdater {
    var updates: [() -> Void] = []
    
    func scheduleUpdate(_ update: @escaping () -> Void) {
        updates.append(update)
    }
    
    func applyUpdates() {
        for update in updates {
            update()
        }
        updates.removeAll()
    }
}
