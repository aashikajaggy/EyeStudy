//
//  searchedItemViewController.swift
//  FirebaseAuth
//
//  Created by Aashika Jagadeesh on 6/27/20.
//

import UIKit
import FirebaseDatabase
import AVFoundation
import SafariServices
class searchedItemViewController: UIViewController {
    var databaseRef = Database.database().reference()
    var itemKey:String!
    let synthesizer = AVSpeechSynthesizer()
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var bioLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var rater: UILabel!
    
    var Index = 0
    var average = 0
    var ratings : [Int] = []
    var sum = 0
    var posts = [Post]()
    
      var countTaps1 = 0
      var countTaps2 = 0
      var countTaps3 = 0
      var countTaps4 = 0
      var countTaps5 = 0
      var ratingOutOf5 = 0
    
      
    @IBOutlet weak var heart1: UIButton!
    @IBOutlet weak var heart2: UIButton!
    @IBOutlet weak var heart3: UIButton!
    @IBOutlet weak var heart4: UIButton!
    @IBOutlet weak var heart5: UIButton!
    @IBAction func heart1Clicked(_ sender: Any) {
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
    
    @IBAction func heart2Clicked(_ sender: Any) {
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
    
    @IBAction func heart3Clicked(_ sender: Any) {
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

    @IBAction func heart4Clicked(_ sender: Any) {
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
    
    @IBAction func heart5Clicked(_ sender: Any) {
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
    
    @IBAction func postBtn(_ sender: Any) {
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
    
    func readPost () {
         let utterance1 = AVSpeechUtterance(string: (usernameLabel?.text)! + (bioLabel?.text)! + "posted " + (timeLabel?.text)! + (titleLabel?.text)! + (descriptionLabel?.text)!)
         synthesizer.speak(utterance1)
     }
    func getRating () {
            let rate = average
            self.ratingLabel?.text = "\(rate)/5 Rating"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.makeRounded()
        print("ITEM:\(itemKey ?? "Key not received")")
        var tempPost = [Post]()
        databaseRef.child("posts").child("\(itemKey ?? "")").observe(.value) { (snapshot) in
             if let dict = snapshot.value as? [String:Any],
                let author = dict["author"] as? [String:Any],
                let uid = author["uid"] as? String,
                let username = author["username"] as? String,
                let photoURL = author["photoURL"] as? String,
                let url = URL(string: photoURL),
                let description = dict["description"] as? String,
                let timestamp = dict["timeStamp"] as? Double,
                let link = dict["link"] as? String,
                let url1 = URL(string: link),
                let title = dict["title"] as? String{
                
                let userProfile = UserProfile(uid: uid, username: username, profileImage: url)
                let post = Post(id: self.itemKey, author: userProfile, title: title, text: description, link: url1, timestamp: timestamp)
                tempPost.insert(post, at: 0)
            
        }
            self.posts = tempPost
            self.set(post: self.posts)
        // Do any additional setup after loading the view.
    }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        tapGesture.numberOfTapsRequired = 2
        view.addGestureRecognizer(tapGesture)
    }
    var downloads = 0
   @objc func doubleTap () {
          let url = posts[Index].link
          let svc = SFSafariViewController(url: url)
          present(svc, animated: true, completion: nil)
          getDownloadsCount()
          print("OGDOWNLOADS:\(self.downloads)")
          downloads += 1
       databaseRef.child("posts").child("\(posts[Index].id)").child("Downloads").setValue(downloads)
   }
   func getDownloadsCount () {
       databaseRef.child("posts").child("\(posts[Index].id)").child("Downloads").observe(.value) { snapshot in
           self.downloads = snapshot.value as? Int ?? 0
        
       }
   }
    func set (post: [Post]) {
        print(post[0].author.profileImage)
        ImageService.getImage(withURL: post[0].author.profileImage) { image in
            self.profileImage.image = image
                
        }
            self.usernameLabel?.text = post[0].author.username
            self.titleLabel?.text = post[0].title
            self.descriptionLabel?.text = post[0].text
            self.timeLabel?.text = post[0].createdAt.calendarTimeSinceNow()
            fetchRatingsArray()
            self.readPost()
    }
        


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
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


