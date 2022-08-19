//
//  SplashAnimator.swift
//  City Guide
//
//  Created by Omega on 11.08.2022.
//

import QuartzCore
import UIKit

protocol SplashAnimatorDescription: AnyObject {
    func animateAppearance()
    func animateDisappearance(completion: @escaping () -> Void)
}

final class SplashAnimator: SplashAnimatorDescription {

    private unowned let foregroundSplashWindow: UIWindow
    private unowned let foregroundSplashViewController: SplashScreenViewController

    private unowned let backgroundSplashWindow: UIWindow
    private unowned let backgroundSplashViewController: SplashScreenViewController

    init(foregroundSplashWindow: UIWindow, backgroundSplashWindow: UIWindow) {
        self.foregroundSplashWindow = foregroundSplashWindow
        self.backgroundSplashWindow = backgroundSplashWindow

        guard let foregroundSplashViewController = foregroundSplashWindow.rootViewController as? SplashScreenViewController else {
            fatalError("Splash window doesn't have splash root view controller!")
        }

        guard let backgroundSplashViewController = backgroundSplashWindow.rootViewController as? SplashScreenViewController else {
            fatalError("NO SPLASH")
        }

        self.foregroundSplashViewController = foregroundSplashViewController
        self.backgroundSplashViewController = backgroundSplashViewController
    }

    func animateAppearance() {
        foregroundSplashWindow.isHidden = false

        foregroundSplashViewController.guidLabel.transform = CGAffineTransform(translationX: 0, y: 20)
        UIView.animate(withDuration: 0.3, animations: {
            self.foregroundSplashViewController.logoImageView.transform = CGAffineTransform(scaleX: 88 / 72, y: 88 / 72)
            self.foregroundSplashViewController.guidLabel.transform = .identity
        })

        foregroundSplashViewController.guidLabel.alpha = 0
        UIView.animate(withDuration: 0.15, animations: {
            self.foregroundSplashViewController.guidLabel.alpha = 1
        })
    }

    func animateDisappearance(completion: @escaping () -> Void) {
        guard let window = UIApplication.shared.delegate?.window, let mainWindow = window else {
            fatalError("Application doesn't have a window!")
        }

        foregroundSplashWindow.alpha = 0

        let mask = CALayer()
        mask.frame = foregroundSplashViewController.logoImageView.frame
        mask.contents = SplashScreenViewController.logoImageBig.cgImage
        mainWindow.layer.mask = mask

        let maskBackgroundView = UIImageView(image: SplashScreenViewController.logoImageBig)
        maskBackgroundView.frame = mask.frame
        mainWindow.addSubview(maskBackgroundView)
        mainWindow.bringSubviewToFront(maskBackgroundView)

        CATransaction.setCompletionBlock {
            mainWindow.layer.mask = nil
            completion()
        }

        CATransaction.begin()

        mainWindow.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        UIView.animate(withDuration: 0.6, animations: {
            mainWindow.transform = .identity
        })

        [mask, maskBackgroundView.layer].forEach { layer in
            addScalingAnimation(to: layer, duration: 0.6)
            addRotationAnimation(to: layer, duration: 0.6)
        }

        UIView.animate(withDuration: 1, delay: 0.1, options: [], animations: {
            maskBackgroundView.alpha = 0
        }) { _ in
            maskBackgroundView.removeFromSuperview()
        }

        UIView.animate(withDuration: 0.3) {
            self.backgroundSplashViewController.logoImageView.alpha = 0
        }

        CATransaction.commit()
    }

    private func addRotationAnimation(to layer: CALayer, duration: TimeInterval, delay: CFTimeInterval = 0) {
        let animation = CABasicAnimation()

        let tangent = layer.position.y / layer.position.x
        let angle = -1 * atan(tangent)

        animation.beginTime = CACurrentMediaTime() + delay
        animation.duration = duration
        animation.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        animation.fromValue = 0
        animation.toValue = angle
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards

        layer.add(animation, forKey: "transform")
    }

    private func addScalingAnimation(to layer: CALayer, duration: TimeInterval, delay: CFTimeInterval = 0) {
        let animation = CAKeyframeAnimation(keyPath: "bounds")

        let width = layer.frame.size.width
        let height = layer.frame.size.height
        let coefficient: CGFloat = 18 / 667
        let finalScale = UIScreen.main.bounds.height * coefficient
        let scales = [1, 0.85, finalScale]

        animation.beginTime = CACurrentMediaTime() + delay
        animation.duration = duration
        animation.keyTimes = [0, 0.2, 1]
        animation.values = scales.map { NSValue(cgRect: CGRect(x: 0, y: 0, width: width * $0, height: height * $0)) }
        animation.timingFunctions = [
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        ]
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards

        layer.add(animation, forKey: "scaling")
    }
}
