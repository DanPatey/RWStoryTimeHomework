//
//  Story.swift
//  StoryTime
//
//  Created by Dan Patey on 4/19/17.
//  Copyright © 2017 Tammy Coron. All rights reserved.
//

import Foundation

enum StoryType: Int {
    case zombies = 0, vampires, aliens
    static let genres = [zombies, vampires, aliens]
}

class Story {
    var title = "Untitled Story"
    var name: String?
    var verb: String?
    var number: Int?
    var type: StoryType
    var didWin = false
    
    var winStory = "<name> entered the room and saw <number> <monsters>! Without missing a beat,<name> <verb> all of the <monsters>! \n\nPoor <monsters>. Fantastic! \n\n<name> will live to fight another day."
    var loseStory = "<name> entered the room and saw <number> <monsters>!<name> ran down the hall. Sadly, <name> was <verb> by all the <monsters>! \n\nPoor <name>. Better luck next time!"
    
    init(type: StoryType) {
        self.type = type
        
        if type == .zombies {
            self.title = "Untitled Zombie Story"
        } else if type == .vampires {
            self.title = "Untitled Vampire Story"
        } else if type == .aliens {
            self.title = "Untitled Aliens Story"
        }
    }
    
    fileprivate func replaceText(_ text: String, withText: String, inString: String) -> String {
        return inString.replacingOccurrences(of: text, with: withText, options: NSString.CompareOptions.literal, range: nil)
    }
    
    func generateStory(_ monstersWin: Bool) -> String {
        var storyText = ""
        
        if monstersWin {
            storyText = winStory
        } else {
            storyText = loseStory
        }
        
        var monsters = "zombies"
        if type == .vampires {
            monsters = "vampires"
        } else if type == .aliens {
            monsters = "aliens"
        }
        
        if verb != nil {
            storyText = replaceText("<verb>", withText: verb!, inString: storyText)
        }
        if number != nil {
            storyText = replaceText("<number>", withText: String(number!), inString: storyText)
        }
        if name != nil {
            storyText = replaceText("<name>", withText: name!, inString: storyText)
        }
        storyText = replaceText("<monsters>", withText: monsters, inString: storyText)
        
        return storyText
    }
}
