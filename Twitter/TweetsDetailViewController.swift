//
//  TweetsDetailViewController.swift
//  Twitter
//
//  Created by KaKin Chiu on 2/25/16.
//  Copyright © 2016 KaKinChiu. All rights reserved.
//

import UIKit

protocol TweetsFeedDelegate {
    func userDidFavoriteTweet(tweet: Tweet)//, index: Int)
    func userDidRetweetTweet(tweet: Tweet)//, index: Int)
}

class TweetsDetailViewController: UIViewController  {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userHandle: UILabel!
    @IBOutlet weak var tweetContentText: UILabel!
    @IBOutlet weak var createdTime: UILabel!
    @IBOutlet weak var replyImageView: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var favCountLabel: UILabel!
    var detailTweet: Tweet!
    //private var tweetdETAIL = [Tweet]()
    var replyID: Int?

    let userDefaults = NSUserDefaults.standardUserDefaults()
    var replyTo: String?

    
    var delegate: TweetsFeedDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        //var tweetID: String = ""
        
                tweetContentText.text = detailTweet.text
                userName.text = detailTweet.user!.name
                userHandle.text = "@\(detailTweet.user!.screenname!)"
                
                let imageUrl = detailTweet.user?.profileImageUrl!
                profileImage.setImageWithURL(NSURL(string: imageUrl!)!)
        
               // createdTime.text = calculateTimeStamp(tweet.createdAt!.timeIntervalSinceNow) //This is for the time to look nice
                
                
                //Add the retweet & favorite outlets + TweetID
                
                //tweetID = tweet.id
                retweetCountLabel.text = String(detailTweet.retweetCount!)
                favCountLabel.text = String(detailTweet.favCount!)
                
                retweetCountLabel.text! == "0" ? (retweetCountLabel.hidden = true) : (retweetCountLabel.hidden = false)
                favCountLabel.text! == "0" ? (favCountLabel.hidden = true) : (favCountLabel.hidden = false)
        
        userDefaults.setValue(replyTo, forKey: "detailReplyTo_Handle")

        

    }
    
    
    @IBAction func onRetweet(sender: AnyObject) {
        delegate?.userDidRetweetTweet(detailTweet!)//,index: 0)
        
        //retweetCountLabel.text = "\(detailTweet!.retweetCount! + 1)"
        //retweetButton.selected = true
        self.retweetCountLabel.text = String(self.detailTweet!.retweetCount! + 1)

    }
    

    @IBAction func onFav(sender: AnyObject) {
        //retweetCountLabel.text = "\(detailTweet!.retweetCount! + 1)"
        //retweetButton.selected = true
        self.favCountLabel.text = String(self.detailTweet!.favCount! + 1)

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



