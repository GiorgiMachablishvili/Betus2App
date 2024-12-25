//
//  TopView.swift
//  Betus2
//
//  Created by Gio's Mac on 23.12.24.
//

import UIKit
import SnapKit

class TopView: UIView {
    private lazy var topLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Consecutive days of "
        view.textColor = UIColor(hexString: "#FFFFFF")
        view.font = UIFont.goldmanRegular(size: 14)
        view.textAlignment = .left
        return view
    }()

    private lazy var sportLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "tennis"
        view.textColor = UIColor(hexString: "#F73838")
        view.font = UIFont.goldmanRegular(size: 14)
        view.textAlignment = .left
        return view
    }()

    private lazy var trainingLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "training"
        view.textColor = UIColor(hexString: "#FFFFFF")
        view.font = UIFont.goldmanRegular(size: 14)
        view.textAlignment = .left
        return view
    }()

    private lazy var rectangleImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "rectangle")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var historyButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "history"), for: .normal)
        view.backgroundColor = .clear
        view.layer.cornerRadius = 22
        view.addTarget(self, action: #selector(clickHistoryButton), for: .touchUpInside)
        return view
    }()

    private lazy var profileButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "profile"), for: .normal)
        view.backgroundColor = .clear
        view.layer.cornerRadius = 22
        view.addTarget(self, action: #selector(clickProfileButton), for: .touchUpInside)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(topLabel)
        addSubview(sportLabel)
        addSubview(trainingLabel)
        addSubview(rectangleImage)
        addSubview(historyButton)
        addSubview(profileButton)
    }

    private func setupConstraints() {
        topLabel.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(16)
            make.leading.equalTo(snp.leading).offset(16)
        }

        sportLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(topLabel.snp.centerY)
            make.leading.equalTo(topLabel.snp.trailing).offset(2)
        }

        trainingLabel.snp.remakeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(2)
            make.leading.equalTo(snp.leading).offset(16)
        }

        rectangleImage.snp.remakeConstraints { make in
            make.top.equalTo(trainingLabel.snp.bottom).offset(12)
            make.leading.equalTo(snp.leading).offset(16)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }

        profileButton.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(16)
            make.trailing.equalTo(snp.trailing).offset(-16)
            make.height.width.equalTo(32)
        }

        historyButton.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(16)
            make.trailing.equalTo(profileButton.snp.leading).offset(-8)
            make.height.width.equalTo(32)
        }


    }


    @objc private func clickHistoryButton() {

    }

    @objc private func clickProfileButton() {

    }

}
