//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Angel Chara'e Mitchell on 3/27/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import TTTAttributedLabel

class DetailViewController: UIViewController {

    var tweet: Tweet!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var atName: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var retweets: TTTAttributedLabel!
    @IBOutlet weak var favorites: TTTAttributedLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if tweet.user.aviUrl != nil {
            profilePic.af_setImage(withURL: tweet.user.aviUrl!)
        }
            tweetContent.text = tweet.text
            displayName.text = tweet.user.name
            atName.text = String(format: "@%@", tweet.user.screenName!)
            favorites.text = String(format: "%d", tweet.favoriteCount!)
            retweets.text = String(tweet.retweetCount)
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
