//
//  Utility.swift
//  chic
//
//  Created by tester on 2017-04-23.
//  Copyright © 2017 OS-Tech. All rights reserved.
//
import Fakery
struct Utility {
    static var sharedInstance = Utility()
    static var faker = Faker()
    var loggedInUser: String?
    let deviceToken = "9876545678777"
    private init() {}
}
