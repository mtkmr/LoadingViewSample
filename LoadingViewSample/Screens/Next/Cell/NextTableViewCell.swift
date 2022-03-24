//
//  NextTableViewCell.swift
//  LoadingViewSample
//
//  Created by Masato Takamura on 2022/03/25.
//

import UIKit

final class NextTableViewCell: UITableViewCell {
    static let className = String(describing: NextTableViewCell.self)

    private let thumbnailView = UIView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCell()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subtitleLabel.text = nil
    }

    private func setupCell() {
        // contentView
        contentView.backgroundColor = .white

        // thumbnailView
        thumbnailView.backgroundColor = .black
        thumbnailView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(thumbnailView)

        // titleLabel
        titleLabel.text = "タイトル"
        titleLabel.textColor = .black
        titleLabel.sizeToFit()
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)

        // subtitleLabel
        subtitleLabel.text = "サブタイトル"
        subtitleLabel.textColor = .gray
        subtitleLabel.sizeToFit()
        subtitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(subtitleLabel)

        // Auto Layout
        NSLayoutConstraint.activate([
            thumbnailView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            thumbnailView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            thumbnailView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            thumbnailView.widthAnchor.constraint(equalToConstant: 200),
            thumbnailView.heightAnchor.constraint(equalToConstant: 100),

            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: thumbnailView.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subtitleLabel.leadingAnchor.constraint(equalTo: thumbnailView.trailingAnchor, constant: 8),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}

// Cellに準拠させてインジケータを扱うこともできる
extension NextTableViewCell: Loadable {
    func showLoadingView() {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.color = .white
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        thumbnailView.addSubview(indicator)

        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: thumbnailView.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: thumbnailView.centerYAnchor),
        ])

        indicator.startAnimating()
    }

    func hideLoadingView() {
        thumbnailView.subviews.forEach { subView in
            subView.removeFromSuperview()
        }
    }
}
