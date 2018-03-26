//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import TTTAttributedLabel
import AlamofireImage

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var atUser: UILabel!
    @IBOutlet weak var dateAdded: UILabel!
    @IBOutlet weak var retweets: TTTAttributedLabel!
    @IBOutlet weak var favorites: TTTAttributedLabel!
    
    var tweet: Tweet! {
        didSet {
            if tweet.user.aviUrl != nil {
                profilePic.af_setImage(withURL: tweet.user.aviUrl!)
            }
            tweetTextLabel.text = tweet.text
            userName.text = tweet.user.name
            atUser.text = String(format: "@%@", tweet.user.screenName!)
            dateAdded.text = tweet.createdAtString
            //retweets.text = tweet.retweetCount as! String
            //favorites.text = tweet.favoriteCount as! String
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
