//
//  MainDashboardScene.swift
//  Betus2
//
//  Created by Gio's Mac on 23.12.24.
//


import UIKit
import SnapKit

class MainDashboardScene: UIViewController {

    private let images = ["", "tennis", "basketball", "volleyball", "soccer", ""]

    private lazy var warningView: WarningView = {
        let view = WarningView()
//        view.backgroundColor = UIColor.mainBlack
        view.makeRoundCorners(32)
        view.onAcceptButtonTap = { [weak self] in
            self?.hideWarningView()
        }
        return view
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80 * Constraint.xCoeff, height: 80 * Constraint.yCoeff)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32)
        layout.minimumLineSpacing = 32
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.showsHorizontalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.register(SportImagesCell.self, forCellWithReuseIdentifier: "SportImagesCell")
        return view
    }()

    private lazy var topView: TopView = {
        let view = TopView()
        view.backgroundColor = UIColor.topBottomViewColorGray
        view.makeRoundCorners(32)
        view.onProfileButtonTap = { [weak self] in
            self?.navigateToProfile()
        }
        return view
    }()

    private lazy var sportLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "TENNIS"
        view.textColor = UIColor.whiteColor
        view.font = UIFont.goldmanBold(size: 32)
        return view
    }()

    private lazy var sportImageBackView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "appleLogoFrame")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var bottomView: BottomView = {
        let view = BottomView()
        view.backgroundColor = UIColor.topBottomViewColorGray
        view.makeRoundCorners(32)
        view.delegate = self
        return view
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.mainBlack

        self.navigationController?.setNavigationBarHidden(true, animated: false)

        setup()
        setupConstraints()

        DispatchQueue.main.async {
            let indexPath = IndexPath(item: 2, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
            self.updateViewForSport(at: indexPath)
        }
    }

    private func setup() {
        view.addSubview(topView)
        view.addSubview(sportLabel)
        view.addSubview(sportImageBackView)
        view.addSubview(collectionView)
        view.addSubview(bottomView)
        view.addSubview(warningView)
    }

    private func setupConstraints() {
        warningView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }

        topView.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(44 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(16 * Constraint.xCoeff)
            make.height.equalTo(156 * Constraint.yCoeff)
        }

        sportLabel.snp.remakeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(82 * Constraint.yCoeff)
            make.centerX.equalToSuperview()
            make.height.equalTo(38 * Constraint.yCoeff)
        }

        sportImageBackView.snp.remakeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(260 * Constraint.yCoeff)
        }

        collectionView.snp.remakeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(165 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(15 * Constraint.xCoeff)
        }

        bottomView.snp.remakeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-24 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(16 * Constraint.xCoeff)
            make.height.equalTo(159 * Constraint.yCoeff)
        }
    }

    private func updateViewForSport(at indexPath: IndexPath) {
        guard !images[indexPath.item].isEmpty else { return }
        let sportName = images[indexPath.item].uppercased()
        sportLabel.text = sportName
        topView.titleLabel.attributedText = topView.makeTopViewAttributedString(for: sportName)
        updateBottomView(for: images[indexPath.item])
    }

    private func hideWarningView() {
        warningView.isHidden = true
    }

    private func navigateToProfile() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }

    private func updateBottomView(for sport: String) {
        let bottomViewInfo: ViewInfo

        switch sport.lowercased() {
        case "tennis":
            bottomViewInfo = ViewInfo(
                title: "Daily tennis workout",
                description: """
                Daily tennis training: improve your coordination, form and skill on the court. Increase your reaction, strength and flexibility with every training session.
                """,
                timer: "25"
            )
        case "basketball":
            bottomViewInfo = ViewInfo(
                title: "Daily basketball workout",
                description: """
                Daily basketball training: improve your coordination, endurance and skill in the game. Develop reaction, speed and flexibility on the court with every exercise.
                """,
                timer: "30"
            )
        case "volleyball":
            bottomViewInfo = ViewInfo(
                title: "Daily volleyball workout",
                description: """
                Daily volleyball training: improve your technique, endurance and sense of play. Improve your reaction, speed and flexibility on the court with every exercise.
                """,
                timer: "27"
            )
        case "soccer":
            bottomViewInfo = ViewInfo(
                title: "Daily soccer workout",
                description: "Daily soccer training: develop coordination, endurance and technique. Improve your reaction, speed and flexibility on the pitch with every exercise",
                timer: "30"
            )

        default:
            bottomViewInfo = ViewInfo(title: "", description: "", timer: "0")
        }

        bottomView.configure(data: bottomViewInfo)
    }
}

extension MainDashboardScene: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportImagesCell", for: indexPath) as? SportImagesCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: images[indexPath.item])
        return cell
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // Get the target content offset and calculate the target index
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let itemWidth = layout.itemSize.width + layout.minimumLineSpacing
        let targetX = targetContentOffset.pointee.x
        let targetIndex = round(targetX / itemWidth)

        // Ensure the index is within bounds
        let clampedIndex = max(0, min(CGFloat(images.count - 1), targetIndex))

        targetContentOffset.pointee = CGPoint(x: clampedIndex * itemWidth, y: 0)

        let indexPath = IndexPath(item: Int(clampedIndex), section: 0)
        updateViewForSport(at: indexPath)


    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let centerX = collectionView.bounds.width / 2 + collectionView.contentOffset.x
        for cell in collectionView.visibleCells {
            guard let indexPath = collectionView.indexPath(for: cell),
                  let layoutAttributes = collectionView.layoutAttributesForItem(at: indexPath),
                  let sportCell = cell as? SportImagesCell else { continue }

            let cellCenter = layoutAttributes.center.x
            let distance = abs(centerX - cellCenter)
            let maxDistance = collectionView.bounds.width / 2

            let scale = max(1 - (distance / maxDistance), 0.5)
            let transformScale = scale

            sportCell.transform = CGAffineTransform(scaleX: transformScale, y: transformScale)

            if distance < 10 {
                sportCell.backgroundBackView.backgroundColor = UIColor.redColor.withAlphaComponent(0.2)
                sportCell.imageBackgroundColor.backgroundColor = UIColor.redColor
                //                sportCell.imageDarkBackgroundColor.backgroundColor = .clear
                if !images[indexPath.item].isEmpty {
                    let sportName = images[indexPath.item].uppercased()
                    sportLabel.text = sportName
                    topView.titleLabel.attributedText = topView.makeTopViewAttributedString(for: sportName)
                    updateBottomView(for: images[indexPath.item])
                }
            } else {
                sportCell.backgroundBackView.backgroundColor = .clear
                sportCell.imageBackgroundColor.backgroundColor = .clear
                //                sportCell.imageDarkBackgroundColor.backgroundColor = UIColor(hexString: "#000000")
            }
        }
    }
}

extension MainDashboardScene: BottomViewDelegate {
    func didTapStartButton() {
        let workoutTimeView = WorkoutTimeView()
        workoutTimeView.selectedSport = sportLabel.text
        navigationController?.pushViewController(workoutTimeView, animated: false)
    }
}
