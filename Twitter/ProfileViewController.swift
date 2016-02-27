//
//  ProfileViewController.swift
//  Twitter
//
//  Created by KaKin Chiu on 2/26/16.
//  Copyright © 2016 KaKinChiu. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var handle: UILabel!
    @IBOutlet weak var numOfFollowing: UILabel!
    @IBOutlet weak var numOfFollowers: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    
    //var tweetsProfile: Tweet!  //data passed from DetailsViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        profileImage.setImageWithURL(NSURL(string: User.currentUser!.profileImageUrl!)!)
        userName.text = User.currentUser?.name
        handle.text = User.currentUser?.screenname
                    taglineLabel.text = User.currentUser?.tagline!
        if let followersdsdfs = User.currentUser?.follower!  {
            numOfFollowers.text = String(followersdsdfs)
        }else {
            numOfFollowers.text = "0"
        }
        
        if let flowingasdad = User.currentUser?.following!  {
            numOfFollowing.text = String(flowingasdad)
        }else {
            numOfFollowing.text = "0"
        }

        //getProfile()

        // Do any additional setup after loading the view.
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
