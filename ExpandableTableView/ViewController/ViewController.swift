//
//  ViewController.swift
//  ExpandableTableView
//
//  Created by Anurag Yadav on 11/21/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
  
  
  var showIndexPaths = false
  var isReply = false
  
  let presentHeight: CGFloat = 100
  let selectedHeight: CGFloat = 200
  
  //*** Temp data , please ignore this *** //
  var twoDimensionalArray = [
    Expandable(isExpanded: false, names: ["Amy", "Bill", "Zack", "Steve", "Jack", "Jill", "Mary"], isReply: false),
    Expandable(isExpanded: false, names: ["Carl", "Chris", "Christina", "Cameron"], isReply: false),
    Expandable(isExpanded: false, names: ["David", "Dan"], isReply: false),
    Expandable(isExpanded: false, names: ["Patrick", "Patty"], isReply: false),
    ]
  
  let headerId = "headerId"
  let headerReplyId = "headerReplyId"
  let cellId  = "cellId"
  
  @IBOutlet weak var postComment: UIButton!
  @IBOutlet weak var commentTextBox: UITextView!
  @IBOutlet weak var commentTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupTableView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Private Function
  
  private func setupTableView() {
    
    let commentHeaderViewNib = UINib(nibName: "CommentTableViewHeader", bundle: nil)
    let replyHeaderViewNib = UINib(nibName: "ReplyHeaderView", bundle: nil)
    let commentTableViewNib = UINib(nibName: "CommentTableViewCell", bundle: nil)
    
    commentTableView.register(commentHeaderViewNib, forHeaderFooterViewReuseIdentifier: headerId)
    commentTableView.register(replyHeaderViewNib, forHeaderFooterViewReuseIdentifier: headerReplyId)
    commentTableView.register(commentTableViewNib, forCellReuseIdentifier: cellId)
  }
  
  
  @objc func handleReply(button: UIButton){
    
    let isReply = twoDimensionalArray[button.tag].isReply
    twoDimensionalArray[button.tag].isReply = !isReply
    
    commentTableView.reloadSections(IndexSet(integer: button.tag), with: .none)
  }
  
  @objc func handleExpandClose(button: UIButton) {
    let section = button.tag
    var indexPaths = [IndexPath]()
    
    for row in twoDimensionalArray[section].names.indices {
      let indexPath = IndexPath(row: row, section: section)
      indexPaths.append(indexPath)
    }
    
    let isExpanded = twoDimensionalArray[section].isExpanded
    twoDimensionalArray[section].isExpanded = !isExpanded
    
    button.setTitle(isExpanded ? "Expand" : "Close", for: .normal)
    
    if isExpanded {
      commentTableView.deleteRows(at: indexPaths, with: .fade)
    } else {
      commentTableView.insertRows(at: indexPaths, with: .fade)
    }
  }
}

extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if !twoDimensionalArray[section].isExpanded {
      return 0
    }
    return twoDimensionalArray[section].names.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CommentTableViewCell
    cell.backgroundColor = UIColor.lightGray
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    
    if twoDimensionalArray[section].isReply {
      return selectedHeight
    }
    return presentHeight
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return twoDimensionalArray.count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return presentHeight
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
    let identifierTemp: String!
    
    if twoDimensionalArray[section].isReply {
      identifierTemp = headerReplyId
    }
    else{
      identifierTemp = headerId
    }
    
    let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifierTemp) as! BaseTableViewHeader
    cell.expandButton.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
    cell.expandButton.tag = section
    
    cell.replyButton.addTarget(self, action: #selector(handleReply), for: .touchUpInside)
    cell.replyButton.tag = section
    
    return cell
  }
}
