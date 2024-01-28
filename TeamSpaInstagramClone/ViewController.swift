//
//  ViewController.swift
//  TeamSpaInstagramClone
//
//  Created by woonKim on 2024/01/28.
//

import UIKit
import SwiftUI
import SnapKit
import Then

class ViewController: UIViewController {
    
    let userName = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 18)
        $0.text = "nebecamp"
    }
    
    let menuButton = UIButton().then {
        $0.setImage(UIImage(named: "Menu"), for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(userName)
        view.addSubview(menuButton)
        
        setUpLayout()
    }
    
    func setUpLayout() {
        userName.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.centerX.equalToSuperview()
        }
        menuButton.snp.makeConstraints {
            $0.width.equalTo(21)
            $0.height.equalTo(17.5)
            $0.top.equalToSuperview().inset(14)
            $0.right.equalToSuperview().inset(28)
        }
    }
}

struct PreView: PreviewProvider {
    static var previews: some View {
        ViewController().toPreview()
    }
}

extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }
    
    func toPreview() -> some View {
        Preview(viewController: self)
    }
}
