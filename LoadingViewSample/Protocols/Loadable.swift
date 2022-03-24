//
//  Loadable.swift
//  LoadingViewSample
//
//  Created by Masato Takamura on 2022/03/25.
//

import UIKit

// 参考記事: https://david.y4ng.fr/simple-hud-with-swift-protocols/
// ローディング処理したいビューに準拠させて使用する

protocol Loadable {
    func showLoadingView()
    func hideLoadingView()
}

// UIViewControllerのローディングに使用できるエクステンション
extension Loadable where Self: UIViewController {
    func showLoadingView() {
        let loadingView = LoadingView()
        loadingView.tag = Constants.loadingViewTag
        view.addSubview(loadingView)

        loadingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingView.widthAnchor.constraint(equalToConstant: 100),
            loadingView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }

    func hideLoadingView() {
        view.subviews.forEach { subview in
            if subview.tag == Constants.loadingViewTag {
                subview.removeFromSuperview()
            }
        }
    }
}

private enum Constants {
    // loadingViewのtagによって、どのloadingViewかを判別している
    fileprivate static let loadingViewTag = 12345
}


// UIViewControllerで利用できるLoadingView
final class LoadingView: UIView {
    private let indicator = UIActivityIndicatorView(style: .large)

    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundColor = .black.withAlphaComponent(0.7)
        layer.cornerRadius = 10

        if indicator.superview == nil {
            addSubview(indicator)
            indicator.translatesAutoresizingMaskIntoConstraints = false
            indicator.color = .white
            NSLayoutConstraint.activate([
                indicator.centerXAnchor.constraint(equalTo: centerXAnchor),
                indicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            ])
            indicator.startAnimating()
        }
    }
}
