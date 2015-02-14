//
//  Playlist.swift
//  Algorhythm
//
//  Created by Timothy Walsh on 2/7/15.
//  Copyright (c) 2015 com.ClassicTim. All rights reserved.
//

import Foundation
import UIKit

struct Playlist {
    
    var title: String?
    var description: String?
    var icon: UIImage?
    var largeIcon: UIImage?
    var artists: [String] = []
    var backgroundColor: UIColor = UIColor.clearColor()
    
    init(index: Int) {
        let musicLibrary = MusicLibary().library
        let playlistDictionary = musicLibrary[index]
        
        self.title = playlistDictionary["title"] as String!
        self.description = playlistDictionary["description"] as String!
        
        let iconName = playlistDictionary["icon"] as String! //we need to get back the name of the icon so we can then create the image based on that name
        self.icon = UIImage(named: iconName)
        
        let largeIconName = playlistDictionary["largeIcon"] as String!
        self.largeIcon = UIImage(named: largeIconName)
        
        self.artists += playlistDictionary["artists"] as [String] //array concatenation!!! Ho.Lee.Ballz
        
        let colorsDictionary = playlistDictionary["backgroundColor"] as [String: CGFloat] //casts the dictionary object as String: CGFloat (not sure why it doesn't need a !)
        
        self.backgroundColor = rgbColorFromDictionary(colorsDictionary)
        
    }
    
    func rgbColorFromDictionary(colorDictionary: [String: CGFloat]) -> UIColor {// we are passing in a dictionary with Strings as references for CGFloats and passing back a UIColor
        
        
        let red = colorDictionary["red"]!
        let green = colorDictionary["green"]!
        let blue = colorDictionary["blue"]!
        let alpha = colorDictionary["alpha"]!
        
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}