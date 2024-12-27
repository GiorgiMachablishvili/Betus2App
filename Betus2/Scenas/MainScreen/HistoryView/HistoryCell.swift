//
//  HistoryCell.swift
//  Betus2
//
//  Created by Gio's Mac on 27.12.24.
//

import UIKit
import SnapKit

class HistoryCell: UICollectionViewCell {
    private lazy var backgroundHistoryView: UIView = {
        let view = UIView(frame: .zero)
        view.makeRoundCorners(32)
        view.backgroundColor = .topBottomViewColorGray
        return view
    }()

    private lazy var currentDay: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "27/12/2024"
        view.font = UIFont.goldmanBold(size: 16)
        view.textColor = .whiteColor
        return view
    }()

    private lazy var soccerView: UIView = {
        UIView.createCustomView(
            imageName: "soccer",
            titleText: "Soccer",
            pointText: "24",
            titleFont: UIFont.goldmanRegular(size: 14),
            pointFont: UIFont.goldmanRegular(size: 14),
            textColor: .white
        )
    }()

    private lazy var volleyballView: UIView = {
        UIView.createCustomView(
            imageName: "volleyball",
            titleText: "Volleyball",
            pointText: "27",
            titleFont: UIFont.goldmanRegular(size: 14),
            pointFont: UIFont.goldmanRegular(size: 14),
            textColor: .white
        )
    }()

    private lazy var basketballView: UIView = {
        UIView.createCustomView(
            imageName: "basketball",
            titleText: "Basketball",
            pointText: "32",
            titleFont: UIFont.goldmanRegular(size: 14),
            pointFont: UIFont.goldmanRegular(size: 14),
            textColor: .white
        )
    }()


    private lazy var tennisView: UIView = {
        UIView.createCustomView(
            imageName: "tennis",
            titleText: "Tennis",
            pointText: "20",
            titleFont: UIFont.goldmanRegular(size: 14),
            pointFont: UIFont.goldmanRegular(size: 14),
            textColor: .white
        )
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
        addSubview(backgroundHistoryView)
        backgroundHistoryView.addSubview(currentDay)
        backgroundHistoryView.addSubview(soccerView)
        backgroundHistoryView.addSubview(volleyballView)
        backgroundHistoryView.addSubview(basketballView)
        backgroundHistoryView.addSubview(tennisView)
    }

    private func setupConstraints() {
        backgroundHistoryView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }

        currentDay.snp.remakeConstraints { make in
            make.centerX.equalTo(backgroundHistoryView.snp.centerX)
            make.top.equalTo(backgroundHistoryView.snp.top).offset(16)
            make.height.equalTo(19)
        }

        soccerView.snp.remakeConstraints { make in
            make.top.equalTo(currentDay.snp.bottom).offset(16)
            make.leading.trailing.equalTo(16)
            make.height.equalTo(33)
        }

        volleyballView.snp.remakeConstraints { make in
            make.top.equalTo(soccerView.snp.bottom).offset(4)
            make.leading.trailing.equalTo(16)
            make.height.equalTo(33)
        }

        basketballView.snp.remakeConstraints { make in
            make.top.equalTo(volleyballView.snp.bottom).offset(4)
            make.leading.trailing.equalTo(16)
            make.height.equalTo(33)
        }

        tennisView.snp.remakeConstraints { make in
            make.top.equalTo(basketballView.snp.bottom).offset(4)
            make.leading.trailing.equalTo(16)
            make.height.equalTo(33)
        }
    }
}
