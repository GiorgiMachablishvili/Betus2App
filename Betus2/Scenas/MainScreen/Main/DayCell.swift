//
//  DayCell.swift
//  Betus2
//
//  Created by Gio's Mac on 26.12.24.
//

import UIKit
import SnapKit

class DayCell: UICollectionViewCell {

    private let dayLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.goldmanRegular(size: 10)
        view.textColor = .grayCalendarDayName
        view.textAlignment = .center
        return view
    }()

    private let pointView: UIView = {
        let view = UIView()
        view.makeRoundCorners(12)
        view.backgroundColor = .grayCalendarPoints
        return view
    }()

    private let redPoint: UIView = {
        let view = UIView()
        view.makeRoundCorners(4)
        view.backgroundColor = .clear
        view.backgroundColor = .redColor
        view.isHidden
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
        addSubview(dayLabel)
        addSubview(pointView)
        pointView.addSubview(redPoint)
    }

    private func setupConstraints() {
        dayLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.top.centerX.equalToSuperview()
            make.height.equalTo(12)
            make.width.equalTo(24)
        }

        pointView.snp.makeConstraints { make in
            make.top.equalTo(dayLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(24)
        }

        redPoint.snp.remakeConstraints { make in
            make.center.equalTo(pointView.snp.center)
            make.height.width.equalTo(8)
        }
    }

    func configure(dayName: String, isToday: Bool) {
        dayLabel.text = dayName
        dayLabel.textColor = isToday ? .red : .gray
        pointView.backgroundColor = .grayCalendarPoints
        redPoint.isHidden = !isToday
    }
}
