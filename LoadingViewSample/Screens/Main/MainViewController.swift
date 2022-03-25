//
//  ViewController.swift
//  LoadingViewSample
//
//  Created by Masato Takamura on 2022/03/25.
//

import UIKit

final class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let vStackView = UIStackView()
        vStackView.axis = .vertical
        vStackView.distribution = .fillEqually
        vStackView.spacing = 16
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vStackView)

        let loading1Button = UIButton()
        loading1Button.setTitle("Loading1", for: .normal)
        loading1Button.setTitleColor(.red, for: .normal)
        loading1Button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        loading1Button.addTarget(self, action: #selector(tappedLoading1Button(_:)), for: .touchUpInside)
        loading1Button.translatesAutoresizingMaskIntoConstraints = false
        vStackView.addArrangedSubview(loading1Button)

        let loading2Button = UIButton()
        loading2Button.setTitle("Loading2", for: .normal)
        loading2Button.setTitleColor(.blue, for: .normal)
        loading2Button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        loading2Button.addTarget(self, action: #selector(tappedLoading2Button(_:)), for: .touchUpInside)
        loading2Button.translatesAutoresizingMaskIntoConstraints = false
        vStackView.addArrangedSubview(loading2Button)

        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            vStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            vStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }


    @objc private func tappedLoading1Button(_ sender: UIButton) {
        let loading1VC = Loading1ViewController()
        navigationController?.pushViewController(loading1VC, animated: true)
    }

    @objc private func tappedLoading2Button(_ sender: UIButton) {
        let loading2VC = Loading2ViewController()
        navigationController?.pushViewController(loading2VC, animated: true)
    }
}

