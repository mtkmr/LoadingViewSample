//
//  Hud.swift
//  LoadingViewSample
//
//  Created by Masato Takamura on 2022/03/25.
//

import UIKit

// LoadingViewControllerを管理するクラス
enum Hud {

    private static let loadinVC = LoadingViewController()

    static func show(_ vc: UIViewController) {

        loadinVC.modalPresentationStyle = .overCurrentContext
        loadinVC.modalTransitionStyle = .crossDissolve
        DispatchQueue.main.async {
            vc.present(loadinVC, animated: true, completion: nil)
        }
    }

    static func hide(_ vc: UIViewController) {
        loadinVC.dismiss(animated: true, completion: nil)
    }

}
