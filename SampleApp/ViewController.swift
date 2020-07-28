//
//  ViewController.swift
//  SampleApp
//
//  Created by Roberto Oliveira da Silva Filho on 28/07/20.
//  Copyright © 2020 Roberto Oliveira da Silva Filho. All rights reserved.
//

import UIKit
import React
import SellingCartApp

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButton(_ sender: Any) {
        guard var bridge = RCTBridge(delegate: self, launchOptions: nil) else { return }
        var addRatingView = self.createReactView(bridge: bridge)
        self.view.addSubview(addRatingView)
        addRatingView.frame = self.view.bounds
    }
    
}

extension ViewController: RCTBridgeDelegate {
   public func sourceURL(for bridge: RCTBridge!) -> URL! {
     
    let bundle = Bundle(for: SellingCartApp.AppDelegate.self)
      return bundle.url(forResource: "index.ios", withExtension: "jsbundle")
    
    }
    func createReactView(bridge: RCTBridge) -> RCTRootView {
          return RCTRootView(bridge: bridge,
          moduleName: "SellingCartApp",
          initialProperties: nil)
    }
}

