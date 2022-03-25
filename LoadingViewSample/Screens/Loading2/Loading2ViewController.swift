//
//  Loading2ViewController.swift
//  LoadingViewSample
//
//  Created by Masato Takamura on 2022/03/25.
//

import UIKit

final class Loading2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // view
        view.backgroundColor = .white

        // show loading view
        Hud.show(self)

        // hide loading view
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            Hud.hide(self)
        }
    }
    
}
