//
//  Passwords.swift
//  PasswordKeeperApp
//
//  Created by Juriy Panasevich on 10.10.15.
//  Copyright (c) 2015 Juriy Panasevich. All rights reserved.
//

import Foundation
import CoreData

class Passwords: NSManagedObject {
    @NSManaged var title: String!
    @NSManaged var value: String!
}