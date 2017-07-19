//
//  ViewController.swift
//  mydvds
//
//  Created by Apple on 7/18/17.
//  Copyright © 2017 Jeremy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var dvds: [DVD] = []
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            dvds = try context.fetch(DVD.fetchRequest())
            tableView.reloadData()
        } catch {
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dvds.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let dvd = dvds[indexPath.row]
        cell.textLabel?.text = dvd.title!
        cell.imageView?.image = UIImage(data: dvd.image!)
        return cell
    }
    
    
}

