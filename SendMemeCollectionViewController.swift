//
//  MemeCollectionViewController.swift
//  MemeMe 1.0
//
//  Created by Shehana Aljaloud on 11/05/2019.
//  Copyright © 2019 Shehana Aljaloud. All rights reserved.
//

import Foundation
import UIKit
private let reuseIdentifier = "CollectionViewCell"
class SendMemeCollectionViewController: UICollectionViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView?.reloadData()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if collectionView != nil {
            collectionView?.reloadData()
        }
    }
    
    func showEmptyView(_ show: Bool) {
        if show {
            let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: collectionView!.frame.width, height: collectionView!.frame.height))
            label.numberOfLines = 2
            label.textAlignment = .center
            label.text = "There is no memes"
            collectionView!.backgroundView = label
        } else {
            collectionView!.backgroundView = nil
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowMemeDetail" {
            if let cell = sender as? SendMemeCollectionViewCell {
                let detailView = segue.destination as! MemeDetailViewController
                detailView.memeToShow = appDelegate.memes[(collectionView?.indexPath(for: cell)?.row)!]
            }
            
        }}
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SendMemeCollectionViewCell
        let meme: Meme = appDelegate.memes[indexPath.row]
        cell.cellImageView!.image = meme.memeImage
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailView: MemeDetailViewController = storyboard.instantiateViewController(withIdentifier: "detailView") as! MemeDetailViewController
        
        detailView.memeToShow = appDelegate.memes[indexPath.row]
        navigationController?.pushViewController(detailView, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if appDelegate.memes.count == 0 {
            showEmptyView(true)
        } else {
            showEmptyView(false)
        }
        return appDelegate.memes.count
    }
}
