//
//  ViewController.swift
//  Algorhythm
//
//  Created by Timothy Walsh on 2/7/15.
//  Copyright (c) 2015 com.ClassicTim. All rights reserved.
//

import UIKit

class PlaylistMasterViewController: UIViewController {

    
    var playlistsArray: [UIImageView] = []
    @IBOutlet weak var playlistImageView0: UIImageView!
    @IBOutlet weak var playlistImageView1: UIImageView!
    @IBOutlet weak var playlistImageView2: UIImageView!
    @IBOutlet weak var playlistImageView3: UIImageView!
    @IBOutlet weak var playlistImageView4: UIImageView!
    @IBOutlet weak var playlistImageView5: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playlistsArray += [playlistImageView0, playlistImageView1, playlistImageView2, playlistImageView3, playlistImageView4, playlistImageView5]
        
        for index in 0..<playlistsArray.count {
            let playlist = Playlist(index: index)
            let playlistImageView = playlistsArray[index]
            
            playlistImageView.image = playlist.icon
            playlistImageView.backgroundColor = playlist.backgroundColor
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPlaylistDetailSegue" {
            
            let playlistImageView = sender!.view as UIImageView //the index is programatically found by finding the index of the same item (the UIImageView), which was the sender, in an array that exists on this page.  They MUST be the SAME 
            if let index = find(playlistsArray, playlistImageView) {
                let playlistDetailController = segue.destinationViewController as PlaylistDetailViewController
                playlistDetailController.playlist = Playlist(index: index)
            }
            
            
            
        }
    }

    @IBAction func showPlaylistDetail(sender: AnyObject) {
    
        performSegueWithIdentifier("showPlaylistDetailSegue", sender: sender)

    }

}

