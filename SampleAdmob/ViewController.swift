//
//  ViewController.swift
//  SampleAdmob
//
//  Created by sreekanth reddy iragam reddy on 7/28/17.
//  Copyright © 2017 com.sree.objc. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {

    
    
    @IBOutlet weak var headerNativeExpressView: GADNativeExpressAdView!
    @IBOutlet weak var footerBanner: GADBannerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        var request = GADRequest()
        //footerBanner = GADBannerView(adSize: kGADAdSizeBanner)
        //footerBanner.adUnitID
        
        footerBanner.adUnitID = "ca-app-pub-3560502023831636/2961432199"
        footerBanner.rootViewController = self
        footerBanner.delegate = self
       
        request.testDevices = [kGADSimulatorID]
       
        footerBanner.load(request)
        //footerBanner.isHidden = true
        
        
        // Native Express Add
        headerNativeExpressView?.adUnitID = "ca-app-pub-3560502023831636/5806430849"
        headerNativeExpressView?.rootViewController = self
        headerNativeExpressView?.delegate = self
        //self.view.addSubview(adView!)
        //var request1 = GADRequest()
        //request = GADRequest()
        //request1.testDevices = [kGADSimulatorID]
        headerNativeExpressView?.load(GADRequest())
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: GADBannerViewDelegate {
    
    
    
    
    /// Tells the delegate an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("adViewDidReceiveAd")
        
        
        //footerBanner.isHidden = false
        
        footerBanner.transform = CGAffineTransform.init(translationX:0, y: self.view.frame.size.height+footerBanner.frame.size.height)
        //bannerView.isHidden = false
        UIView.animate(withDuration: 0.5, delay: 0, options:.curveEaseIn , animations: {
            self.footerBanner.transform = .identity
        }, completion:nil)
    }
    
    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
                didFailToReceiveAdWithError error: GADRequestError) {
        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
        footerBanner.isHidden = true
    }
    
    /// Tells the delegate that a full screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("adViewWillPresentScreen")
    }
    
    /// Tells the delegate that the full screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("adViewWillDismissScreen")
    }
    
    /// Tells the delegate that the full screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("adViewDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print("adViewWillLeaveApplication")
    }
}

extension ViewController: GADNativeExpressAdViewDelegate {
    
    func nativeExpressAdViewDidReceiveAd(_ nativeExpressAdView: GADNativeExpressAdView) {
        print("express add received")
    }
    
    func nativeExpressAdView(_ nativeExpressAdView: GADNativeExpressAdView, didFailToReceiveAdWithError error: GADRequestError) {
        print("express add Failed to received")
    }
}

