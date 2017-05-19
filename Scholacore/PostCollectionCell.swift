//
//  PostCollectionCell.swift
//  Scholacore
//
//  Created by Tarun kaushik on 13/05/17.
//  Copyright © 2017 Tarun kaushik. All rights reserved.
//

import UIKit
import SDWebImage
import Reusable

protocol postAble {
    func setup(postInfo : Post)
}

protocol CellActionDelegate:class {
    func didTapedOnImageView(postImageView:UIImageView , View:UIView)
}
class PostCollectionCell: UICollectionViewCell,NibReusable,postAble {

    let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
    var currentView:UIViewController? = nil
    weak var delegate:CellActionDelegate?
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var timeOfPostingLabel: UILabel!
    @IBOutlet var userProfileImageView: UIImageView!
    @IBOutlet var postImageView: UIImageView! = { let imageView  = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target:self , action : #selector(PostCollectionCell.animation)))
        return imageView
    }()
  
    @IBOutlet var contentLabel: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        postImageView.isUserInteractionEnabled = true
        postImageView.addGestureRecognizer(UITapGestureRecognizer(target:self , action : #selector(self.animation)))
    }
    
    func animation(){
    let vc = storyboard.instantiateViewController(withIdentifier: "detailNav") as! UINavigationController
        let target = vc.topViewController as! DetailViewController
        target.postImage = self.postImageView.image
        currentView?.present(WithAnimation: vc)
    }
    
    func setup(postInfo: Post) {
        self.userNameLabel.text = postInfo.UserName
        self.timeOfPostingLabel.text = postInfo.Time
        self.contentLabel.text = postInfo.content
        if let imageURL = postInfo.postImageURL{
        self.postImageView.sd_setImage(with: URL(string: imageURL))
        }
    }
    
    
    
    
}
