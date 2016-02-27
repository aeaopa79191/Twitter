//
//  ReplyViewController.swift
//  Twitter
//
//  Created by KaKin Chiu on 2/26/16.
//  Copyright © 2016 KaKinChiu. All rights reserved.
//

import UIKit

class ReplyViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var replyTextField: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    var replyId: Int?
//    var replyHandle: String?
//    let userDefaults = NSUserDefaults.standardUserDefaults()
//
//    var placeholderLabel : UILabel!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        
//        replyHandle = userDefaults.stringForKey("detailReplyTo_Handle")
//        replyTextField!.text = replyHandle
//
//        
        
        replyTextField.becomeFirstResponder()
//        replyTextField.delegate = self

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

    func insertTwitterHandle(handle: String) {
        replyTextField.text = handle
        replyTextField.delegate?.textViewDidChange!(replyTextField)
    }
    
    
    @IBAction func onCancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    
    @IBAction func onSend(sender: AnyObject) {
//        if replyTextField.text!.isEmpty {
//            let alertController = UIAlertController(title: "Tweet Body Pissing", message: "You can't send an empty Bannanana!", preferredStyle: .Alert)
//            let acceptAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
//            alertController.addAction(acceptAction)
//            self.presentViewController(alertController, animated: true, completion: nil)
//        }
//        else {
//            TwitterClient.sharedInstance.postTweet(replyTextField.text!, replyId: replyId, completion: {(success, error) -> () in
//                if success != nil {
//                    self.dismissViewControllerAnimated(true, completion: nil)
//                }
//            })
//        }

        
        TwitterClient.sharedInstance.postTweet(replyTextField.text!, replyId: replyId, completion: {(success, error) -> () in
            if success != nil {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        })
        
    }
}
