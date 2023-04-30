//
//  Pet.swift
//  Petgram
//
//  Created by Aaron Jacob on 4/24/23.
//

import Foundation
import ParseSwift

struct Pet: ParseObject {
    // These are required by `ParseObject`.
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    var name: String?
    var type: String?
    var species: String?
    var dateOfBirth: Date?
    var talentsAndAbilities: String?
    var location: String?
    var profilePhoto: ParseFile?
    var owner: String?
}
