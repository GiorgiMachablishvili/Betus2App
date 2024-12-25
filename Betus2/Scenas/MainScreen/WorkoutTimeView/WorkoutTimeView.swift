//
//  WorkoutTimeView.swift
//  Betus2
//
//  Created by Gio's Mac on 25.12.24.
//

import UIKit
import SnapKit

class WorkoutTimeView: UIViewController {

    private var timer: Timer?
    private var currentTime = 180
    private var workoutSteps: [ViewInfo] = []
    private var currentStepIndex = 0


    private lazy var workoutDescriptionTopView: WorkoutDescriptionTopView = {
        let view = WorkoutDescriptionTopView()
        view.backgroundColor = UIColor.topBottomViewColorGray
        view.makeRoundCorners(32)
        return view
    }()

    private lazy var timerBackground: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "timerbackground")
        return view
    }()

    private lazy var timerBackgroundView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.red
        view.layer.cornerRadius = 70 // Half of width/height (140/2)
        view.layer.masksToBounds = true
        return view
    }()

    private lazy var timerLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "03:00"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    private lazy var toggleButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(named: "timersStart"), for: .normal)
        button.addTarget(self, action: #selector(toggleTimer), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupWorkoutSteps()
        setup()
        setupConstraints()
        configureWorkoutStep()
    }

    private func setup() {
        view.addSubview(workoutDescriptionTopView)
        view.addSubview(timerBackground)
        timerBackground.addSubview(timerBackgroundView)
        timerBackgroundView.addSubview(timerLabel)
        view.addSubview(toggleButton)
    }


    private func setupConstraints() {
        workoutDescriptionTopView.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(48 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(16 * Constraint.xCoeff)
            make.height.equalTo(123 * Constraint.yCoeff)
        }

        timerBackground.snp.remakeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(160)
        }

        timerBackgroundView.snp.remakeConstraints { make in
            make.center.equalTo(timerBackground.snp.center)
            make.height.width.equalTo(140)
        }

        timerLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        toggleButton.snp.makeConstraints { make in
            make.top.equalTo(timerBackgroundView.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(44)
        }
    }

    private func setupWorkoutSteps() {
        workoutSteps = [
            ViewInfo(title: "Warm-up", description: "Jog around the court.", timer: "3"),
            ViewInfo(title: "Warm-up", description: "Stretching for legs, back, arms and shoulders.", timer: "2")
        ]
    }

    private func configureWorkoutStep() {
        guard currentStepIndex < workoutSteps.count else {
            timerLabel.text = "00:00"
            stopTimer()
            return
        }

        let step = workoutSteps[currentStepIndex]
        workoutDescriptionTopView.configure(data: step)
        if let timerValue = Int(step.timer) {
            currentTime = timerValue * 60
        } else {
            currentTime = 0
        }
        timerLabel.text = formatTime(currentTime)
    }


    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    @objc private func updateTimer() {
        guard currentTime > 0 else {
            stopTimer()
            toggleButton.setImage(UIImage(named: "timersStart"), for: .normal)

            return
        }
        currentTime -= 1
        timerLabel.text = formatTime(currentTime)
    }

    private func formatTime(_ totalSeconds: Int) -> String {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    @objc private func toggleTimer() {
        if timer == nil {
            startTimer()
            toggleButton.setImage(UIImage(named: "timersStop"), for: .normal)
        } else {
            stopTimer()
            toggleButton.setImage(UIImage(named: "timersStart"), for: .normal)
        }
    }
    
    func skipStep() {
        currentStepIndex += 1
        configureWorkoutStep()
    }
}
