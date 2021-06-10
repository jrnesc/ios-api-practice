//
//  ViewController.swift
//  brawlstars
//
//  Created by Jaron Escoffery on 09/06/2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        func getRequestCodeable() {
            let ids = 16000000...16000047
            
                for i in ids {
                    
                    let w = String(i)
                    let url = "https://api.brawlstars.com/v1/brawlers/\(w)"
                    
                            let header: HTTPHeaders = ["Accept":"application/json",
                                          "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjhlMWQ2NzhmLWM2MzItNDg4NS04M2FmLTI4MTcyYmUyYmIwNSIsImlhdCI6MTYyMzI1ODA0NSwic3ViIjoiZGV2ZWxvcGVyL2E1NDBlMGI2LTljMTEtNTI2NC1iYWJlLTlkN2YzM2RmYWYyNCIsInNjb3BlcyI6WyJicmF3bHN0YXJzIl0sImxpbWl0cyI6W3sidGllciI6ImRldmVsb3Blci9zaWx2ZXIiLCJ0eXBlIjoidGhyb3R0bGluZyJ9LHsiY2lkcnMiOlsiODkuMzYuNjguMjI5Il0sInR5cGUiOiJjbGllbnQifV19.2cRfdPhGI2py3UlNzEncjiAh7V399IIXYY-_qHJHUdjpvfPY-9ioTwuANBSPAKxzbCp5JXAV5b3dKDJPP-pSzA",
                            ]
                    
                    AF.request(URL(string: url)!, headers: header).responseDecodable(of: Items.self) {
                        (response) in guard let items = response.value else { return }

                        print("Name: \(items.name)")
                        print("Gadget 1: \(items.gadgets[0].name)")
                        print("Gadget 2: \(items.starPowers[0].name)")
                        print("StarPower: \(items.starPowers[1].name)")
                        
                    }
                }
        }
        getRequestCodeable()
    }
}
    

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
}

struct Gadgets: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}
