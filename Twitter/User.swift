//
//  User.swift
//  Twitter
//
//  Created by KaKin Chiu on 2/12/16.
//  Copyright © 2016 KaKinChiu. All rights reserved.
//

import UIKit
import BDBOAuth1Manager


var _currentUser: User?
let currentUserKey = "kCurrentUserKey"
let userDidLoginNotification = "userDidLoginNotification"
let userDidLogoutNotification = "userDidLogoutNotification"


class User: NSObject {
    var name: String?
    var screenname: String?
    var profileImageUrl: String?
    var tagline: String?
    var dictionary: NSDictionary
    var profileBannerURL: String?
    var location: String?
    var follower: Int?
    var following: Int?
    var meID: Int?
    var tweetcount: Int?

    
    init(dictionary: NSDictionary){
        self.dictionary = dictionary
        
        meID = dictionary["id"]! as? Int  //<-not sure about this string

        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        profileImageUrl = dictionary["profile_image_url"] as? String
        tagline = dictionary["description"] as? String
        
        if dictionary["profile_banner_url"] != nil {
            profileBannerURL = (dictionary["profile_banner_url"] as? String)!
        }
        
        location = dictionary["location"] as? String
        follower = dictionary["followers_count"] as? Int
        following = dictionary["friends_count"] as? Int
        tagline = dictionary["description"] as? String
        tweetcount = dictionary["statuses_count"] as? Int
        
    

    }
    //setting up the logout function
    func logout() {

        User.currentUser = nil
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        
        NSNotificationCenter.defaultCenter().postNotificationName(userDidLogoutNotification, object: nil)
            }
    
    class var currentUser: User? {
        get {
        if _currentUser == nil {
        let data = NSUserDefaults.standardUserDefaults().objectForKey(currentUserKey) as? NSData;
        if data != nil {
        do {
        let dictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions());
        _currentUser = User(dictionary: dictionary as! NSDictionary);
    } catch _ {
        
        }
        }
        }
        return _currentUser;
        }
        set(user) {
            _currentUser = user;
            
            if _currentUser != nil {
                do {
                    let data = try NSJSONSerialization.dataWithJSONObject(user!.dictionary, options: NSJSONWritingOptions());
                    NSUserDefaults.standardUserDefaults().setObject(data, forKey: currentUserKey);
                } catch _ {
                    
                }
            } else {
                NSUserDefaults.standardUserDefaults().setObject(nil, forKey: currentUserKey);
            }
            NSUserDefaults.standardUserDefaults().synchronize();
        }
    }
}
