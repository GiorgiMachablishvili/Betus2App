//
//  warningView.swift
//  Betus2
//
//  Created by Gio's Mac on 26.12.24.
//

import UIKit
import SnapKit

class WarningView: UIView {

    var onAcceptButtonTap: (() -> Void)?

    private lazy var blurBackground: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        view.alpha = 0.6
        return view
    }()

    private lazy var warningImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "warningDarkView")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var acceptButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Accept", for: .normal)
        view.setTitleColor(UIColor.whiteColor, for: .normal)
        view.titleLabel?.font = UIFont.goldmanRegular(size: 14)
        view.makeRoundCorners(23)
        view.backgroundColor = .topBottomViewColorGray
        view.addTarget(self, action: #selector(pressAcceptButton), for: .touchUpInside)
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
        addSubview(blurBackground)
        addSubview(warningImage)
        addSubview(acceptButton)

    }

    private func setupConstraints() {
        blurBackground.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }

        warningImage.snp.remakeConstraints { make in
            make.bottom.equalTo(acceptButton.snp.top).offset(-8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(81)
        }

        acceptButton.snp.remakeConstraints { make in
            make.bottom.equalTo(snp.bottom).offset(-40)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(44)
        }
    }

    @objc func pressAcceptButton() {
        onAcceptButtonTap?()
    }
}
