# SwiftUIAdmobPro

`SwiftUIAdmobPro` is a Swift package designed to integrate Google AdMob seamlessly with SwiftUI, making it feel as native as any other SwiftUI view or component. Unlike other libraries, `SwiftUIAdmobPro` provides a clean, SwiftUI-first API that makes managing AdMob banners and interstitial ads simple and efficient.

---


## Features

- Pure SwiftUI support for AdMob integration.
- Declarative modifiers for handling Ad events.
- Adaptive banner sizes and interstitial ads.
- Simple initialization and configuration.
- Easily extensible with callback support.

---

## Installation
### Using Swift Package Manager (SPM)
1. In Xcode, go to **File > Add Packages**.
2. Enter the repository URL: `https://github.com/X901/SwiftUIAdmobPro`.
3. Select the branch `main` to install the library.
4. Add it to your desired targets.

> **Note:** The AdMob SDK is already included in `SwiftUIAdmobPro`. You do not need to add it separately.

---

## Usage

### 1. Add App Identifier and SKAdNetworkIdentifier ro Info.plist

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>GADApplicationIdentifier</key>
    <string>admob-app-identifier</string> //start with ca-app-pub
    <key>SKAdNetworkItems</key>
    <array>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>cstr6suwn9.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>4fzdc2evr5.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>4pfyvq9l8r.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>2fnua5tdw4.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>ydx93a7ass.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>5a6flpkh64.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>p78axxw29g.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>v72qych5uu.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>ludvb6z3bs.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>cp8zw746q7.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>3sh42y64q3.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>c6k4g5qg8m.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>s39g8k73mm.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>3qy4746246.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>f38h382jlk.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>hs6bdukanm.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>v4nxqhlyqp.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>wzmmz9fp6w.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>yclnxrl5pm.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>t38b2kh725.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>7ug5zh24hu.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>gta9lk7p23.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>vutu7akeur.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>y5ghdn5j9k.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>n6fk4nfna4.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>v9wttpbfk9.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>n38lu8286q.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>47vhws6wlr.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>kbd757ywx3.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>9t245vhmpl.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>eh6m2bh4zr.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>a2p9lx4jpn.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>22mmun2rn5.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>4468km3ulz.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>2u9pt9hc89.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>8s468mfl3y.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>klf5c3l5u5.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>ppxm28t8ap.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>ecpz2srf59.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>uw77j35x4d.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>pwa73g5rt2.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>mlmmfzh3r3.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>578prtvx9j.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>4dzt52r2t5.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>e5fvkxwrpn.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>8c4e2ghe7u.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>zq492l623r.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>3rd42ekr43.skadnetwork</string>
      </dict>
      <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>3qcr597p9d.skadnetwork</string>
      </dict>
    </array>
</dict>
</plist>
```
> **Note:** Adding SKAdNetworkIdentifiers is required for proper ad attribution on iOS devices.



### 2. Initialize AdMob
Initialize AdMob when your app starts:

```swift
import SwiftUIAdmobPro

@main
struct MyApp: App {
    init() {
        AdMobInitializer.initialize()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### 3. Display a Banner Ad
Add a banner ad to your SwiftUI view:

```swift
import SwiftUIAdmobPro

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Welcome to SwiftUIAdmobPro")
                .font(.headline)
            
            BannerView(adUnitID: "ca-app-pub-3940256099942544/2435281174")
                .backgroundColor(.black)
                .onAdLoaded {
                    print("Banner Ad Loaded")
                }
                .onAdFailedToLoad { error in
                    print("Failed to load ad: \(error)")
                }
                .onAdClicked {
                    print("Ad Clicked")
                }
                .onAdClosed {
                    print("Ad Closed")
                }
        }
    }
}
```
> **Note:** Replace the test ad unit ID with your actual Banner Ad Unit ID.


## Banner Ad | Event Modifiers
- `.onAdLoaded` Triggered when the banner ad successfully loads.
- `.onAdFailedToLoad` Triggered when the banner ad fails to load.
- `.onAdClicked` Triggered when the ad is clicked.
- `.onAdClosed` Triggered when the ad is closed by the user

> **Note:** All event modifiers are optional.


### 4. Show Interstitial Ads

#### Step-by-Step Explanation
To show interstitial ads, the `InterstitialAdManager` must be available in the SwiftUI environment. You achieve this by applying the `.interstitialAd` modifier to a **parent view**. This modifier sets up the `InterstitialAdManager`, which child views can access via the `@Environment`.

#### Example Code
Here's an example of where to apply the `.interstitialAd` modifier and how to access it in child views:

```swift
import SwiftUI
import SwiftUIAdmobPro

@main
struct MyApp: App {
    init() {
        AdMobInitializer.initialize()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .interstitialAd(config: InterstitialAdConfig(adUnitID: "ca-app-pub-3940256099942544/4411468910"))
        }
    }
}
```
> **Note:** Replace test ads with your Interstitial adUnitID


### How to Display Interstitial Ads

To show an interstitial ad from within your SwiftUI view, use the @Environment property wrapper to retrieve the InterstitialAdManager. Then, call the showAd() method on the manager to present the ad.

Here’s an example of how to display interstitial ads:


```swift
struct ContentView: View {
    @Environment(\.interstitialAdManager) var adManager

    var body: some View {
        VStack {
            Text("SwiftUIAdmobPro")
   
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
```
> **Note:**  Environment Access: Use @Environment(\.interstitialAdManager) to retrieve the InterstitialAdManager in child views. This allows you to present ads by calling showAd() on the manager.


## Interstitial Ads | Event Modifiers

- `onInterstitialAdLoaded` Triggered when the interstitial ad successfully loads.
- `onInterstitialAdFailedToLoad`: Handles errors when loading the interstitial ad.
- `onInterstitialAdPresented` Triggered when the interstitial ad is displayed.
- `onInterstitialAdFailedToPresent` Handles errors when presenting the interstitial ad.
- `onInterstitialAdDismissed` Triggered when the interstitial ad is dismissed.
> **Note:** All event modifiers are optional.






