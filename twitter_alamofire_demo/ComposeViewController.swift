//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Angel Chara'e Mitchell on 3/27/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

protocol ComposeViewControllerDelegate : class {
    func did(post: Tweet)
}

class ComposeViewController: UIViewController {

    weak var delegate : ComposeViewControllerDelegate?
    var aviString: String?
    @IBOutlet weak var avi: UIImageView!
    @IBOutlet weak var tweetField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if aviString != nil {
            let profileURL = URL(string: aviString!)
            avi.af_setImage(withURL: profileURL!)
        }
        
        // Do any additional setup after loading the view.
    }

    @IBAction func cancelTweet(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func postTweet(_ sender: Any) {
        APIManager.shared.composeTweet(with: tweetField.text) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
                self.dismiss(animated: true, completion: nil)
            }
        }
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
