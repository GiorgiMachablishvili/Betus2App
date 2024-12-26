//
//  TrainingStaticView.swift
//  Betus2
//
//  Created by Gio's Mac on 26.12.24.
//

import UIKit
import SnapKit

class TrainingStaticView: UIView {

    var onBackButtonTap: (() -> Void)?

    private lazy var backButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "backArrow"), for: .normal)
        view.addTarget(self, action: #selector(pressBackButton), for: .touchUpInside)
        return view
    }()

    private lazy var trainingScoreTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Your training statistics"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 16)
        view.textAlignment = .center
        return view
    }()

    private lazy var soccerImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "soccer")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var soccerTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Soccer"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanRegular(size: 14)
        view.textAlignment = .left
        return view
    }()

    private lazy var soccerPointLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "24"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanRegular(size: 14)
        view.textAlignment = .center
        return view
    }()

    private lazy var soccerBottomLine: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .grayCalendarPoints
        return view
    }()

    private lazy var volleyballImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "volleyball")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var volleyballTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Volleyball"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanRegular(size: 14)
        view.textAlignment = .left
        return view
    }()

    private lazy var volleyballPointLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "24"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanRegular(size: 14)
        view.textAlignment = .left
        return view
    }()

    private lazy var volleyballBottomLine: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .grayCalendarPoints
        return view
    }()

    private lazy var basketballImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "basketball")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var basketballTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Basketball"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanRegular(size: 14)
        view.textAlignment = .left
        return view
    }()

    private lazy var basketballPointLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "24"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanRegular(size: 14)
        view.textAlignment = .center
        return view
    }()

    private lazy var basketballBottomLine: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .grayCalendarPoints
        return view
    }()

    private lazy var tennisImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "tennis")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var tennisTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Tennis"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanRegular(size: 14)
        view.textAlignment = .left
        return view
    }()

    private lazy var tennisPointLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "24"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanRegular(size: 14)
        view.textAlignment = .center
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
        addSubview(backButton)
        addSubview(trainingScoreTitle)
        addSubview(soccerImage)
        addSubview(soccerTitle)
        addSubview(soccerPointLabel)
        addSubview(soccerBottomLine)
        addSubview(volleyballImage)
        addSubview(volleyballTitle)
        addSubview(volleyballPointLabel)
        addSubview(volleyballBottomLine)
        addSubview(basketballImage)
        addSubview(basketballTitle)
        addSubview(basketballPointLabel)
        addSubview(basketballBottomLine)
        addSubview(tennisImage)
        addSubview(tennisTitle)
        addSubview(tennisPointLabel)
    }


    private func setupConstraints() {
        backButton.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(16)
            make.leading.equalTo(snp.leading).offset(16)
            make.height.width.equalTo(32)
        }

        trainingScoreTitle.snp.remakeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(4)
            make.height.width.equalTo(19)
            make.leading.trailing.equalToSuperview().inset(78)
        }

        soccerImage.snp.remakeConstraints { make in
            make.top.equalTo(trainingScoreTitle.snp.bottom).offset(24)
            make.leading.equalTo(snp.leading).offset(16)
            make.height.width.equalTo(16)
        }

        soccerTitle.snp.remakeConstraints { make in
            make.centerY.equalTo(soccerImage.snp.centerY)
            make.leading.equalTo(soccerImage.snp.trailing).offset(4)
            make.width.equalTo(100)
            make.height.equalTo(17)
        }

        soccerPointLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(soccerImage.snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-16)
            make.height.equalTo(17)
        }

        soccerBottomLine.snp.remakeConstraints { make in
            make.top.equalTo(soccerImage.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(1)
        }

        volleyballImage.snp.remakeConstraints { make in
            make.top.equalTo(soccerImage.snp.bottom).offset(24)
            make.leading.equalTo(snp.leading).offset(16)
            make.height.width.equalTo(16)
        }

        volleyballTitle.snp.remakeConstraints { make in
            make.centerY.equalTo(volleyballImage.snp.centerY)
            make.leading.equalTo(soccerImage.snp.trailing).offset(4)
            make.width.equalTo(100)
            make.height.equalTo(17)
        }

        volleyballPointLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(volleyballImage.snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-16)
            make.height.equalTo(17)
        }

        volleyballBottomLine.snp.remakeConstraints { make in
            make.top.equalTo(volleyballImage.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(1)
        }

        basketballImage.snp.remakeConstraints { make in
            make.top.equalTo(volleyballImage.snp.bottom).offset(24)
            make.leading.equalTo(snp.leading).offset(16)
            make.height.width.equalTo(16)
        }

        basketballTitle.snp.remakeConstraints { make in
            make.centerY.equalTo(basketballImage.snp.centerY)
            make.leading.equalTo(soccerImage.snp.trailing).offset(4)
            make.width.equalTo(100)
            make.height.equalTo(17)
        }

        basketballPointLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(basketballImage.snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-16)
            make.height.equalTo(17)
        }

        basketballBottomLine.snp.remakeConstraints { make in
            make.top.equalTo(basketballImage.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(1)
        }

        tennisImage.snp.remakeConstraints { make in
            make.top.equalTo(basketballImage.snp.bottom).offset(24)
            make.leading.equalTo(snp.leading).offset(16)
            make.height.width.equalTo(16)
        }

        tennisTitle.snp.remakeConstraints { make in
            make.centerY.equalTo(tennisImage.snp.centerY)
            make.leading.equalTo(soccerImage.snp.trailing).offset(4)
            make.width.equalTo(100)
            make.height.equalTo(17)
        }

        tennisPointLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(tennisImage.snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-16)
            make.height.equalTo(17)
        }


    }

    //TODO: press back button
    @objc func pressBackButton() {
        onBackButtonTap?()
    }
}
