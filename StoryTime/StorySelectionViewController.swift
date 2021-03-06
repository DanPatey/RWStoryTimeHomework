//
//  StorySelectionViewController.swift
//  StoryTime
//
//  Created by Dan Patey on 4/19/17.
//  Copyright © 2017 Tammy Coron. All rights reserved.
//

import UIKit

class StorySelectionViewController: UITableViewController {
    
    var stories:[Array<Story>] = [Array<Story>]()
    var categoryNames:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryNames.append("Zombie Stories")
        categoryNames.append("Vampire Stories")
        categoryNames.append("Alien Stories")
        setupEmptyStories()
        
        stories[StoryType.zombies.rawValue].append(Story(type: .zombies))
        stories[StoryType.vampires.rawValue].append(Story(type: .vampires))
        stories[StoryType.aliens.rawValue].append(Story(type: .aliens))
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return categoryNames.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories[section].count + 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categoryNames[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTimeCell", for: indexPath) as UITableViewCell
        
        if indexPath.row < stories[indexPath.section].count {
            cell.textLabel?.text = stories[indexPath.section][indexPath.row].title
        } else {
            switch indexPath.section {
            case 0:
                cell.textLabel?.text = "Add a Zombie Story"
            case 1:
                cell.textLabel?.text = "Add a Vampie Story"
            case 2:
                cell.textLabel?.text = "Add a Alien Story"
            default:
                break
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row >= stories[indexPath.section].count {
            guard let storyType = StoryType(rawValue: indexPath.section) else { return }
            let story = Story(type: storyType)
            stories[indexPath.section].append(story)
            
            let insertPoint = IndexPath(row: 0, section: indexPath.section)
            tableView.insertRows(at: [insertPoint], with: .automatic)
        }
    }
        
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if indexPath.row < stories[indexPath.section].count {
            return .delete
        } else {
            return .none
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.row < stories[indexPath.section].count {
            stories[indexPath.section].remove(at: indexPath.row)
            let indexPaths = [indexPath]
            tableView.deleteRows(at: indexPaths, with: .automatic)
        }
    }
    
    fileprivate func setupEmptyStories() {
        stories.append([Story]()) // zombie stories
        stories.append([Story]()) // vampire stories
        stories.append([Story]()) // alien stories
    }
    
}
