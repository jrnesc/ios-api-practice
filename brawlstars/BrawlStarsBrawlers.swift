import Foundation

//Structs for handling JSON data

struct Items: Codable {
    let id: Int
    let name: String
    let gadgets, starPowers: [Gadgets]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case gadgets = "gadgets"
        case starPowers = "starPowers"
    }
  
  init(id: Int, name: String, gadgets: [Gadgets], starPowers: [Gadgets]){
    self.id = id
    self.name = name
    self.gadgets = gadgets
    self.starPowers = starPowers
  }
}

struct Gadgets: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
  
  init(id: Int, name: String){
    self.id = id
    self.name = name
  }

}


