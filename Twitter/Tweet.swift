//
//  Tweet.swift
//  Twitter
//
//  Created by KaKin Chiu on 2/12/16.
//  Copyright © 2016 KaKinChiu. All rights reserved.
//

import UIKit
import BDBOAuth1Manager


class Tweet: NSObject {
    var user: User?
    var text: String?
    var createdAtString: String?
    var createdAt: NSDate?
    
    //For favCount and retweetCount
    var id: String
    var retweetCount: Int?
    var favCount: Int?
    
    init(dictionary: NSDictionary) {
        user = User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary["text"] as? String
        createdAtString = dictionary["created_at"] as? String
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        createdAt = formatter.dateFromString(createdAtString!)
        
        //For the favCount and retweetCount
        id = String(dictionary["id"]!)   //<-not sure about this string
        
        retweetCount = dictionary["retweet_count"] as? Int
        favCount = dictionary["favorite_count"] as? Int
        }

    
    class func tweetsWithArray(array: [NSDictionary]) ->[Tweet]{
        var tweets = [Tweet]()
        
        for dictionary in array {
            tweets.append(Tweet(dictionary: dictionary))
        }
        return tweets
    }
}
