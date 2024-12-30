//
//  SubscriptionBenefitsView.swift
//  Betus2
//
//  Created by Gio's Mac on 30.12.24.
//

import UIKit
import SnapKit

class SubscriptionBenefitsView: UIView {

    private lazy var fullAccessLabel: UILabel = {
        let view = UILabel()
        let attributedText = NSMutableAttributedString()
        let crownImage = UIImage(named: "crown")?.withRenderingMode(.alwaysOriginal)
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = crownImage
        imageAttachment.image?.withTintColor(.whiteColor)
        imageAttachment.bounds = CGRect(x: 0, y: -2, width: 19, height: 19)
        let imageString = NSAttributedString(attachment: imageAttachment)
        attributedText.append(imageString)
        let textString = NSAttributedString(string: "   Full access to content", attributes: [
            .font: UIFont.goldmanRegular(size: 14),
            .foregroundColor: UIColor.whiteColor
        ])
        attributedText.append(textString)
        view.attributedText = attributedText
        view.textAlignment = .center
        return view
    }()

    private lazy var firstToKnowLabel: UILabel = {
        let view = UILabel()
        let attributedText = NSMutableAttributedString()
        let crownImage = UIImage(named: "crown")?.withRenderingMode(.alwaysOriginal)
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = crownImage
        imageAttachment.image?.withTintColor(.whiteColor)
        imageAttachment.bounds = CGRect(x: 0, y: -2, width: 19, height: 19)
        let imageString = NSAttributedString(attachment: imageAttachment)
        attributedText.append(imageString)
        let textString = NSAttributedString(string: "   Be the first to know about new features ", attributes: [
            .font: UIFont.goldmanRegular(size: 14),
            .foregroundColor: UIColor.whiteColor
        ])
        attributedText.append(textString)
        view.attributedText = attributedText
        view.textAlignment = .center
        return view
    }()

    private lazy var getNewFeaturesFirstLabel: UILabel = {
        let view = UILabel()
        let attributedText = NSMutableAttributedString()
        let crownImage = UIImage(named: "crown")?.withRenderingMode(.alwaysOriginal)
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = crownImage
        imageAttachment.image?.withTintColor(.whiteColor)
        imageAttachment.bounds = CGRect(x: 0, y: -2, width: 19, height: 19)
        let imageString = NSAttributedString(attachment: imageAttachment)
        attributedText.append(imageString)
        let textString = NSAttributedString(string: "   Get new features first", attributes: [
            .font: UIFont.goldmanRegular(size: 14),
            .foregroundColor: UIColor.whiteColor
        ])
        attributedText.append(textString)
        view.attributedText = attributedText
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
        addSubview(fullAccessLabel)
        addSubview(firstToKnowLabel)
        addSubview(getNewFeaturesFirstLabel)
    }

    private func setupConstraints() {
        fullAccessLabel.snp.remakeConstraints { make in
            make.top.equalTo(snp.top)
            make.leading.equalTo(snp.leading)
            make.height.equalTo(16)
        }

        firstToKnowLabel.snp.remakeConstraints { make in
            make.top.equalTo(fullAccessLabel.snp.bottom).offset(8)
            make.leading.equalTo(snp.leading)
            make.height.equalTo(16)
        }

        getNewFeaturesFirstLabel.snp.remakeConstraints { make in
            make.top.equalTo(firstToKnowLabel.snp.bottom).offset(8)
            make.leading.equalTo(snp.leading)
            make.height.equalTo(16)
        }
    }
}
