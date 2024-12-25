//
//  WorkoutDescriptionTopView.swift
//  Betus2
//
//  Created by Gio's Mac on 25.12.24.
//

import UIKit
import SnapKit

class WorkoutDescriptionTopView: UIView {

    private lazy var workoutTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = ""
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 14)
        view.textAlignment = .left
        return view
    }()

    private lazy var workoutDescription: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = ""
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

    private lazy var sportTimeLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.attributedText = makeSportTimeAttributedText(timer: "25")
        view.textAlignment = .left
        return view
    }()

    private lazy var skipButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "skipButton"), for: .normal)
        view.contentMode = .scaleAspectFit
        view.addTarget(self, action: #selector(clickSkipButton), for: .touchUpInside)
        return view
    }()

    private func makeSportTimeAttributedText(timer: String) -> NSAttributedString {
        let text = "\(timer) min"
        let attributedString = NSMutableAttributedString(string: text)

        let numberRange = (text as NSString).range(of: timer)
        attributedString.addAttributes([
            .foregroundColor: UIColor.white,
            .font: UIFont.goldmanBold(size: 18)
        ], range: numberRange)

        let unitRange = (text as NSString).range(of: "min")
        attributedString.addAttributes([
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.goldmanRegular(size: 14)
        ], range: unitRange)

        return attributedString
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(workoutTitle)
        addSubview(workoutDescription)
        addSubview(timerImage)
        addSubview(sportTimeLabel)
        addSubview(skipButton)
    }


    private func setupConstraints() {
        workoutTitle.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(16)
            make.leading.equalTo(snp.leading).offset(16)
            make.height.equalTo(17)
        }

        workoutDescription.snp.remakeConstraints { make in
            make.top.equalTo(workoutTitle.snp.bottom).offset(8)
            make.leading.equalTo(snp.leading).offset(16)
        }

        timerImage.snp.remakeConstraints { make in
            make.leading.equalTo(snp.leading).offset(16)
            make.bottom.equalTo(snp.bottom).offset(-29)
            make.height.width.equalTo(16)
        }

        sportTimeLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(timerImage.snp.centerY)
            make.leading.equalTo(timerImage.snp.trailing).offset(4)
            make.height.equalTo(17)
        }

        skipButton.snp.remakeConstraints { make in
            make.centerY.equalTo(timerImage.snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-16)
            make.height.equalTo(44)
            make.width.equalTo(65)
        }
    }

    func configure(data: ViewInfo) {
        workoutTitle.text = data.title
        workoutDescription.text = data.description
        sportTimeLabel.attributedText = makeSportTimeAttributedText(timer: data.timer)
    }

    //TODO: ad skip function

    @objc private func clickSkipButton() {
        if let parentViewController = self.superview?.findViewController() as? WorkoutTimeView {
            parentViewController.skipStep()
        }
    }
}
