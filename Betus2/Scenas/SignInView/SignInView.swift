//
//  ViewController.swift
//  Betus2
//
//  Created by Gio's Mac on 23.12.24.
//

import UIKit
import SnapKit

class SignInController: UIViewController {

    private lazy var quickSignLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Quick sign in with Apple"
        view.textColor = UIColor.init(hexString: "#FFFFFF")
        view.font = UIFont.goldmanBold(size: 32)
        view.textAlignment = .center
        view.numberOfLines = 2
        return view
    }()

    private lazy var mainImageViewFram: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "appleLogoFrame")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var mainImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "appleLogo")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var signInInfoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Sign in with Apple for secure and easy access. Save your workouts and get personalized recommendations!"
        view.textColor = UIColor.init(hexString: "#FFFFFF")
        view.font = UIFont.goldmanRegular(size: 14)
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()

    private lazy var signInWithAppleButton: UIButton = {
        let view = UIButton(frame: .zero)
            view.setTitle("Sign In with Apple", for: .normal)
            view.setTitleColor(UIColor(hexString: "#000000"), for: .normal)
            view.backgroundColor = UIColor(hexString: "FFFFFF")
            view.layer.cornerRadius = 16
            view.layer.borderColor = UIColor(hexString: "FFFFFF").cgColor
            view.layer.borderWidth = 1
            let image = UIImage(named: "apple")?.withRenderingMode(.alwaysOriginal)
            let resizedImage = UIGraphicsImageRenderer(size: CGSize(width: 20, height: 20)).image { _ in
                image?.draw(in: CGRect(origin: .zero, size: CGSize(width: 20, height: 20)))
            }
            view.setImage(resizedImage, for: .normal)
            view.imageView?.contentMode = .scaleAspectFit
            view.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
            view.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
            view.contentHorizontalAlignment = .center
            view.addTarget(self, action: #selector(clickSignInWithAppleButton), for: .touchUpInside)
            return view
    }()


    private lazy var logInAsGuestButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("log in as guest", for: .normal)
        view.backgroundColor = .clear
        view.layer.cornerRadius = 16
        view.addTarget(self, action: #selector(clickLogInAsGuestButton), for: .touchUpInside)
        return view
    }()

    private lazy var termsButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Terms of", for: .normal)
        view.setTitleColor(UIColor(hexString: "FFFFFF"), for: .normal)
        view.titleLabel?.font = UIFont.goldmanRegular(size: 12)
        view.backgroundColor = .clear
        view.addTarget(self, action: #selector(clickTermsButton), for: .touchUpInside)
        return view
    }()

    private lazy var termsLine: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = UIColor(hexString: "FFFFFF")
        return view
    }()

    private lazy var andLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "use and"
        view.textColor = UIColor(hexString: "FFFFFF")
        view.font = UIFont.goldmanRegular(size: 12)
        view.textAlignment = .center
        return view
    }()

    private lazy var privacyPolicyButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Privacy Policy", for: .normal)
        view.setTitleColor(UIColor(hexString: "FFFFFF"), for: .normal)
        view.titleLabel?.font = UIFont.goldmanRegular(size: 12)
        view.backgroundColor = .clear
        view.addTarget(self, action: #selector(clickPrivacyPolicyButton), for: .touchUpInside)
        return view
    }()

    private lazy var privacyLine: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = UIColor(hexString: "FFFFFF")
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(hexString: "#0A0A0A")

        setup()
        setupConstraints()
    }

    private func setup() {
        view.addSubview(quickSignLabel)
        view.addSubview(mainImageViewFram)
        mainImageViewFram.addSubview(mainImageView)
        view.addSubview(signInInfoLabel)
        view.addSubview(logInAsGuestButton)
        view.addSubview(termsButton)
        view.addSubview(termsLine)
        view.addSubview(andLabel)
        view.addSubview(privacyPolicyButton)
        view.addSubview(privacyLine)
        view.addSubview(signInWithAppleButton)
        view.addSubview(logInAsGuestButton)
    }

    private func setupConstraints() {
        quickSignLabel.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(222)
            make.centerX.equalToSuperview()
            make.height.equalTo(86)
            make.width.equalTo(285)
        }

        mainImageViewFram.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(270)
            make.centerX.equalToSuperview()
            make.height.equalTo(260)
            make.width.equalTo(260)
        }

        mainImageView.snp.remakeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(140)
            make.width.equalTo(140)
        }

        signInInfoLabel.snp.remakeConstraints { make in
            make.top.equalTo(mainImageViewFram.snp.bottom).offset(3)
            make.leading.trailing.equalToSuperview().inset(44)
            make.height.equalTo(51)
        }

        termsButton.snp.remakeConstraints { make in
            make.top.equalTo(signInInfoLabel.snp.bottom).offset(32)
            make.leading.equalTo(view.snp.leading).offset(95)
            make.height.equalTo(14)
        }

        andLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(termsButton.snp.centerY)
            make.leading.equalTo(termsButton.snp.trailing).offset(2)
            make.height.equalTo(14)
        }

        privacyPolicyButton.snp.remakeConstraints { make in
            make.centerY.equalTo(termsButton.snp.centerY)
            make.leading.equalTo(andLabel.snp.trailing).offset(2)
            make.height.equalTo(14)
        }

        signInWithAppleButton.snp.remakeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-100)
            make.centerX.equalToSuperview()
            make.height.equalTo(48)
            make.width.equalTo(326)
        }

        logInAsGuestButton.snp.remakeConstraints { make in
            make.top.equalTo(signInWithAppleButton.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.height.equalTo(48)
            make.width.equalTo(326)
        }

    }

    @objc private func clickTermsButton() {

    }

    @objc private func clickPrivacyPolicyButton() {

    }

    @objc private func clickSignInWithAppleButton() {
        let mainView = MainSportChoose()
        navigationController?.pushViewController(mainView, animated: true)
    }

    @objc private func clickLogInAsGuestButton() {

    }
}

