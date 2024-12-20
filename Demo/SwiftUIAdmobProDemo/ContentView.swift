////
//ContentView.swift
//SwiftUIAdMobPro
//
//Created by Basel Baragabah on 16/12/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import SwiftUI
import SwiftUIAdmobPro

struct ContentView: View {
    @Environment(\.interstitialAdManager) var adManager

    var body: some View {
        VStack {
            Text("SwiftUIAdmobPro")
            
            BannerView(adUnitID: "ca-app-pub-3940256099942544/2435281174")
            .backgroundColor(.black)
            .onAdLoaded {
                print("Ad loaded successfully")
            }
            .onAdFailedToLoad { error in
                print("Ad failed to load: \(error)")
            }
            .onAdClicked {
                print("Ad clicked")
            }
            .onAdClosed {
                print("Ad closed")
            }

            
            VStack(spacing: 20) {
                
                Button(action: {
                    adManager?.showAd()  
                }) {
                    Text("Tap Me")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }

            }
        .onInterstitialAdLoaded { print("Interstitial loaded") }
        .onInterstitialAdFailedToLoad { error in print("Interstitial failed: \(error)") }
        .onInterstitialAdPresented { print("Interstitial presented") }
        .onInterstitialAdFailedToPresent { error in print("Presentation failed: \(error)") }
        .onInterstitialAdDismissed { print("Interstitial dismissed") }
         
        }
    }
    


#Preview {
    ContentView()
}
