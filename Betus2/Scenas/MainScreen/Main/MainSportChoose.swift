//
//  MainSportChoose.swift
//  Betus2
//
//  Created by Gio's Mac on 23.12.24.
//

import UIKit
import SnapKit

class MainSportChoose: UIViewController {

    private lazy var topView: TopView = {
        let view = TopView()
        view.backgroundColor = UIColor(hexString: "#111111")
        view.layer.cornerRadius = 32
        return view
    }()

    private lazy var sportLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Tennis"
        view.textColor = UIColor(hexString: "#FFFFFF")
        view.font = UIFont.goldmanBold(size: 32)
        return view
    }()

    private lazy var sportImageBackView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "appleLogoFrame")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var mainSportImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "tennisRed")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var leftSportButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "basketball"), for: .normal)
        view.contentMode = .scaleAspectFit
        view.addTarget(self, action: #selector(clickLeftSportButton), for: .touchUpInside)
        return view
    }()

    private lazy var rightSportButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "football"), for: .normal)
        view.contentMode = .scaleAspectFit
        view.addTarget(self, action: #selector(clickRightSportButton), for: .touchUpInside)
        return view
    }()

    private lazy var tennisBottomView: TennisBottomView = {
        let view = TennisBottomView()
        view.backgroundColor = UIColor(hexString: "#111111")
        view.layer.cornerRadius = 32
        view.isHidden = true
        return view
    }()

    private lazy var footballBottomView: FootballBottomView = {
        let view = FootballBottomView()
        view.backgroundColor = UIColor(hexString: "#111111")
        view.layer.cornerRadius = 32
        view.isHidden = true
        return view
    }()

    private lazy var volleyballBottomView: VolleyballBottomView = {
        let view = VolleyballBottomView()
        view.backgroundColor = UIColor(hexString: "#111111")
        view.layer.cornerRadius = 32
        view.isHidden = true
        return view
    }()

    private lazy var basketballBottomView: BasketballBottomView = {
        let view = BasketballBottomView()
        view.backgroundColor = UIColor(hexString: "#111111")
        view.layer.cornerRadius = 32
        view.isHidden = true
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#0A0A0A")

        self.navigationController?.setNavigationBarHidden(true, animated: false)

        setup()
        setupConstraints()

        mainSportImage.image?.accessibilityIdentifier = "tennisRed"

        updateSportLabel()
        updateBottomViewsVisibility()
    }

    private func setup() {
        view.addSubview(topView)
        view.addSubview(sportLabel)
        view.addSubview(sportImageBackView)
        sportImageBackView.addSubview(mainSportImage)
        view.addSubview(leftSportButton)
        view.addSubview(rightSportButton)
        view.addSubview(tennisBottomView)
        view.addSubview(footballBottomView)
        view.addSubview(volleyballBottomView)
        view.addSubview(basketballBottomView)
    }

    private func setupConstraints() {
        topView.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(44)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(156)
        }

        sportLabel.snp.remakeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(82)
            make.centerX.equalToSuperview()
            make.height.equalTo(38)
        }

        sportImageBackView.snp.remakeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(260)
        }

        mainSportImage.snp.remakeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(140)
        }

        leftSportButton.snp.remakeConstraints { make in
            make.centerY.equalTo(mainSportImage.snp.centerY)
            make.leading.equalTo(view.snp.leading).offset(13)
            make.height.width.equalTo(80)
        }

        rightSportButton.snp.remakeConstraints { make in
            make.centerY.equalTo(mainSportImage.snp.centerY)
            make.trailing.equalTo(view.snp.trailing).offset(-13)
            make.height.width.equalTo(80)
        }

        tennisBottomView.snp.remakeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(159)
        }

        footballBottomView.snp.remakeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(159)
        }

        volleyballBottomView.snp.remakeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(159)
        }

        basketballBottomView.snp.remakeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(159)
        }
    }

    private func updateSportLabel() {
        guard let identifier = mainSportImage.image?.accessibilityIdentifier else {
            sportLabel.text = "Unknown Sport"
            return
        }

        switch mainSportImage.image?.accessibilityIdentifier {
        case "tennisRed":
            sportLabel.text = "Tennis"
        case "soccerRed":
            sportLabel.text = "Soccer"
        case "volleyballRed":
            sportLabel.text = "Volleyball"
        case "basketballRed":
            sportLabel.text = "Basketball"
        default:
            sportLabel.text = "Unknown Sport"
        }
    }

    private func updateBottomViewsVisibility() {
        tennisBottomView.isHidden = true
        footballBottomView.isHidden = true
        volleyballBottomView.isHidden = true
        basketballBottomView.isHidden = true

        switch sportLabel.text {
        case "Tennis":
            tennisBottomView.isHidden = false
        case "Soccer":
            footballBottomView.isHidden = false
        case "Volleyball":
            volleyballBottomView.isHidden = false
        case "Basketball":
            basketballBottomView.isHidden = false
        default:
            break
        }
    }

    @objc private func clickLeftSportButton() {
        mainSportImage.image = UIImage(named: "soccerRed")
        mainSportImage.image?.accessibilityIdentifier = "soccerRed"
        updateSportLabel()
        updateBottomViewsVisibility()

    }

    @objc private func clickRightSportButton() {
        mainSportImage.image = UIImage(named: "volleyballRed")
        mainSportImage.image?.accessibilityIdentifier = "volleyballRed"
        updateSportLabel()
        updateBottomViewsVisibility()
    }
}
