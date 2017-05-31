//
//  ViewController.swift
//  workingWithImageViews
//
//  Created by jose ramirez on 5/31/17.
//  Copyright © 2017 Jose Ramirez. All rights reserved.
//

import UIKit
import WebKit   // for using a webview you have to import WebKit

class ViewController: UIViewController {
    
    var webView:WKWebView!  // you have to instaniate it
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*here is where you intanciate the webview inside viewDidLoad, you delete the frames*/
        webView = WKWebView() // doing this I know im not relying on this for the frame size
        /*now we need to add it to the screen*/
        view.addSubview(webView)
        
        let url:URL = URL(string: "https://www.google.com")!
        //then we need a url request
        let req:URLRequest = URLRequest(url: url)
        //then all we do is tell the webView to load the request
        webView.load(req)
        
        /*The first thing we're going to do is call out that we're going to have auto
         layout override the frame of the web view. Now, the name of that property is,
         translates auto resizing mask into constraints. So if we set that to false,
         then what that says is, don't use the FRAME for the layout, use the auto layout constraints.*/
        
        //have to set to false in order for autolayout constraints to work.
        webView.translatesAutoresizingMaskIntoConstraints = false

        let width = NSLayoutConstraint(item: webView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0)
        
        let height = NSLayoutConstraint(item: webView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: -20)  //constant so that the bottom is up by that many points in this case is -20
        
        //so what if you want to bring down the layout 20 points or etc
        let top = NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 20)
        //So we actually need to add the constraints to our view, not the web view.
        
        view.addConstraints([width,height,top])
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

