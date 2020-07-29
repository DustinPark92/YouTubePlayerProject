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


class ViewController: UIViewController  {
    @IBOutlet var plaryerView: WKYTPlayerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plaryerView.delegate = self
        //plaryerView.load(videoId: "N4IlPC34Syc")
        plaryerView.load(withVideoId: "N4IlPC34Syc")
        plaryerView.load(withVideoId: "N4IlPC34Syc", playerVars: ["playsinline":1])
        
        
    }


}


extension ViewController : WKYTPlayerViewDelegate {
    //키자마자 바로 시작하는거
    func playerViewDidBecomeReady(_ playerView: WKYTPlayerView) {
        playerView.playVideo()
    }
    
}
