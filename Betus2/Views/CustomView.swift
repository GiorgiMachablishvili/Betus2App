//
//  SportView+Extention.swift
//  Betus2
//
//  Created by Gio's Mac on 27.12.24.
//

import UIKit
import SnapKit

class CustomWorkoutsView: UIView {
    static func createCustomView(
        imageName: String,
        titleText: String,
        pointText: String,
        titleFont: UIFont = UIFont.goldmanRegular(size: 14),
        pointFont: UIFont = UIFont.goldmanRegular(size: 14),
        textColor: UIColor = .whiteColor,
        contentMode: UIView.ContentMode = .scaleAspectFit
    ) -> UIView {
        let containerView = UIView(frame: .zero)

        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = contentMode
        containerView.addSubview(imageView)

        let titleLabel = UILabel(frame: .zero)
        titleLabel.text = titleText
        titleLabel.textColor = textColor
        titleLabel.font = titleFont
        titleLabel.textAlignment = .left
        containerView.addSubview(titleLabel)

        let pointLabel = UILabel(frame: .zero)
        pointLabel.text = pointText
        pointLabel.textColor = textColor
        pointLabel.font = pointFont
        pointLabel.textAlignment = .right
        pointLabel.tag = 1001
        containerView.addSubview(pointLabel)

        imageView.snp.remakeConstraints { make in
            make.centerY.equalTo(containerView.snp.centerY)
            make.leading.equalTo(containerView.snp.leading).offset(1 * Constraint.xCoeff)
            make.height.width.equalTo(16 * Constraint.yCoeff)
        }

        titleLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(imageView.snp.centerY)
            make.leading.equalTo(imageView.snp.trailing).offset(4 * Constraint.xCoeff)
            make.width.equalTo(100 * Constraint.xCoeff)
            make.height.equalTo(17 * Constraint.yCoeff)
        }

        pointLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(imageView.snp.centerY)
            make.trailing.equalTo(containerView.snp.trailing).offset(-1 * Constraint.xCoeff)
            make.height.equalTo(17 * Constraint.yCoeff)
        }

        return containerView
    }
}
