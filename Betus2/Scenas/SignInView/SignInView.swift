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
        view.textColor = UIColor.whiteColor
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

    private lazy var timerBackground: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .redColor.withAlphaComponent(0.2)
        view.makeRoundCorners(80)
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
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanRegular(size: 14)
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()

    private lazy var signInWithAppleButton: UIButton = {
        let view = UIButton(frame: .zero)
            view.setTitle("Sign In with Apple", for: .normal)
        view.setTitleColor(UIColor.mainBlack, for: .normal)
        view.backgroundColor = UIColor.whiteColor
            view.layer.cornerRadius = 16
        view.layer.borderColor = UIColor.whiteColor.cgColor
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
        let attributedTitle = NSAttributedString(
            string: "Terms of",
            attributes: [
                .font: UIFont.goldmanRegular(size: 12),
                .foregroundColor: UIColor.whiteColor,
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
        )
        view.setAttributedTitle(attributedTitle, for: .normal)
        view.backgroundColor = .clear
        view.addTarget(self, action: #selector(clickTermsButton), for: .touchUpInside)
        return view
    }()

    private lazy var termsLine: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = UIColor.whiteColor
        return view
    }()

    private lazy var andLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "use and"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanRegular(size: 12)
        view.textAlignment = .center
        return view
    }()

    private lazy var privacyPolicyButton: UIButton = {
        let view = UIButton(frame: .zero)
        let attributedTitle = NSAttributedString(
            string: "Privacy Policy",
            attributes: [
                .font: UIFont.goldmanRegular(size: 12),
                .foregroundColor: UIColor.whiteColor,
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
        )
        view.setAttributedTitle(attributedTitle, for: .normal)
        view.backgroundColor = .clear
        view.addTarget(self, action: #selector(clickPrivacyPolicyButton), for: .touchUpInside)
        return view
    }()

    private lazy var privacyLine: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = UIColor.whiteColor
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.mainBlack

        setup()
        setupConstraints()
    }

    private func setup() {
        view.addSubview(quickSignLabel)
        view.addSubview(mainImageViewFram)
        mainImageViewFram.addSubview(timerBackground)
        timerBackground.addSubview(mainImageView)
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
            make.top.equalTo(view.snp.top).offset(222 * Constraint.yCoeff)
            make.centerX.equalToSuperview()
            make.height.equalTo(86 * Constraint.yCoeff)
            make.width.equalTo(285 * Constraint.xCoeff)
        }

        mainImageViewFram.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(270 * Constraint.yCoeff)
            make.centerX.equalToSuperview()
            make.height.equalTo(260 * Constraint.yCoeff)
            make.width.equalTo(260 * Constraint.xCoeff)
        }

        timerBackground.snp.remakeConstraints { make in
            make.center.equalTo(mainImageViewFram.snp.center)
            make.height.width.equalTo(160 * Constraint.yCoeff)
        }

        mainImageView.snp.remakeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(140 * Constraint.yCoeff)
            make.width.equalTo(140 * Constraint.xCoeff)
        }

        signInInfoLabel.snp.remakeConstraints { make in
            make.top.equalTo(mainImageViewFram.snp.bottom).offset(3 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(44 * Constraint.xCoeff)
            make.height.equalTo(51 * Constraint.yCoeff)
        }

        termsButton.snp.remakeConstraints { make in
            make.top.equalTo(signInInfoLabel.snp.bottom).offset(32 * Constraint.yCoeff)
            make.leading.equalTo(view.snp.leading).offset(95 * Constraint.xCoeff)
            make.height.equalTo(14 * Constraint.yCoeff)
        }

        andLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(termsButton.snp.centerY)
            make.leading.equalTo(termsButton.snp.trailing).offset(2 * Constraint.xCoeff)
            make.height.equalTo(14 * Constraint.yCoeff)
        }

        privacyPolicyButton.snp.remakeConstraints { make in
            make.centerY.equalTo(termsButton.snp.centerY)
            make.leading.equalTo(andLabel.snp.trailing).offset(2 * Constraint.xCoeff)
            make.height.equalTo(14 * Constraint.yCoeff)
        }

        signInWithAppleButton.snp.remakeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-100 * Constraint.yCoeff)
            make.centerX.equalToSuperview()
            make.height.equalTo(48 * Constraint.yCoeff)
            make.width.equalTo(326 * Constraint.xCoeff)
        }

        logInAsGuestButton.snp.remakeConstraints { make in
            make.top.equalTo(signInWithAppleButton.snp.bottom).offset(8 * Constraint.yCoeff)
            make.centerX.equalToSuperview()
            make.height.equalTo(48 * Constraint.yCoeff)
            make.width.equalTo(326 * Constraint.xCoeff)
        }

    }

    //TODO: add links
    @objc private func clickTermsButton() {

    }

    @objc private func clickPrivacyPolicyButton() {

    }

    @objc private func clickSignInWithAppleButton() {
        let mainView = MainDashboardScene()
        navigationController?.pushViewController(mainView, animated: true)
    }

    @objc private func clickLogInAsGuestButton() {
        UserDefaults.standard.setValue(true, forKey: "isGuestUser")
        let mainVC = MainDashboardScene()
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(mainVC, animated: true)
    }
}

