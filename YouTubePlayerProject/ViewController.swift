//
//  ViewController.swift
//  YouTubePlayerProject
//
//  Created by Dustin on 2020/07/29.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit
import youtube_ios_player_helper_swift
import YoutubePlayer_in_WKWebView
import Alamofire
import SwiftyJSON


class ViewController: UIViewController  {
    @IBOutlet var plaryerView: WKYTPlayerView!
    
    @IBOutlet weak var playLabel: UILabel!
    @IBOutlet weak var subPlayLabel: UILabel!
    var videoTitle = "제목"
    var viewCount = 0
    var channelId = "Dustin"
    var duration = "기간"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plaryerView.delegate = self
        //plaryerView.load(videoId: "N4IlPC34Syc")
//        plaryerView.load(withVideoId: "St4CippvxTs")
        plaryerView.load(withVideoId: "St4CippvxTs", playerVars: ["playsinline":1])
        
        
        getYoutubeDetail()
        
    }
    
    func getYoutubeDetail() {
           
        let checkVersionURL = "https://www.googleapis.com/youtube/v3/videos?id=St4CippvxTs&key=\(appKey.googleApiKey)&part=snippet,contentDetails,statistics,status"
           
     
           
           AF.request(checkVersionURL, method: .get).validate().responseJSON { response in
           switch response.result {
               
               
           case .success(let value):
               let json = JSON(value)
               print(json)
          
               
               print(json["items"]["snippet"]["title"])
            
               
               for item in json["items"].arrayValue {
                    print(item["snippet"]["title"])
                self.playLabel.text = item["snippet"]["title"].stringValue
                self.channelId = item["snippet"]["channelTitle"].stringValue
                self.duration = item["contentDetails"]["dimension"].stringValue
                
                self.viewCount = item["statistics"]["viewCount"].intValue
                
                self.subPlayLabel.text
                    = "\(self.channelId) \(self.duration) 조회수 \(self.viewCount)"
                
                
                }
              
            
                
    
               case .failure(let error):
                    
                   print(error)
               }
                   
           }
        
        
           
       }


}






extension ViewController : WKYTPlayerViewDelegate {
    //키자마자 바로 시작하는거
    func playerViewDidBecomeReady(_ playerView: WKYTPlayerView) {
        playerView.playVideo()
    }
    
}
