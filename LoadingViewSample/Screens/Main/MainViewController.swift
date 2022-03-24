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
        // view
        view.backgroundColor = .white

        // start button
        let startButton = UIButton()
        startButton.backgroundColor = .red
        startButton.setTitle("START", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.layer.cornerRadius = 10
        startButton.addTarget(self, action: #selector(tappedStartButton(_:)), for: .touchUpInside)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startButton)

        // stop button
        let stopButton = UIButton()
        stopButton.backgroundColor = .blue
        stopButton.setTitle("STOP", for: .normal)
        stopButton.setTitleColor(.white, for: .normal)
        stopButton.layer.cornerRadius = 10
        stopButton.addTarget(self, action: #selector(tappedStopButton(_:)), for: .touchUpInside)
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stopButton)

        // next button
        let nextButton = UIButton()
        nextButton.backgroundColor = .green
        nextButton.setTitle("STOP", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = 10
        nextButton.addTarget(self, action: #selector(tappedNextButton(_:)), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButton)

        // Auto Layout
        NSLayoutConstraint.activate([

            startButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 44),

            stopButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 44),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.widthAnchor.constraint(equalToConstant: 200),
            stopButton.heightAnchor.constraint(equalToConstant: 44),

            nextButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 44),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 44),

        ])
    }

    @objc private func tappedStartButton(_ sender: UIButton) {
        showLoadingView()
    }

    @objc private func tappedStopButton(_ sender: UIButton) {
        hideLoadingView()
    }

    @objc private func tappedNextButton(_ sender: UIButton) {
        let nextVC = NextTableViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }

}

//MARK: - Loadable
// 準拠させるだけでインジケータを表示/非表示できる
extension MainViewController: Loadable {}

