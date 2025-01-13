//
//  HistoryController.swift
//  Betus2
//
//  Created by Gio's Mac on 27.12.24.
//

import UIKit
import SnapKit
import Alamofire

class HistoryController: UIViewController {
    private var workoutHistory: [WorkoutScore] = []

    private lazy var backButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "backArrow"), for: .normal)
        view.addTarget(self, action: #selector(pressBackButton), for: .touchUpInside)
        return view
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.width, height: 211 * Constraint.yCoeff)
        layout.minimumLineSpacing = 4
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.showsHorizontalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.register(HistoryCell.self, forCellWithReuseIdentifier: "HistoryCell")
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()

        fetchWorkoutCurrentUserInfo()
    }
    
    private func setup() {
        view.addSubview(backButton)
        view.addSubview(collectionView)
    }

    private func setupConstraints() {
        backButton.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(44 * Constraint.yCoeff)
            make.leading.equalTo(view.snp.leading).offset(16 * Constraint.xCoeff)
            make.height.width.equalTo(32 * Constraint.yCoeff)
        }

        collectionView.snp.remakeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(8 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview()/*.inset(16 * Constraint.xCoeff)*/
            make.bottom.equalTo(view.snp.bottom)
//            make.height.lessThanOrEqualTo(211 * Constraint.yCoeff)
        }
    }

    private func fetchWorkoutCurrentUserInfo() {
        guard let userId = UserDefaults.standard.value(forKey: "userId") as? String else {
            return
        }
//        let url = String.getWorkoutCountsAndDate(userId: userId)
        let url = "https://betus-workouts-98df47aa38c2.herokuapp.com/api/v1/workout_scores/\(userId)"
        NetworkManager.shared.get(url: url, parameters: nil, headers: nil) { (result: Result<[WorkoutScore]>) in
            switch result {
            case .success(let workouts):
                self.workoutHistory = workouts
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    @objc func pressBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension HistoryController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workoutHistory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HistoryCell", for: indexPath) as? HistoryCell else { return UICollectionViewCell()
        }
        let workoutData = workoutHistory[indexPath.item]
        cell.configure(with: workoutData)
        return cell
    }
}
