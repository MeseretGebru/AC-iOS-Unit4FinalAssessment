//
//  UserDefaultHelper.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
class UserDefaultsHelper {
    private init() {}
    static let manager = UserDefaultsHelper()
    let nameKey = "lastSearch"
    func save(name: String) {
        UserDefaults.standard.setValue(name, forKey: nameKey)
    }
    func getLastSearch() -> String? {
        return UserDefaults.standard.object(forKey: nameKey) as? String
    }
}
