//
//  DataModel.swift
//  CWRUded
//
//  Created by Jacob Alspaw on 3/20/19.
//  Copyright © 2019 Jacob Alspaw. All rights reserved.
//

import Foundation

enum Type {
    case academic
    case dining
    case gym
}

struct Space {
    public let id: Int
    public let name: String
    public let capacity: Int
    
    private init(id: Int, name: String, capacity: Int) {
        self.id = id
        self.name = name
        self.capacity = capacity
    }
}

class Location {
    public let id: Int
    public let name: String
    public let type: Type
    public let spaces: [Space]
    
    init(id: Int, name: String, type: Type, spaces: [Space]) {
        self.id = id
        self.name = name
        self.type = type
        self.spaces = spaces
    }
}

class CrowdedData {
    public static let singleton: CrowdedData = CrowdedData();
    public private(set) var locations: [Location]
    
    private init() {
        locations = [Location]()
    }
    
    static func update() {
        singleton.locations.removeAll()
        let location1: Location = Location(id: 1, name: "loc_1", type: .academic, spaces: [Space]())
        let location2: Location = Location(id: 2, name: "loc_2", type: .academic, spaces: [Space]())
        let location3: Location = Location(id: 3, name: "loc_3", type: .academic, spaces: [Space]())
        let location4: Location = Location(id: 4, name: "loc_4", type: .academic, spaces: [Space]())
        singleton.locations.append(location1)
        singleton.locations.append(location2)
        singleton.locations.append(location3)
        singleton.locations.append(location4)
    }
}
