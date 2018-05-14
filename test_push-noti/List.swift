//
//  List.swift
//  test_push-noti
//
//  Created by Trinh Thai on 5/15/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//



import Foundation
import CloudKit


//B4: Để tạo đối tượng và lưu đăng ký
class List {
    
    var item: String
    var identifier: String
    
    init(item: String, identifier: String = UUID().uuidString){
        self.item = item
        self.identifier = identifier
        
    }
}

extension List {
    
    convenience init?(cloudKitRecord: CKRecord) {
        let item = cloudKitRecord[Keys.item] as? String
        let identifier = cloudKitRecord.recordID.recordName
        self.init(item: item!, identifier: identifier)
    }
    
    var cloudKitRecord: CKRecord {
        let recordID = CKRecordID(recordName: identifier)
        let record = CKRecord(recordType: Keys.list, recordID: recordID)
        record[Keys.item] = item as CKRecordValue
        
        return record
    }
}






