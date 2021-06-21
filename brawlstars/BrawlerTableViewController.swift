import UIKit
import Alamofire


class BrawlerListTableViewController: UITableViewController {
  
  var brawlStarsVM = BrawlStarsVM()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    BrawlStarsVM()
    brawlStarsVM.getRequestCodeable()
    
  }
  
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let rows = brawlStarsVM.indexBrawler.count
    return rows
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
  UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "BrawlerListCell", for: indexPath) as? BrawlerTableCell else {
      fatalError("unable to dequeue BrawlerTableCell")
    }
    
    let indexItems = brawlStarsVM.indexBrawler[indexPath.row]
    
    cell.nameLabel.text = indexItems.name
    cell.gadget1.text = indexItems.gadgets[0].name
    cell.starPower1.text = indexItems.starPowers[0].name
    return cell
  }
}

