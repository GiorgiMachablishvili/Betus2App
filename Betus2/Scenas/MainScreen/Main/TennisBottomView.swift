//
//  TennisBottomView.swift
//  Betus2
//
//  Created by Gio's Mac on 23.12.24.
//

import UIKit
import SnapKit

class TennisBottomView: UIView {

    private lazy var tennisBottomViewTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Daily tennis workout"
        view.textColor = UIColor(hexString: "#FFFFFF")
        view.font = UIFont.goldmanBold(size: 14)
        view.textAlignment = .left
        return view
    }()

    private lazy var tennisWorkoutDescription: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Daily tennis training: improve your coordination, form and skill on the court. Increase your reaction, strength and flexibility with every training session"
        view.textColor = UIColor(hexString: "#707070")
        view.font = UIFont.goldmanRegular(size: 12)
        view.numberOfLines = 0
        view.textAlignment = .left
        return view
    }()

    private lazy var timerImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "timer")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var tennisTimeLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "25 min"
        view.textColor = UIColor(hexString: "#FFFFFF")
        view.font = UIFont.goldmanBold(size: 14)
        view.textAlignment = .left
        return view
    }()

    private lazy var startButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Start", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        if let playImage = UIImage(named: "play") {
            let resizedImage = UIGraphicsImageRenderer(size: CGSize(width: 16, height: 16)).image { _ in
                playImage.draw(in: CGRect(origin: .zero, size: CGSize(width: 16, height: 16)))
            }
            view.setImage(resizedImage, for: .normal)
        }
        view.backgroundColor = UIColor(hexString: "#F73838")
        view.layer.cornerRadius = 22
        view.contentHorizontalAlignment = .center
        view.titleEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 30)
        view.imageEdgeInsets = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: -10)
        view.addTarget(self, action: #selector(clickStartButton), for: .touchUpInside)
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
        addSubview(tennisBottomViewTitle)
        addSubview(tennisWorkoutDescription)
        addSubview(timerImage)
        addSubview(tennisTimeLabel)
        addSubview(startButton)
    }

    private func setupConstraints() {
        tennisBottomViewTitle.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(16)
            make.leading.equalTo(snp.leading).offset(16)
            make.height.equalTo(17)
        }

        tennisWorkoutDescription.snp.remakeConstraints { make in
            make.top.equalTo(tennisBottomViewTitle.snp.bottom).offset(8)
            make.leading.equalTo(snp.leading).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        timerImage.snp.remakeConstraints { make in
            make.leading.equalTo(snp.leading).offset(16)
            make.bottom.equalTo(snp.bottom).offset(-29)
            make.height.width.equalTo(16)
        }

        tennisTimeLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(timerImage.snp.centerY)
            make.leading.equalTo(timerImage.snp.trailing).offset(4)
            make.height.equalTo(17)
        }

        startButton.snp.remakeConstraints { make in
            make.centerY.equalTo(timerImage.snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-16)
            make.height.equalTo(44)
            make.width.equalTo(87)
        }
    }

    @objc private func clickStartButton() {

    }
}
