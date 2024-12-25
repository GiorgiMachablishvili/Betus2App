//
//  SportImagesCell.swift
//  Betus2
//
//  Created by Gio's Mac on 24.12.24.
//

import UIKit
import SnapKit

class SportImagesCell: UICollectionViewCell {

    lazy var sportImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleToFill
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
        addSubview(sportImage)
    }

    private func setupConstraints() {
        sportImage.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func configure(with imageName: String) {
        sportImage.image = UIImage(named: imageName)
    }
}
