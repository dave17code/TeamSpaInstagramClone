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
    
    let userProfileImage = UIImageView().then {
        $0.image = UIImage(named: "UserProfileImage")
    }
    
    let userFollowInfoView = UIView().then {
        $0.backgroundColor = .green
    }
    
    let userInfoHStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 24
    }
    
    let postVStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
    }
    
    let postCountLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 16.5)
        $0.text = "7"
    }
    
    let postLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.text = "post"
    }
    
    let followerVStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
    }
    
    let followerCountLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 16.5)
        $0.text = "7"
    }
    
    let followerLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.text = "follower"
    }
    
    let followingVStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
    }
    
    let followingCountLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 16.5)
        $0.text = "0"
    }
    
    let followingLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.text = "following"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpViewHierarchy()
        setUpLayout()
    }
    
    func setUpViewHierarchy() {
        view.addSubview(userName)
        view.addSubview(menuButton)
        view.addSubview(userProfileImage)
        view.addSubview(userFollowInfoView)
        postVStackView.addArrangedSubviews(postCountLabel, postLabel)
        followerVStackView.addArrangedSubviews(followerCountLabel, followerLabel)
        followingVStackView.addArrangedSubviews(followingCountLabel, followingLabel)
        userInfoHStackView.addArrangedSubviews(postVStackView, followerVStackView, followingVStackView)
        userFollowInfoView.addSubview(userInfoHStackView)
    }
    
    func setUpLayout() {
        userName.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.centerX.equalToSuperview()
        }
        menuButton.snp.makeConstraints {
            $0.width.equalTo(21)
            $0.height.equalTo(17.5)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.right.equalToSuperview().inset(28)
        }
        userProfileImage.snp.makeConstraints {
            $0.width.equalTo(88)
            $0.height.equalTo(88)
            $0.top.equalTo(userName.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset(14)
        }
        userFollowInfoView.snp.makeConstraints {
            $0.height.equalTo(88)
            $0.top.equalTo(userName.snp.bottom).offset(14)
            $0.leading.equalTo(userProfileImage.snp.trailing).offset(0)
            $0.trailing.equalToSuperview()
        }
        userInfoHStackView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
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

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
