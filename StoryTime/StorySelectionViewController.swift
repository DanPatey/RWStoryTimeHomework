//
//  StorySelectionViewController.swift
//  StoryTime
//
//  Created by Dan Patey on 4/19/17.
//  Copyright © 2017 Tammy Coron. All rights reserved.
//

import UIKit

class StorySelectionViewController: UITableViewController {
    
    var stories:[Array<String>] = [Array<String>]()
    var categoryNames:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryNames.append("Zombie Stories")
        categoryNames.append("Vampire Stories")
        categoryNames.append("Alien Stories")
        setupEmptyStories()
        
        stories[StoryType.zombies.rawValue]
            .append(Story(type: .zombies))
        stories[StoryType.vampires.rawValue].append(Story(type: .vampires))
        stories[StoryType.aliens.rawValue].append(Story(type: .aliens))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stories[section].count + 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTimeCell", for: indexPath)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "Add a Zombie Story"
        case 1:
            cell.textLabel?.text = "Add a Vampire Story"
        case 2:
            cell.textLabel?.text = "Add a Alien Story"
        default:
            break
        }

        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return categoryNames.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categoryNames[section]
    }
    
    fileprivate func setupEmptyStories() {
        stories.append([String]()) // zombie stories
        stories.append([String]()) // vampire stories
        stories.append([String]()) // alien stories
    }
}
