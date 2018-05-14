//
//  ListController.swift
//  test_push-noti
//
//  Created by Trinh Thai on 5/14/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import Foundation
import CloudKit



class ListController {
    
    
    static let shared = ListController()
    
    
    let cloudKitManager = CloudKitManager()
    
    var lists: [List] = [] {
        didSet {
            DispatchQueue.main.async {
                let nc = NotificationCenter.default
                nc.post(name: Keys.notification, object: self)
            }
        }
    }
    
    
    init() {
        refresh()
    }
    
    //B6: Save the subscription to the database.
    func add(listItemWithName name: String) {
        let item = List(item: name)
        saveUsingCloudKit(record: item.cloudKitRecord) { (error) in
            if error != nil {
                NSLog("Error saving item using CloudKit")
                return
            }
            self.lists.append(item)
        }
    }
    
    
    
    
    func refresh(completion: @escaping ((Error?) -> Void) = { _ in }) {
        cloudKitManager.fetchRecordsWithType(Keys.list, recordFetchedBlock: { (record) in
            guard let list = List(cloudKitRecord: record) else { return }
            self.lists.append(list)
        }) { (_, error) in
            if error != nil {
                NSLog("Error with refresh func")
            }
        }
    }
    
    //B5: Tạo đối tượng thông báo CloudKit.
    func subscribeToPushNotifications(completion: @escaping ((_ success: Bool, Error?) -> Void) = { _,_ in }) {
        
        let predicate = NSPredicate(value: true)
        
        cloudKitManager.subscribe(Keys.list, predicate: predicate, subscriptionID: "allLists", contentAvailable: true, alertBody: "New Shopping List Item", options: .firesOnRecordCreation) { (subscription, error) in
            let success = subscription != nil
            completion(success, error)
        }
    }
}


extension ListController {
    
    func saveUsingCloudKit(record: CKRecord, completion: @escaping (Error?) -> Void) {
        cloudKitManager.saveRecord(record) { (record, error) in
            completion(error)
        }
    }
    
    
}



















    

