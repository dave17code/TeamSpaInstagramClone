//
//  ImageModel.swift
//  TeamSpaInstagramClone
//
//  Created by woonKim on 2024/01/31.
//

import UIKit

struct ImageModel {
    static let images: [UIImage] = (1...7).compactMap { UIImage(named: "Picture\($0)") }
}
