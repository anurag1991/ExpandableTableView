//
//  BaseTableViewHeader.swift
//  ExpandableTableView
//
//  Created by Anurag Yadav on 11/21/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import UIKit

class BaseTableViewHeader: UITableViewHeaderFooterView {
  @IBOutlet weak var imagevIew: UIImageView!
  @IBOutlet weak var dummyNameLabel: UILabel!
  @IBOutlet weak var replyButton: UIButton!
  @IBOutlet weak var expandButton: UIButton!
  
  func setNeedsUpdata(data: Expandable)  {
    // *** Here we set the data based on model class , please ignore the temp. Expandable object ****//
    
  }

}
