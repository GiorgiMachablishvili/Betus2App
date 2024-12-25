//
//  MainDashboardScene.swift
//  Betus2
//
//  Created by Gio's Mac on 23.12.24.
//


//TODO: stop scrolling when image will be in middle
//TODO: change middle image background


import UIKit
import SnapKit

class MainDashboardScene: UIViewController {

    private let images = ["", "tennis", "basketball", "volleyball", "soccer", ""]

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
        return view
    }()

    private lazy var sportLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Tennis"
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
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.main

        self.navigationController?.setNavigationBarHidden(true, animated: false)

        setup()
        setupConstraints()

    }

    private func setup() {
        view.addSubview(topView)
        view.addSubview(sportLabel)
        view.addSubview(sportImageBackView)
        view.addSubview(collectionView)
        view.addSubview(bottomView)
    }

    private func setupConstraints() {
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
            make.height.equalTo(160 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(15 * Constraint.xCoeff)
        }

        bottomView.snp.remakeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-24 * Constraint.yCoeff)
            make.leading.trailing.equalToSuperview().inset(16 * Constraint.xCoeff)
            make.height.equalTo(159 * Constraint.yCoeff)
        }
    }

    private func updateBottomView(for sport: String) {
        let bottomViewInfo: BottomViewInfo

        switch sport.lowercased() {
        case "tennis":
            bottomViewInfo = BottomViewInfo(
                title: "Daily tennis workout",
                description: """
                Daily tennis training: improve your coordination, form and skill on the court. Increase your reaction, strength and flexibility with every training session.
                """,
                timer: "25"
            )
        case "basketball":
            bottomViewInfo = BottomViewInfo(
                title: "Daily basketball workout",
                description: """
                Daily basketball training: improve your coordination, endurance and skill in the game. Develop reaction, speed and flexibility on the court with every exercise.
                """,
                timer: "30"
            )
        case "volleyball":
            bottomViewInfo = BottomViewInfo(
                title: "Daily volleyball workout",
                description: """
                Daily volleyball training: improve your technique, endurance and sense of play. Improve your reaction, speed and flexibility on the court with every exercise.
                """,
                timer: "25"
            )
        case "soccer":
            bottomViewInfo = BottomViewInfo(
                title: "Daily soccer workout",
                description: "Daily soccer training: develop coordination, endurance and technique. Improve your reaction, speed and flexibility on the pitch with every exercise",
                timer: "30"
            )

        default:
            bottomViewInfo = BottomViewInfo(title: "", description: "", timer: "0")
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
            if let cell = collectionView.cellForItem(at: indexPath) as? SportImagesCell, !images[indexPath.item].isEmpty {
                let sportName = images[indexPath.item].uppercased()
                sportLabel.text = sportName
                topView.titleLabel.attributedText = topView.makeTopViewAttributedString(for: sportName)
            }
        }


    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let centerX = collectionView.bounds.width / 2 + collectionView.contentOffset.x
        for cell in collectionView.visibleCells {
            guard let indexPath = collectionView.indexPath(for: cell),
                  let layoutAttributes = collectionView.layoutAttributesForItem(at: indexPath) else { continue }

            let cellCenter = layoutAttributes.center.x
            let distance = abs(centerX - cellCenter)
            let maxDistance = collectionView.bounds.width / 2

            let scale = max(1 - (distance / maxDistance), 0.5)
            let transformScale = scale

            cell.transform = CGAffineTransform(scaleX: transformScale, y: transformScale)

            if distance < 10 {
                cell.backgroundColor = UIColor(hexString: "#F73838")
                if !images[indexPath.item].isEmpty {
                    let sportName = images[indexPath.item].uppercased()
                    sportLabel.text = sportName
                    topView.titleLabel.attributedText = topView.makeTopViewAttributedString(for: sportName)
                    updateBottomView(for: images[indexPath.item])
                } else {
                    cell.backgroundColor = .clear
                }
            }
        }
    }
}
