//
//  ShoppingListTableViewController.swift
//  test_push-noti
//
//  Created by Trinh Thai on 5/15/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import UIKit

class ShoppingListTableViewController: UITableViewController {
    
    //    @IBAction func refresh(_ sender: UIRefreshControl) {
    //        refreshControl?.beginRefreshing()
    //        fetchTasks()
    //        tableView.reloadData()
    //        refreshControl?.endRefreshing()
    //    }
    
    
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Item", message: "Please add an item to your shopping list.", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        var itemTextField: UITextField?
        
        alertController.addTextField { (textField) in
            itemTextField = textField
        }
        
        let addedAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let item = itemTextField?.text else { return }
            ListController.shared.add(listItemWithName: item)
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.fetchTasks()
            }
            
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(addedAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func fetchTasks() {
        ListController.shared.refresh()
    }
    
    
    @objc func refreshing() {
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//B8: Nhận nội dung thông báo + cập nhật lượt xem hoặc thông báo cho người dùng theo những thay đổi về bản ghi.
        fetchTasks()
        tableView.reloadData()
        
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(refreshing), name: Keys.notification, object: nil)
    }
    
    
    
    
    var lists = [List]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ListController.shared.lists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! ListTableViewCell
        let task = ListController.shared.lists[indexPath.row]
        cell.taskLabel.text = task.item
        
        return cell
    }
    
    
    
    
    
}
