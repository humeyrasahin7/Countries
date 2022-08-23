//
//  WikipediaViewController.swift
//  Countries
//
//  Created by Hümeyra Şahin on 22.08.2022.
//

import UIKit
import WebKit

class WikipediaViewController: UIViewController  {

    @IBOutlet weak var webView: WKWebView!
    
    lazy var wikiID = ""
    
    override func loadView() {
        
        let webConfig = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfig)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Wikipedia"
        let myURL = URL(string: "https://www.wikidata.org/wiki/\(wikiID)")
        let myReq = URLRequest(url: myURL!)

        webView.load(myReq)
    }
    

}

extension WikipediaViewController: WKUIDelegate, WKNavigationDelegate{
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let host = navigationAction.request.url?.absoluteString{
            if host.contains(wikiID){
                decisionHandler(.allow)
                return
            }
        }
        decisionHandler(.cancel)
    }
    
}
