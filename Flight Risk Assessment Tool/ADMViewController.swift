//
//  ADMViewController.swift
//  Flight Risk Assessment Tool
//
//  Created by Jim Hopp on 12/4/17.
//  Copyright © 2017 Jim Hopp. All rights reserved.
//

import UIKit
import WebKit

class ADMViewController: UIViewController, WKNavigationDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let wv = WKWebView(frame: view.bounds)
        wv.translatesAutoresizingMaskIntoConstraints = false
        let url = Bundle.main.url(forResource: "adminfo", withExtension: "html")!
        wv.loadFileURL(url, allowingReadAccessTo: url)
        wv.navigationDelegate = self
        view.addSubview(wv)
        
        NSLayoutConstraint.activate([wv.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     wv.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     wv.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
                                     wv.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor)])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .linkActivated {
            if let url = navigationAction.request.url {
                UIApplication.shared.openURL(url)
                decisionHandler(.cancel)
                return
            }
        }
        decisionHandler(.allow)
    }
}
