//
//  ViewController.swift
//  CustomAppInBox
//
//  Created by Jay Mehta on 23/07/20.
//  Copyright © 2020 Jay Mehta. All rights reserved.
//

import UIKit
import CleverTapSDK
import SDWebImage
import SafariServices

class ViewController: UIViewController {
    
    @IBOutlet weak var appInBoxTableView: UITableView!
    
    var messages : [CleverTapInboxMessage] = [] {
        didSet{
            appInBoxTableView.delegate = self
            appInBoxTableView.dataSource = self
            appInBoxTableView.reloadData()
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        CleverTap.sharedInstance()?.recordEvent("Custom App Inbox")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initialiseAppInbox()
    }
    
    
    func setupUI() {
        self.title = "Notifications"
    }
    
    func initialiseAppInbox() {
        CleverTap.sharedInstance()?.initializeInbox(callback: { (success) in
            if success {
                self.getMessages()
            }
        })
    }
    
    func getMessages() {
        messages.removeAll()
        messages = (CleverTap.sharedInstance()?.getAllInboxMessages())!
    }
    
}

extension ViewController : UITableViewDelegate,UITableViewDataSource, SFSafariViewControllerDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let appCell = tableView.dequeueReusableCell(withIdentifier: "appCell") as! AppInBoxCell
        let messageContent : [CleverTapInboxMessageContent] = messages[indexPath.row].content!
        appCell.cellImageView.sd_setImage(with: URL(string: messageContent[0].mediaUrl!), completed: nil)
        appCell.titleLabel.text = messageContent[0].title!
        appCell.messageLabel.text = messageContent[0].message!
        return appCell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let messageContent : [CleverTapInboxMessageContent] = messages[indexPath.row].content!
        let urlString = messageContent[0].actionUrl!

        if let url = URL(string: urlString) {
            let vc = SFSafariViewController(url: url, configuration:.init())
            vc.delegate = self
            present(vc, animated: true)
        }
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true, completion: nil)
    }
    
}

class AppInBoxCell : UITableViewCell {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
}



