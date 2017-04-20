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
    
    fileprivate func setupEmptyStories() {
        stories.append([String]()) // zombie stories
        stories.append([String]()) // vampire stories
        stories.append([String]()) // alien stories
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryNames.append("Zombie Stories")
        categoryNames.append("Vampire Stories")
        categoryNames.append("Alien Stories")
        
        setupEmptyStories()
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
