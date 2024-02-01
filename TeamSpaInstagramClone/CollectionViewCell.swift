//
//  CollectionViewCell.swift
//  TeamSpaInstagramClone
//
//  Created by woonKim on 2024/01/31.
//

import UIKit
import SnapKit
import Then

class CollectionViewCell: UICollectionViewCell {
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleToFill
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(_ image: UIImage) {
        imageView.image = image
    }
}
