
import XCTest
@testable import brawlstars
import Alamofire


class brawlstarsTests: XCTestCase {
  
  var sut: BrawlerListTableViewController!
  var randomArray: [Items] = []
  
  override func setUpWithError() throws {
    
    try super.setUpWithError()
    sut = BrawlerListTableViewController()
    
  }
  
  
  override func tearDownWithError() throws {
    
    sut = nil
    try super.tearDownWithError()
  }
  
  
  func testIsDataAppended() {
    
    let expectation = XCTestExpectation(description: "GET data from API")
    
    let w = "16000000"
    let url = "https://api.brawlstars.com/v1/brawlers/\(w)"
    let header: HTTPHeaders = [
      "Accept":"application/json",
      "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjhlMWQ2NzhmLWM2MzItNDg4NS04M2FmLTI4MTcyYmUyYmIwNSIsImlhdCI6MTYyMzI1ODA0NSwic3ViIjoiZGV2ZWxvcGVyL2E1NDBlMGI2LTljMTEtNTI2NC1iYWJlLTlkN2YzM2RmYWYyNCIsInNjb3BlcyI6WyJicmF3bHN0YXJzIl0sImxpbWl0cyI6W3sidGllciI6ImRldmVsb3Blci9zaWx2ZXIiLCJ0eXBlIjoidGhyb3R0bGluZyJ9LHsiY2lkcnMiOlsiODkuMzYuNjguMjI5Il0sInR5cGUiOiJjbGllbnQifV19.2cRfdPhGI2py3UlNzEncjiAh7V399IIXYY-_qHJHUdjpvfPY-9ioTwuANBSPAKxzbCp5JXAV5b3dKDJPP-pSzA",
    ]
    
    let dataTask = AF.request(URL(string: url)!, headers: header).responseDecodable(of: Items.self) {
      response in guard let items = response.value else { return }
      
      self.randomArray.append(items)
      
      XCTAssertEqual(self.randomArray.isEmpty, false, "No data here mannnnnn")
      
      expectation.fulfill()
    }
    
    dataTask.resume()
    
    wait(for: [expectation], timeout: 10.0)
    
  }
}
