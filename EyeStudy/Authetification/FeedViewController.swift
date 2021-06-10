//
//  FeedViewController.swift
//  dyzAR
//
//  Created by Aashika Jagadeesh on 5/28/20.
//  Copyright © 2020 Aashika Jagadeesh. All rights reserved.
//
import Foundation
import UIKit
import Firebase
import AVFoundation
import SafariServices
class FeedViewController: UIViewController {

    let synthesizer = AVSpeechSynthesizer()
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var bioField: UILabel!
    
    @IBOutlet weak var timeField: UILabel!
    
    @IBOutlet weak var titleField: UILabel!
    
    @IBOutlet weak var descriptionField: UILabel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var postsLength: UILabel!
    
    @IBOutlet weak var minutesAgo: UILabel!
    
    
    @IBOutlet weak var heart1: UIButton!
    @IBOutlet weak var heart2: UIButton!
    @IBOutlet weak var heart3: UIButton!
    @IBOutlet weak var heart4: UIButton!
    @IBOutlet weak var heart5: UIButton!
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var customLabel: UILabel!
    @IBOutlet weak var rater: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var countTaps1 = 0
   var countTaps2 = 0
   var countTaps3 = 0
   var countTaps4 = 0
   var countTaps5 = 0
   var ratingOutOf5 = 0
    @IBAction func heart1Clicked(_ sender: UIButton) {
       
        countTaps1 += 1
        print("taps: \(countTaps1)")
        if countTaps1 % 2 == 1 {
            heart1.setBackgroundImage(#imageLiteral(resourceName: "redHeart.png"), for: UIControl.State.normal)
             ratingOutOf5 = 1
        } else if countTaps1 % 2 == 0 {
            heart1.setBackgroundImage(#imageLiteral(resourceName: "noHeart.png"), for: UIControl.State.normal)
            ratingOutOf5 = 0
            
        }
       print("rating:\(ratingOutOf5)")
       rater?.text = String(ratingOutOf5)
    }

    @IBAction func heart2Clicked(_ sender: UIButton) {
        
        countTaps2 += 1
        print("taps: \(countTaps2)")
        if countTaps2 % 2 == 1 {
             heart2.setBackgroundImage(#imageLiteral(resourceName: "redHeart.png"), for: UIControl.State.normal)
             ratingOutOf5 = 2
        } else if countTaps2 % 2 == 0{
            heart2.setBackgroundImage(#imageLiteral(resourceName: "noHeart.png"), for: UIControl.State.normal)
            ratingOutOf5 = 1
            
        }
      print("rating: \(ratingOutOf5)")
        rater?.text = String(ratingOutOf5)
    }
    
    @IBAction func heart3Clicked(_ sender: UIButton) {
       
        countTaps3 += 1
        print("taps: \(countTaps3)")
        if countTaps3 % 2 == 1 {
                    heart3.setBackgroundImage(#imageLiteral(resourceName: "redHeart.png"), for: UIControl.State.normal)
                    ratingOutOf5 = 3
               } else if countTaps3 % 2 == 0{
                   heart3.setBackgroundImage(#imageLiteral(resourceName: "noHeart.png"), for: UIControl.State.normal)
                   ratingOutOf5 = 2
               }
    
      print("rating: \(ratingOutOf5)")
        rater?.text = String(ratingOutOf5)
    }
    
    @IBAction func heart4Clicked(_ sender: UIButton) {
        
        countTaps4 += 1
        print("taps: \(countTaps4)")
        if countTaps4 % 2 == 1 {
            heart4.setBackgroundImage(#imageLiteral(resourceName: "redHeart.png"), for: UIControl.State.normal)
            ratingOutOf5 = 4
        } else if countTaps4 % 2 == 0{
            heart4.setBackgroundImage(#imageLiteral(resourceName: "noHeart.png"), for: UIControl.State.normal)
            ratingOutOf5 = 3
        }
    
    print("rating: \(ratingOutOf5)")
        rater?.text = String(ratingOutOf5)
    }
    
    @IBAction func heart5Clicked(_ sender: UIButton) {
        
        countTaps5 += 1
        print("taps: \(countTaps5)")
        if countTaps5 % 2 == 1{
            heart5.setBackgroundImage(#imageLiteral(resourceName: "redHeart.png"), for: UIControl.State.normal)
            ratingOutOf5 = 5
        } else if countTaps5 % 2 == 0{
            heart5.setBackgroundImage(#imageLiteral(resourceName: "noHeart.png"), for: UIControl.State.normal)
            ratingOutOf5 = 4
                      }
    
         print("rating: \(ratingOutOf5)")
        rater?.text = String(ratingOutOf5)
    }
  
    var posts = [Post]()
    var post = [AnyObject?]()
    var loggedInUser : AnyObject?
    var loggedInUserData : AnyObject?
    let databaseRef = Database.database().reference()
    var Index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        self.loggedInUser = Auth.auth().currentUser
               let userID = Auth.auth().currentUser?.uid
               databaseRef.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
                 // Get user value
                   self.loggedInUserData = snapshot

                 // ...
                   self.databaseRef.child("posts/\(userID!)").observeSingleEvent(of: .childAdded, with: { (snapshot:DataSnapshot) in
                       self.post.append(snapshot)
                   })
                   
           
                 }) { (error) in
                   print(error.localizedDescription)
               }
 */
        //configure(profileImageView: "", username: self.loggedInUserData?.value["username"] as! String, title: <#T##String#>, description: <#T##String#>)
       
        //newBatch()
        
        //fetchRating(index: 0)
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate1(sender:)))
        view.addGestureRecognizer(rotate)
        profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
        profileImageView.clipsToBounds = true
         let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleLeftSwipe))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleRightSwipe))
        view.addGestureRecognizer(rightSwipe)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        tapGesture.numberOfTapsRequired = 2
        view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    var downloads = 0
    @objc func doubleTap () {
           let url = posts[Index].link
           let svc = SFSafariViewController(url: url)
           present(svc, animated: true, completion: nil)
           getDownloadsCount()
           downloads += 1
        databaseRef.child("posts").child("\(posts[Index].id)").child("Downloads").setValue(downloads)
    }
    func getDownloadsCount () {
        databaseRef.child("posts").child("\(posts[Index].id)").child("Downloads").observe(.value) { snapshot in
            self.downloads = snapshot.value as? Int ?? 0
        }
    }
    let rotorArray = ["Create Post", "Log Out", "Rate Post"]
    var indexer = 0
    @objc func handleRotate1 (sender:UIRotationGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            shadowView.isHidden = false
            customLabel.isHidden = false
            customLabel?.text = rotorArray[indexer]
        }else if sender.state == .ended {
            let utterance1 = AVSpeechUtterance(string: (customLabel?.text)!)
            synthesizer.speak(utterance1)
            if indexer == rotorArray.count - 1{
                indexer = 0
            } else {
                indexer += 1
             }
            if customLabel?.text == "Create Post" {
                performSegue(withIdentifier: "toCreate", sender: self)
            } else if customLabel?.text == "Log Out" {
                try! Auth.auth().signOut()
            }
        }
        
    }
   
    var postCount:UInt = 0
    var PostCount = 0


    func getPost() {

        databaseRef.child("posts").observe(.value, with: { (snapshot) in
            var tempPosts = [Post]()
            print("Snap:\(snapshot.value as Any)")
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                    let postDict = childSnapshot.value as? [String : Any],
                    let author = postDict["author"] as? [String:Any],
                    let uid = author["uid"] as? String,
                    let username = author["username"] as? String,
                    let title = postDict["title"] as? String,
                    let description = postDict["description"] as? String,
                    let link = postDict["link"] as? String,
                    let url = URL(string: link),
                    let timeStamp = postDict["timeStamp"] as? Double,
                    let photoURL = author["photoURL"] as? String,
                    let url1 = URL(string: photoURL){
                    
                    let userProfile = UserProfile(uid: uid, username: username, profileImage: url1)
                    let post = Post(id: childSnapshot.key, author: userProfile, title: title, text: description, link: url, timestamp: timeStamp)
                    
                    tempPosts.insert(post, at: 0)
                    
                    
                }
            }
        
            self.posts = tempPosts
            print("count: \(self.posts.count)")
            self.postsLength?.text = String(self.posts.count)
            self.set(post: self.posts, index: self.Index)
        
          // ...
        })
            
    }
    var ratings : [Int] = []
    var sum = 0
    @IBAction func postRating(_ sender: UIButton) {
        databaseRef.child("posts").child("\(posts[Index].id)").child("Rating").observe(.value) { (snapshot) in
            if let rate = snapshot.value as? Array<Int> {
                self.ratings = rate
            }
        }
        print("Ratings:\(ratings)")
        ratingOutOf5 = Int((rater?.text)!) ?? 0
        ratings.append(ratingOutOf5)
       
          databaseRef.child("posts").child("\(posts[Index].id)").child("Rating").setValue(ratings)
          
        
    }
    var average = 0
    func fetchRatingsArray () {
        databaseRef.child("posts").child("\(posts[Index].id)").child("Rating").observe(.value) { (snapshot) in
            print("SNAPSHOT:\(snapshot.value as Any)")
            if let rate = snapshot.value as? Array<Int> {
                self.ratings = rate
                self.sum = self.ratings.reduce(0,+)
                self.average = self.sum/self.ratings.count
                self.getRating()
            } else {
                self.ratingLabel?.text = "No rating"
            }
            
           
        }
        
    }
    func getRating () {
            let rate = average
            self.ratingLabel?.text = "\(rate)/5 Rating"
    }
    /*
    func observePosts () {
        let postsRef = Database.database().reference().child("posts")
        postsRef.observe(.value, with: { snapshot in
            var tempPosts = [Post]()
            for child in snapshot.children {
               
                if let childSnapshot = child as? DataSnapshot,
                    let dict = childSnapshot.value as? [String:Any],
                    let author = dict["author"] as? [String:Any],
                    let uid = author["uid"] as? String,
                    let username = author["username"] as? String,
                    let photoURL = author["photoURL"] as? String,
                    let url = URL(string:photoURL),
                    let text = dict["text"] as? String,
                    let bio = dict["bio"] as? String,
                    let timestamp = dict["timestamp"] as? Double,
                    let title = dict["title"] as? String,
                    let link = dict["link"] as? URL{
                    
                    let userProfile = UserProfile(uid: uid, username: username, photoURL: url)
                    let post = Post(id: Int(childSnapshot.key)!, author: userProfile, bio: bio, title: title, text: text, link: link, timestamp:timestamp)
                    tempPosts.append(post)
                }
                /*
                if let childSnapshot = child as? DataSnapshot
                    let dict = childSnapshot as? [String:Any],
                    let author = dict["author"] as? [String:Any],
                    let username = author["username"] as? String,
                    let uid = author["uid"] as? String,
                    let photoURL = author["photoURL"] as? String,
                    let url = URL(string:photoURL),
                    let title = dict["title"] as? String,
                    let description = dict["description"] as? String,
                    let timestamp = dict["timestamp"] as? Double,
                    let link = dict["link"] as? Double{
                    
                    let userProfile = UserProfile(uid: uid, username: username, photoURL: url)
                    let post = Post(id: childSnapshot.key, author: userProfile, bio: "", title: title, text: description, link: link, timestamp: timestamp)
                }
 */
                
            }
            self.posts = tempPosts
           
        })
    }
    */
    @IBAction func logOutBtn(_ sender: UIBarButtonItem) {
        try! Auth.auth().signOut()
    }

    @objc func handleLeftSwipe () {
        print("swiped l")
        if Index == (Int((postsLength?.text)!) ?? 0) - 1 {
            Index = 0
            print("You're all caught up!")
        } else {
            Index += 1
            
        }
        getPost()
        
    }
    @objc func handleRightSwipe () {
        print("swiped r")
        if Index > 0 {
            Index -= 1
            getPost()
        } else {
            let utterance = AVSpeechUtterance(string: "You cannot go back any longer.")
            synthesizer.speak(utterance)
        }
        
    }
    func readPost () {
        let utterance1 = AVSpeechUtterance(string: (usernameLabel?.text)! + (bioField?.text)! + "posted " + (timeField?.text)! + (titleField?.text)! + (descriptionField?.text)!)
        synthesizer.speak(utterance1)
    }

    var userID = Auth.auth().currentUser?.uid
    func set (post: [Post], index: Int) {
        if (post[index].author.uid != userID) {
            ImageService.getImage(withURL: post[index].author.profileImage) { image in
                self.profileImageView.image = image
                    
            }
                usernameLabel?.text = post[index].author.username
                titleField?.text = post[index].title
                descriptionField?.text = post[index].text
                minutesAgo?.text = post[index].createdAt.calendarTimeSinceNow()
                fetchRatingsArray()
                readPost()
        }
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
