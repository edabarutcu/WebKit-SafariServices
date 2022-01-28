//
//  WebViewController.swift
//  SafariAndWebViewTutorial
//
//  Created by detaysoft on 27.01.2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
        let request = URLRequest(url: URL(string: "https://docs.github.com/en/github/site-policy/github-privacy-statement")!)
        webView.load(request)
    }
    @IBAction func dismissWebView(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func goBackPressed(_ sender: UIButton) {
        self.webView.stopLoading()
        self.webView.goBack()
    }
    @IBAction func goForwardPressed(_ sender: UIButton) {
        self.webView.stopLoading()
        self.webView.goForward()
    }
}
extension WebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let host = navigationAction.request.url?.host {
            if host.contains("docs.github.com") {
                decisionHandler(.allow)
                return
            }
        }
        decisionHandler(.cancel)
    }
}


