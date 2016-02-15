//
//  TweetsViewController.swift
//  Twitter
//
//  Created by KaKin Chiu on 2/13/16.
//  Copyright © 2016 KaKinChiu. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tweets: [Tweet]?
    
    var refreshControl: UIRefreshControl!
    let delay = 3.0 * Double(NSEC_PER_SEC)
    
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        //adding the tableview
        tableView.delegate = self
        tableView.dataSource = self

        
        
        //here code for pull to refresh
        refreshControl = UIRefreshControl()
        tableView.addSubview(refreshControl)
        
        
        
        refreshControl.addTarget(self, action: "onRefresh", forControlEvents: UIControlEvents.ValueChanged)
        //ended code for pull to refresh
        
        //for the autolayout of the tableview row
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        
        
        tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
        TwitterClient.sharedInstance.homeTimelineWithParams(nil) { (tweets, error) -> () in
            self.tweets = tweets
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    //finishing pull to refresh
    func delay(delay:Double, closure:() -> ()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func onRefresh() {
        delay(1, closure: {
            self.refreshControl.endRefreshing()
        })
    }
     
     //finished pull to refresh
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //tvds (tableview data source implementation)
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tweets != nil {
            return tweets!.count
        } else {
            return 0
        }
    }
    
    
    
    /*
    func testTweets() {
    let tweet = tweets![0]
    print(tweet.user!.name)
    //print(tweet.retweetCount as! Int)
    //print(tweet.favCount as! Int)
    }
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetsCell", forIndexPath: indexPath) as! TweetsCell
        
        cell.tweet = tweets![indexPath.row]
                
        return cell
        
        
        
    }
    
    //tvds ends here
    
    
    
    
    
    
    
    
    @IBAction func onLogout(sender: AnyObject) {
        User.currentUser?.logout()
        
        //to add the segue from home to login
        //self.performSegueWithIdentifier("logoutSegue", sender: self)
        
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
