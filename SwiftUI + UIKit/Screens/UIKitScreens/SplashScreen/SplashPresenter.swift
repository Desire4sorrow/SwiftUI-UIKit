//
//  SplashPresenter.swift
//  City Guide
//
//  Created by Omega on 11.08.2022.
//

import UIKit

protocol SplashPresenterDescription: AnyObject {
    func present()
    func dismiss(completion: @escaping () -> Void)
}

final class SplashPresenter: SplashPresenterDescription {
    func present() {
        animator.animateAppearance()
    }

    func dismiss(completion: @escaping () -> Void) {
        animator.animateDisappearance(completion: completion)
    }

    private lazy var animator: SplashAnimatorDescription = SplashAnimator(
        foregroundSplashWindow: foregroundSplashWindow,
        backgroundSplashWindow: backgroundSplashWindow
    )

    private lazy var foregroundSplashWindow: UIWindow = {
        let splashViewController = self.splashViewController(with: UIImage(named: "splash-icon"), logoIsHidden: false)
        let splashWindow = self.splashWindow(windowLevel: .normal + 1, rootViewController: splashViewController)

        backgroundSplashWindow.isHidden = false
        return splashWindow
    }()

    private lazy var backgroundSplashWindow: UIWindow = {
        let splashViewController = self.splashViewController(with: UIImage(named: "splash-icon"), logoIsHidden: true)
        let splashWindow = self.splashWindow(windowLevel: .normal - 1, rootViewController: splashViewController)

        return splashWindow
    }()

    private func splashWindow(windowLevel: UIWindow.Level, rootViewController: SplashScreenViewController?) -> UIWindow {
        let splashWindow = UIWindow(frame: UIScreen.main.bounds)

        splashWindow.windowLevel = windowLevel
        splashWindow.rootViewController = rootViewController

        return splashWindow
    }

    private func splashViewController(with _: UIImage?, logoIsHidden: Bool) -> SplashScreenViewController? {
        let storyboard = UIStoryboard(name: "SplashScreen", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SplashScreenViewController")

        let splashViewController = viewController as? SplashScreenViewController
        splashViewController?.logoIsHidden = logoIsHidden

        return splashViewController
    }
}
