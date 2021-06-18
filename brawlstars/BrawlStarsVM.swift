import Foundation
import Alamofire


protocol ReloadDelegate : AnyObject
{
  func tableWasReloaded(_ items: [Items])
}


class TableReload: ReloadDelegate
{
  func tableWasReloaded(_ items: [Items]) {
    BrawlerListTableViewController().tableView.reloadData()
    print("success")
  }
}


class BrawlStarsVM {
  
  var indexBrawler: [Items] = []
  
  //GET Request
  func getRequestCodeable() {
    
    weak var delegate: ReloadDelegate?
    
    let ids = 16000000...16000047
    
    let myData = DispatchGroup()
    
    for i in ids where i != 16000033 {
      myData.enter()
      
      let w = String(i)
      let url = "https://api.brawlstars.com/v1/brawlers/\(w)"
      let header: HTTPHeaders = [
        "Accept":"application/json",
        "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjhlMWQ2NzhmLWM2MzItNDg4NS04M2FmLTI4MTcyYmUyYmIwNSIsImlhdCI6MTYyMzI1ODA0NSwic3ViIjoiZGV2ZWxvcGVyL2E1NDBlMGI2LTljMTEtNTI2NC1iYWJlLTlkN2YzM2RmYWYyNCIsInNjb3BlcyI6WyJicmF3bHN0YXJzIl0sImxpbWl0cyI6W3sidGllciI6ImRldmVsb3Blci9zaWx2ZXIiLCJ0eXBlIjoidGhyb3R0bGluZyJ9LHsiY2lkcnMiOlsiODkuMzYuNjguMjI5Il0sInR5cGUiOiJjbGllbnQifV19.2cRfdPhGI2py3UlNzEncjiAh7V399IIXYY-_qHJHUdjpvfPY-9ioTwuANBSPAKxzbCp5JXAV5b3dKDJPP-pSzA",
      ]
      
      AF.request(URL(string: url)!, headers: header).responseDecodable(of: Items.self) {
        response in guard let items = response.value else { return }
        self.indexBrawler.append(items)
        //utilise a delegate to handle the tableView.reloadData()
        //doesn't work
        delegate?.tableWasReloaded(self.indexBrawler)
        print("Finished request \(i)")
        myData.leave()
        
      }
    }
    
    myData.notify(queue: .main) {
      print("Finished all requests")
    }
    
  }
  
}
