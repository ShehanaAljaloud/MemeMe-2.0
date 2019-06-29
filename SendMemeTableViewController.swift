//
//  MemesTableViewController.swift
//  MemeMe 1.0
//
//  Created by Shehana Aljaloud on 15/05/2019.
//  Copyright © 2019 Shehana Aljaloud. All rights reserved.
//
//UITableViewController

import Foundation
import UIKit
class SendMemeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

   @IBOutlet var tableView: UITableView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if appDelegate.memes.count == 0 {
            showEmptyView(true)
        } else {
            showEmptyView(false)
        }
        return appDelegate.memes.count
    }
    
    func showEmptyView(_ show: Bool) {
        if show {
            let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height))
            label.numberOfLines = 2
            label.textAlignment = .center
            label.text = "There is no memes"
            tableView.separatorStyle = .none
            tableView.backgroundView = label
            navigationItem.leftBarButtonItem = nil
        } else {
            tableView.backgroundView = nil
            tableView.separatorStyle = .singleLine
            navigationItem.leftBarButtonItem = editButtonItem
        }
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SendMemeTableViewCell", for: indexPath) as! SendMemeTableViewCell
        let meme: Meme = appDelegate.memes[indexPath.row]
        cell.cellImageView.image = meme.memeImage
        cell.topTextLabel.text = meme.topText
        cell.bottomTextLabel.text = meme.bottomText
        return cell
    }
    
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            appDelegate.memes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailView: MemeDetailViewController = storyboard.instantiateViewController(withIdentifier: "detailView") as! MemeDetailViewController
        
        detailView.memeToShow = appDelegate.memes[indexPath.row]
        navigationController?.pushViewController(detailView, animated: true)
    }
    
  /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowMemeDetail" {
            if let cell = sender as? SendMemeTableViewCell {
                let detailView = segue.destination as? MemeDetailViewController
                detailView?.memeToShow = appDelegate.memes[(tableView.indexPath(for: cell)?.row)!]
            }
        }
    } */
}
