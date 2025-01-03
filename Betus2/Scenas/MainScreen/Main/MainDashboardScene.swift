//
//  MainDashboardScene.swift
//  Betus2
//
//  Created by Gio's Mac on 23.12.24.
//


import UIKit
import SnapKit

//@available(iOS 15.0, *)
class MainDashboardScene: UIViewController {

//    private let images = ["", "tennis", "basketball", "volleyball", "soccer", ""]

    private var images: [String] {
        return isSubscribed
        ? ["", "tennis", "basketball", "volleyball", "soccer", ""]
        : ["", "locked", "locked", "locked", "soccer", ""]
    }

    var isSubscribed: Bool = false {
        didSet {
            collectionView.reloadData()
//            updateBackground()
        }
    }

    private lazy var warningView: WarningView = {
        let view = WarningView()
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
        view.onHistoryButtonTap = { [weak self] in
            self?.navigationToHistory()
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
//        updateBackground()

        if UserDefaults.standard.bool(forKey: "isGuestUser") {
            setupForGuestUser()
        }

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
        guard indexPath.item < images.count else { return }

            let sportName = images[indexPath.item]
            if sportName.isEmpty { return }

            // Update the sport label
            sportLabel.text = sportName.uppercased()

            // Update the bottom view based on the sport
            updateBottomView(for: sportName)

            // Update the button based on whether the sport is locked
            if sportName.lowercased() == "locked" {
                print("Sport is locked, updating button to 'Go to Pro'")
                updateGoToProButton()
            } else {
                print("Sport is available, updating button to 'Start'")
                updateStartButton()
            }
//        guard !images[indexPath.item].isEmpty else { return }
//        let sportName = images[indexPath.item].uppercased()
//        sportLabel.text = sportName
//        topView.titleLabel.attributedText = topView.makeTopViewAttributedString(for: sportName)
//        updateBottomView(for: images[indexPath.item])
    }

    private func hideWarningView() {
        warningView.isHidden = true
    }

    private func navigateToProfile() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }

    private func navigationToHistory() {
        let historyVC = HistoryController()
        navigationController?.pushViewController(historyVC, animated: true)
    }

    //TODO: make button hidden if user is as guest update all
    private func setupForGuestUser() {
//        topView.historyButton.isHidden = true
//        topView.numberOfWorkoutDays.image = UIImage(named: "guestRectangle")
//        topView.numberOfWorkoutDays.isHidden = true
//        warningView.isHidden = true
//        bottomView.startButton.isHidden = true
    }


    private func updateGoToProButton() {
        bottomView.startButton.setTitle("Go to pro ", for: .normal)
        bottomView.startButton.setTitleColor(UIColor.whiteColor, for: .normal)
        bottomView.startButton.titleLabel?.font = UIFont.goldmanRegular(size: 14)
        bottomView.startButton.backgroundColor = UIColor.redColor
        bottomView.startButton.makeRoundCorners(16)
        let image = UIImage(named: "crown")?.withRenderingMode(.alwaysOriginal)
        let resizedImage = UIGraphicsImageRenderer(size: CGSize(width: 19, height: 18)).image { _ in
            image?.draw(in: CGRect(origin: .zero, size: CGSize(width: 19, height: 18)))
        }
        bottomView.startButton.setImage(resizedImage, for: .normal)
        bottomView.startButton.imageView?.contentMode = .scaleAspectFit
        bottomView.startButton.semanticContentAttribute = .forceRightToLeft
        bottomView.startButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        bottomView.startButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        bottomView.startButton.contentHorizontalAlignment = .center

        bottomView.startButton.snp.updateConstraints { make in
            make.width.equalTo(123)
        }
    }

    private func updateStartButton() {
        bottomView.startButton.setTitle("Start ", for: .normal)
        bottomView.startButton.setTitleColor(UIColor.whiteColor, for: .normal)
        bottomView.startButton.titleLabel?.font = UIFont.goldmanRegular(size: 14)
        bottomView.startButton.backgroundColor = UIColor.redColor
        bottomView.startButton.makeRoundCorners(16)
        let image = UIImage(named: "play")?.withRenderingMode(.alwaysOriginal)
        let resizedImage = UIGraphicsImageRenderer(size: CGSize(width: 19, height: 18)).image { _ in
            image?.draw(in: CGRect(origin: .zero, size: CGSize(width: 19, height: 18)))
        }
        bottomView.startButton.setImage(resizedImage, for: .normal)
        bottomView.startButton.imageView?.contentMode = .scaleAspectFit
        bottomView.startButton.semanticContentAttribute = .forceRightToLeft
        bottomView.startButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        bottomView.startButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        bottomView.startButton.contentHorizontalAlignment = .center

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

//@available(iOS 15.0, *)
extension MainDashboardScene: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportImagesCell", for: indexPath) as? SportImagesCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: images[indexPath.item])

//        let imageName = images[indexPath.item]
//        cell.configure(with: imageName)
//
//        // Optionally, apply a "locked" style for locked items
//        if imageName == "locked" {
//            cell.contentView.alpha = 0.5 // Dim locked items
//            cell.backgroundBackView.backgroundColor = .whiteColor.withAlphaComponent(0.1)
//            cell.imageBackgroundColor.backgroundColor = .topBottomViewColorGray
//
//        } else {
//            cell.contentView.alpha = 1.0 // Normal appearance
//        }

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

//@available(iOS 15.0, *)
extension MainDashboardScene: BottomViewDelegate {
    @available(iOS 15.0, *)
    func didTapStartButton() {
        if bottomView.startButton.title(for: .normal) == "Start " {
            let workoutTimeView = WorkoutTimeView()
            workoutTimeView.selectedSport = sportLabel.text
            navigationController?.pushViewController(workoutTimeView, animated: false)
        } else {
            if let currentTopVC = navigationController?.topViewController,
               currentTopVC is SubscriptionMainViewController {
                // Prevent duplicate pushes to SubscriptionMainViewController
                return
            }

            let subscriptionVC = SubscriptionMainViewController()
            navigationController?.pushViewController(subscriptionVC, animated: true)
        }
    }
}
