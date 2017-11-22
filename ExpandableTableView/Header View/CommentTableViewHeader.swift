//
//  CommentTableViewHeader.swift
//  ExpandableTableView
//
//  Created by Anurag Yadav on 11/21/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import UIKit


class CommentTableViewHeader: BaseTableViewHeader {
  var data: Expandable?
  //**** we can pass anything we want , that should be based on data type and model object
  override func setNeedsUpdata(data: Expandable) {
    super.setNeedsUpdata(data: data)
  }
}
