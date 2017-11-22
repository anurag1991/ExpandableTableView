//
//  ReplyHeaderView.swift
//  ExpandableTableView
//
//  Created by Anurag Yadav on 11/21/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import UIKit



class ReplyHeaderView: BaseTableViewHeader {
  //**** we can pass anything we want , that should be based on data type and model object ***//
  var data: Expandable?
  
  override func setNeedsUpdata(data: Expandable) {
    super.setNeedsUpdata(data: data)
  }
  
}
