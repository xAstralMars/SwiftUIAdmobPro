////
//AdMobManager.swift
//SwiftUIAdmobPro
//
//Created by Basel Baragabah on 20/12/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//


import GoogleMobileAds

public class AdMobInitializer {
    public static func initialize(completion: ((GADInitializationStatus) -> Void)? = nil) {
        GADMobileAds.sharedInstance().start { status in
            print("AdMob SDK initialized with status: \(status.adapterStatusesByClassName)")
            completion?(status)
        }
    }
}
