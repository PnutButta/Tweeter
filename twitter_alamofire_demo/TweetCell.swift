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
    
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var retweetBtn: UIButton!
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
            favorites.text = String(format: "%d", tweet.favoriteCount!)
            retweets.text = String(tweet.retweetCount)

        }
    }
    @IBAction func didTapLike(_ sender: Any) {
        if (favBtn.isSelected) {
            print("fave selected")
        }
        if (favBtn.isHighlighted) {
            print("fave highlighted")
        }
        if (favBtn.isFocused) {
            print("fave focus")
        }
        if (!favBtn.isSelected) {
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                    self.favBtn.setBackgroundImage(#imageLiteral(resourceName: "favor-icon-red"), for: .highlighted)
                    tweet.favorited = true
                    tweet.favoriteCount = tweet.favoriteCount! + 1
                }
            }
            refreshData()
            
        } else {
            APIManager.shared.unfavorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unfavoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unfavorited the following Tweet: \n\(tweet.text)")
                    self.favBtn.setBackgroundImage(#imageLiteral(resourceName: "favor-icon"), for: .selected)
                    tweet.favorited = false
                    tweet.favoriteCount = tweet.favoriteCount! - 1
                }
            }
            refreshData()
        }
        
    }
    
    @IBAction func didTapRetweet(_ sender: Any) {
        if (!retweetBtn.isSelected) {
            APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error retweeting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully retweeted the following Tweet: \n\(tweet.text)")
                    self.retweetBtn.setBackgroundImage(#imageLiteral(resourceName: "retweet-icon-green"), for: .selected)
                    tweet.retweeted = true
                    tweet.retweetCount = tweet.retweetCount + 1
                }
            }
            refreshData()
            
        } else {
            APIManager.shared.unretweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unretweeting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unretweeted the following Tweet: \n\(tweet.text)")
                    self.retweetBtn.setBackgroundImage(#imageLiteral(resourceName: "retweet-icon"), for: .selected)
                    tweet.retweeted = false
                    tweet.retweetCount = tweet.retweetCount - 1
                }
            }
            refreshData()
        }
        
    }
    
    func refreshData() {
        favorites.text = String(format: "%d", tweet.favoriteCount!)
        retweets.text = String(tweet.retweetCount)
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
