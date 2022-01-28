//
//  SafariViewController.swift
//  SafariAndWebViewTutorial
//
//  Created by detaysoft on 27.01.2022.
//

import UIKit
import SafariServices

class SafariViewController: UIViewController {

    @IBOutlet weak var showMeGoogleOutlet: UIButton!
    @IBOutlet weak var showMeWebViewOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func showMeGoogleButtonPressed(_ sender: UIButton) {
        if let url = URL(string: "https://www.google.com") {
            let safariViewController = SFSafariViewController(url: url)
            
            present(safariViewController, animated: true, completion: nil)
        }
    }
    @IBAction func showMeWebViewButtonPressed(_ sender: UIButton) {
    }
}

//Sadece buttonlarla oynamayı seviyorum :)
extension SafariViewController {
    override func viewDidAppear(_ animated: Bool) {
        //stil ve gölgeler ekleme
        showMeGoogleOutlet.layer.cornerRadius = 12
        showMeGoogleOutlet.setTitleShadowColor(.black, for: .normal)
        
        showMeWebViewOutlet.layer.cornerRadius = 12
        showMeWebViewOutlet.setTitleShadowColor(.black, for: .normal)
        
        //animasyon ekleme
        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
            self.showMeGoogleOutlet.center.y -= 555
            self.showMeGoogleOutlet.frame.size.width = 200
            
            self.showMeWebViewOutlet.center.y += 555
            self.showMeWebViewOutlet.frame.size.width = 200
        }
       //Görünüm her göründüğünde animasyonu başlatın.
        animator.startAnimation(afterDelay: 0.5)
    }
    
}