/* Carousel Message Payload
 
 ▿ 1 element
   - 0 : {
     "_id" = "1593850752_1595479065";
     date = 1595479065;
     isRead = 0;
     msg =     {
         bg = "#ffffff";
         content =         (
                         {
                 action =                 {
                     hasLinks = 0;
                     hasUrl = 1;
                     links =                     (
                                                 {
                             bg = "#ffffff";
                             color = "#007bff";
                             copyText =                             {
                                 og = "";
                                 replacements = "";
                                 text = "";
                             };
                             kv =                             {
                             };
                             text = Link;
                             type = copy;
                             url =                             {
                                 android =                                 {
                                     og = "";
                                     replacements = "";
                                     text = "";
                                 };
                                 ios =                                 {
                                     og = "";
                                     replacements = "";
                                     text = "";
                                 };
                             };
                         }
                     );
                     url =                     {
                         android =                         {
                             og = "";
                             replacements = "";
                             text = "";
                         };
                         ios =                         {
                             defaultValuesSet =                             {
                                 strict = 1;
                                 value = 1;
                             };
                             df =                             {
                             };
                             key = "";
                             og = "https://clevertap.com/blog/clevertap-app-inbox/";
                             replacements = "https://clevertap.com/blog/clevertap-app-inbox/";
                             text = "https://clevertap.com/blog/clevertap-app-inbox/";
                         };
                     };
                 };
                 icon =                 {
                 };
                 key = 2789631036;
                 media =                 {
                     "content_type" = "image/jpeg";
                     key = 2f7927f27e2948cab069e72aa458cb5a;
                     poster = "";
                     processing = 0;
                     url = "https://db7hsdc8829us.cloudfront.net/dist/1579516160/i/2f7927f27e2948cab069e72aa458cb5a.jpeg?v=1593850653";
                 };
                 message =                 {
                     color = "#000000";
                     og = "";
                     replacements = "";
                     text = Message;
                 };
                 title =                 {
                     color = "#000000";
                     og = "";
                     replacements = "";
                     text = Title;
                 };
             },
                         {
                 action =                 {
                     hasLinks = 0;
                     hasUrl = 1;
                     links =                     (
                                                 {
                             bg = "#ffffff";
                             color = "#007bff";
                             copyText =                             {
                                 og = "";
                                 replacements = "";
                                 text = "";
                             };
                             kv =                             {
                             };
                             text = Link;
                             type = copy;
                             url =                             {
                                 android =                                 {
                                     og = "";
                                     replacements = "";
                                     text = "";
                                 };
                                 ios =                                 {
                                     og = "";
                                     replacements = "";
                                     text = "";
                                 };
                             };
                         }
                     );
                     url =                     {
                         android =                         {
                             og = "";
                             replacements = "";
                             text = "";
                         };
                         ios =                         {
                             defaultValuesSet =                             {
                                 strict = 1;
                                 value = 1;
                             };
                             df =                             {
                             };
                             key = "";
                             og = "https://clevertap.com/blog/recommendations-with-app-inbox/";
                             replacements = "https://clevertap.com/blog/recommendations-with-app-inbox/";
                             text = "https://clevertap.com/blog/recommendations-with-app-inbox/";
                         };
                     };
                 };
                 icon =                 {
                 };
                 key = 2647481367;
                 media =                 {
                     "content_type" = "image/jpeg";
                     key = f70c624bbbe34a78b5ae6882d1fb7db4;
                     poster = "";
                     processing = 0;
                     url = "https://db7hsdc8829us.cloudfront.net/dist/1579516160/i/f70c624bbbe34a78b5ae6882d1fb7db4.jpeg?v=1593850721";
                 };
                 message =                 {
                     color = "#000000";
                     og = "";
                     replacements = "";
                     text = Message;
                 };
                 title =                 {
                     color = "#000000";
                     og = "";
                     replacements = "";
                     text = Title;
                 };
             }
         );
         enableTags = 0;
         orientation = l;
         tags =         (
         );
         type = "carousel-image";
     };
     "wzrk_id" = "1593850752_20200723";
     "wzrk_pivot" = "wzrk_default";
     "wzrk_ttl" = 1596083865;
 }

 //Image With Message Payload
 
 ▿ 1 element
   - 0 : {
     "_id" = "1595481392_1595482041";
     date = 1595482041;
     isRead = 0;
     msg =     {
         bg = "#ffffff";
         content =         (
                         {
                 action =                 {
                     hasLinks = 0;
                     hasUrl = 1;
                     links =                     (
                                                 {
                             bg = "#ffffff";
                             color = "#007bff";
                             copyText =                             {
                                 og = "";
                                 replacements = "";
                                 text = "";
                             };
                             kv =                             {
                             };
                             text = Link;
                             type = copy;
                             url =                             {
                                 android =                                 {
                                     og = "";
                                     replacements = "";
                                     text = "";
                                 };
                                 ios =                                 {
                                     og = "";
                                     replacements = "";
                                     text = "";
                                 };
                             };
                         }
                     );
                     url =                     {
                         android =                         {
                             og = "";
                             replacements = "";
                             text = "";
                         };
                         ios =                         {
                             defaultValuesSet =                             {
                                 strict = 1;
                                 value = 1;
                             };
                             df =                             {
                             };
                             key = "";
                             og = "https://docs.clevertap.com/docs/app-inbox";
                             replacements = "https://docs.clevertap.com/docs/app-inbox";
                             text = "https://docs.clevertap.com/docs/app-inbox";
                         };
                     };
                 };
                 icon =                 {
                 };
                 key = 6686760955;
                 media =                 {
                     "content_type" = "image/jpeg";
                     key = 1983bf511e45477b89e0a7b0bb70b499;
                     poster = "";
                     processing = 0;
                     url = "https://db7hsdc8829us.cloudfront.net/dist/1579516160/i/1983bf511e45477b89e0a7b0bb70b499.jpeg?v=1595481367";
                 };
                 message =                 {
                     color = "#000000";
                     defaultValuesSet =                     {
                         strict = 1;
                         value = 1;
                     };
                     df =                     {
                     };
                     og = "App Inbox is a messaging channel that lets you deliver rich, individually customized content to your customers.";
                     replacements = "App Inbox is a messaging channel that lets you deliver rich, individually customized content to your customers.";
                     text = "App Inbox is a messaging channel that lets you deliver rich, individually customized content to your customers.";
                 };
                 title =                 {
                     color = "#000000";
                     defaultValuesSet =                     {
                         strict = 1;
                         value = 1;
                     };
                     df =                     {
                     };
                     og = "Custom App InBox";
                     replacements = "Custom App InBox";
                     text = "Custom App InBox";
                 };
             }
         );
         enableTags = 0;
         orientation = l;
         tags =         (
         );
         type = simple;
     };
     "wzrk_id" = "1595481392_20200723";
     "wzrk_pivot" = "wzrk_default";
     "wzrk_ttl" = 1596086841;
 }

 
 
 */
