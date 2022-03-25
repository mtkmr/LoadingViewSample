//
//  LoadingViewController.swift
//  LoadingViewSample
//
//  Created by Masato Takamura on 2022/03/25.
//

import UIKit

// Loadingを表示するViewController
final class LoadingViewController: UIViewController {

    private var loadingActivityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.color = .blue
        indicator.hidesWhenStopped = true

        indicator.startAnimating()

        indicator.autoresizingMask = [
            .flexibleLeftMargin,
            .flexibleRightMargin,
            .flexibleTopMargin,
            .flexibleBottomMargin
        ]

        return indicator
    }()

    private var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)

        blurEffectView.alpha = 0.7

        blurEffectView.autoresizingMask = [
            .flexibleWidth,
            .flexibleHeight
        ]

        return blurEffectView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear

        blurEffectView.frame = view.bounds
        view.insertSubview(blurEffectView, at: 0)

        loadingActivityIndicator.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)

        view.addSubview(loadingActivityIndicator)

    }
}
