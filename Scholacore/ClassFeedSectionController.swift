//
//  ClassFeedSectionController.swift
//  Scholacore
//
//  Created by Tarun kaushik on 13/05/17.
//  Copyright © 2017 Tarun kaushik. All rights reserved.
//

import UIKit
import IGListKit
import Reusable
class ClassFeedSectionController: IGListSectionController {
    var post:Post?
    var firstFeed : UIViewController?
    override init() {
        super.init()
    }
}

extension ClassFeedSectionController:IGListSectionType{

    func numberOfItems() -> Int {
    return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width:(self.viewController?.view.frame.size.width)! , height:600)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(withNibName: PostCollectionCell.reuseIdentifier, bundle: Bundle.main, for: self, at: index) as! PostCollectionCell
        if let post = self.post{
        cell.setup(postInfo: post)
        }
        if let first = firstFeed as? FirstViewController{
            cell.delegate = first
        }else{
           cell.delegate = firstFeed as! ClassFeedViewController
        }
        cell.currentView = firstFeed
        return cell
    }
    
    func didSelectItem(at index: Int) {
        
    }
    
    func didUpdate(to object: Any) {
        post = object as? Post
    }

}
