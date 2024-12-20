////
//InterstitialAd.swift
//SwiftUIAdMobPro
//
//Created by Basel Baragabah on 18/12/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import SwiftUI
import GoogleMobileAds

// MARK: - Interstitial Ad Config
public struct InterstitialAdConfig {
    public let adUnitID: String

    public init(adUnitID: String) {
        self.adUnitID = adUnitID
    }
}

// MARK: - Interstitial Ad Manager
@MainActor
public class InterstitialAdManager: NSObject, GADFullScreenContentDelegate, ObservableObject {
    private var interstitial: GADInterstitialAd?
    private let adUnitID: String
    
    @Published public var isAdReady = false
    @Published public var isLoading = false
    
    // Callbacks
    public var onAdLoaded: (() -> Void)?
    public var onAdFailedToLoad: ((Error) -> Void)?
    public var onAdPresented: (() -> Void)?
    public var onAdFailedToPresent: ((Error) -> Void)?
    public var onAdDismissed: (() -> Void)?
    
    public init(adUnitID: String) {
        self.adUnitID = adUnitID
        super.init()
        loadAd()
    }
    
    public func loadAd() {
        guard !isLoading else { return }
        isLoading = true
        GADInterstitialAd.load(withAdUnitID: adUnitID, request: GADRequest()) { [weak self] ad, error in
            Task { @MainActor in
                guard let self = self else { return }
                self.isLoading = false
                if let error = error {
                    self.isAdReady = false
                    self.onAdFailedToLoad?(error)
                    return
                }
                self.interstitial = ad
                self.interstitial?.fullScreenContentDelegate = self
                self.isAdReady = true
                self.onAdLoaded?()
            }
        }
    }
    
    public func showAd() {
        guard let rootViewController = UIWindowScene.keyWindow?.rootViewController else {
            print("No root view controller found to present ads.")
            return
        }
        if isAdReady, let ad = interstitial {
            ad.present(fromRootViewController: rootViewController)
        } else {
            print("Ad not ready, reloading...")
            loadAd()
        }
    }
    
    // MARK: - GADFullScreenContentDelegate
    nonisolated public func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        Task { @MainActor in
            self.isAdReady = false
            self.onAdPresented?()
        }
    }
    
    nonisolated public func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        Task { @MainActor in
            self.isAdReady = false
            self.onAdFailedToPresent?(error)
            self.loadAd()
        }
    }
    
    nonisolated public func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        Task { @MainActor in
            self.isAdReady = false
            self.onAdDismissed?()
            try? await Task.sleep(nanoseconds: 500_000_000) // 0.5 second
            self.loadAd()
        }
    }
}

// MARK: - Environment Key
public struct InterstitialAdManagerKey: EnvironmentKey {
    public static let defaultValue: InterstitialAdManager? = nil
}

public extension EnvironmentValues {
    var interstitialAdManager: InterstitialAdManager? {
        get { self[InterstitialAdManagerKey.self] }
        set { self[InterstitialAdManagerKey.self] = newValue }
    }
}

// MARK: - Interstitial Ad Modifier
public struct InterstitialAdViewModifier: ViewModifier {
    @StateObject private var adController: InterstitialAdManager
    
    public init(config: InterstitialAdConfig) {
        _adController = StateObject(wrappedValue: InterstitialAdManager(adUnitID: config.adUnitID))
    }
    
    public func body(content: Content) -> some View {
        content
            .environment(\.interstitialAdManager, adController)
    }
}

public extension View {
    func interstitialAd(config: InterstitialAdConfig) -> some View {
        modifier(InterstitialAdViewModifier(config: config))
    }
}

// MARK: - UIWindowScene Extension
public extension UIWindowScene {
    static var keyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first(where: { $0.activationState == .foregroundActive })?
            .windows
            .first(where: \.isKeyWindow)
    }
}

// MARK: - Callback Modifiers
public struct InterstitialAdLoadedModifier: ViewModifier {
    let action: () -> Void
    @Environment(\.interstitialAdManager) var adController
    
    public func body(content: Content) -> some View {
        content
            .onAppear {
                adController?.onAdLoaded = action
            }
    }
}

public struct InterstitialAdFailedToLoadModifier: ViewModifier {
    let action: (Error) -> Void
    @Environment(\.interstitialAdManager) var adController
    
    public func body(content: Content) -> some View {
        content
            .onAppear {
                adController?.onAdFailedToLoad = action
            }
    }
}

public struct InterstitialAdPresentedModifier: ViewModifier {
    let action: () -> Void
    @Environment(\.interstitialAdManager) var adController
    
    public func body(content: Content) -> some View {
        content
            .onAppear {
                adController?.onAdPresented = action
            }
    }
}

public struct InterstitialAdFailedToPresentModifier: ViewModifier {
    let action: (Error) -> Void
    @Environment(\.interstitialAdManager) var adController
    
    public func body(content: Content) -> some View {
        content
            .onAppear {
                adController?.onAdFailedToPresent = action
            }
    }
}

public struct InterstitialAdDismissedModifier: ViewModifier {
    let action: () -> Void
    @Environment(\.interstitialAdManager) var adController
    
    public func body(content: Content) -> some View {
        content
            .onAppear {
                adController?.onAdDismissed = action
            }
    }
}

// MARK: - Extensions for Callback Modifiers
public extension View {
    func onInterstitialAdLoaded(_ action: @escaping () -> Void) -> some View {
        modifier(InterstitialAdLoadedModifier(action: action))
    }
    
    func onInterstitialAdFailedToLoad(_ action: @escaping (Error) -> Void) -> some View {
        modifier(InterstitialAdFailedToLoadModifier(action: action))
    }
    
    func onInterstitialAdPresented(_ action: @escaping () -> Void) -> some View {
        modifier(InterstitialAdPresentedModifier(action: action))
    }
    
    func onInterstitialAdFailedToPresent(_ action: @escaping (Error) -> Void) -> some View {
        modifier(InterstitialAdFailedToPresentModifier(action: action))
    }
    
    func onInterstitialAdDismissed(_ action: @escaping () -> Void) -> some View {
        modifier(InterstitialAdDismissedModifier(action: action))
    }
}
