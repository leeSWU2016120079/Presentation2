//
//  WeeklyTableViewController.swift
//  healthSchedule
//
//  Created by SWUCOMPUTER on 2018. 5. 30..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class WeeklyTableViewController: UITableViewController {
    
    var Monday: [NSManagedObject] = []
    var Tuesday: [NSManagedObject] = []
    var Wednesday: [NSManagedObject] = []
    var Thursday: [NSManagedObject] = []
    var Friday: [NSManagedObject] = []
    var Saturday: [NSManagedObject] = []
    var Sunday: [NSManagedObject] = []
    
    var week:[String] = ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"]

    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let context = self.getContext()
        let fetchRequest1 = NSFetchRequest<NSManagedObject>(entityName: "Mon")
        let fetchRequest2 = NSFetchRequest<NSManagedObject>(entityName: "Tue")
        let fetchRequest3 = NSFetchRequest<NSManagedObject>(entityName: "Wed")
        let fetchRequest4 = NSFetchRequest<NSManagedObject>(entityName: "Thur")
        let fetchRequest5 = NSFetchRequest<NSManagedObject>(entityName: "Fri")
        let fetchRequest6 = NSFetchRequest<NSManagedObject>(entityName: "Sat")
        let fetchRequest7 = NSFetchRequest<NSManagedObject>(entityName: "Sun")
        do {
            Monday = try context.fetch(fetchRequest1)
            Tuesday = try context.fetch(fetchRequest2)
            Wednesday = try context.fetch(fetchRequest3)
            Thursday = try context.fetch(fetchRequest4)
            Friday = try context.fetch(fetchRequest5)
            Saturday = try context.fetch(fetchRequest6)
            Sunday = try context.fetch(fetchRequest7)
        } catch let error as NSError {
            print("Could not fetch.  \(error),  \(error.userInfo)") }
        self.tableView.reloadData() }
    
    @IBAction func refreshBtn(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return week.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weekCell", for: indexPath)
        
        cell.textLabel?.text = week[indexPath.row]
        var prog :Int = 0
        var done :Int = 0
        switch week[indexPath.row] {
        case "Mon":
            if(Monday.count==0) {break}
            else {
                for i in 0...(Monday.count-1) {
                    let todo = Monday[i]
                    if (todo.value(forKey: "isDone") as? Bool)==true {
                        done = done+1
                    }
                }
                prog = Int(Float(Float(done)/Float(Monday.count))*100)
            }
            break
        case "Tue":
            if(Tuesday.count==0) {break}
            else {
                for i in 0...(Tuesday.count-1) {
                    let todo = Tuesday[i]
                    if (todo.value(forKey: "isDone") as? Bool)==true {
                        done = done+1
                    }
                }
                prog = Int(Float(Float(done)/Float(Tuesday.count))*100)
            }
            break
        case "Wed":
            if(Wednesday.count==0) {break}
            else {
                for i in 0...(Wednesday.count-1) {
                    let todo = Wednesday[i]
                    if (todo.value(forKey: "isDone") as? Bool)==true {
                        done = done+1
                    }
                }
                prog = Int(Float(Float(done)/Float(Wednesday.count))*100)
            }
            break
        case "Thur":
            if(Thursday.count==0) {break}
            else {
                for i in 0...(Thursday.count-1) {
                    let todo = Thursday[i]
                    if (todo.value(forKey: "isDone") as? Bool)==true {
                        done = done+1
                    }
                }
                prog = Int(Float(Float(done)/Float(Thursday.count))*100)
            }
            break
        case "Fri":
            if(Friday.count==0) {break}
            else {
                for i in 0...(Friday.count-1) {
                    let todo = Friday[i]
                    if (todo.value(forKey: "isDone") as? Bool)==true {
                        done = done+1
                    }
                }
                prog = Int(Float(Float(done)/Float(Friday.count))*100)
            }
            break
        case "Sat":
            if(Saturday.count==0) {break}
            else {
                for i in 0...(Saturday.count-1) {
                    let todo = Saturday[i]
                    if (todo.value(forKey: "isDone") as? Bool)==true {
                        done = done+1
                    }
                }
                prog = Int(Float(Float(done)/Float(Saturday.count))*100)
            }
            break
        case "Sun":
            if(Sunday.count==0) {break}
            else {
                for i in 0...(Sunday.count-1) {
                    let todo = Sunday[i]
                    if (todo.value(forKey: "isDone") as? Bool)==true {
                        done = done+1
                    }
                }
                prog = Int(Float(Float(done)/Float(Sunday.count))*100)
            }
            break
        default:
            prog = -1
        }
        
        cell.detailTextLabel?.text = "\(prog)%"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController. // Pass the selected object to the new view controller.
        if segue.identifier == "toDayView" {
            if let destination = segue.destination as? DayTableViewController {
                if let selectedIndex = self.tableView.indexPathsForSelectedRows?.first?.row {
                    destination.title = week[selectedIndex]
                    destination.entityName = week[selectedIndex] }
            } }
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
