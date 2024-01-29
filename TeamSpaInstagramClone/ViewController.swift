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
    let userFollowInfoHStackView = UIStackView().then {
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
    let userIntroduceVStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 2
    }
    let userIntroduceLabel1 = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 14)
        $0.text = "르탄이"
    }
    let userIntroduceLabel2 = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.text = "iOS Developer 🍎"
    }
    let userIntroduceLabel3 = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.text = "spartacodingclub.kr"
        $0.textColor = UIColor(red: 0.06, green: 0.27, blue: 0.49, alpha: 1)
    }
    let moreButton = UIButton().then {
        $0.setImage(UIImage(named: "More"), for: .normal)
    }
    let followMessageMoreHStackview = UIStackView().then {
        $0.spacing = 8
        $0.distribution = .fill
    }
    let followButton = UIButton().then {
        $0.setTitle("Follow", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = UIColor(red: 0.22, green: 0.6, blue: 0.95, alpha: 1)
        $0.layer.cornerRadius = 4
    }
    let messageButton = UIButton().then {
        $0.setTitle("Message", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.layer.borderWidth = 1.5
        $0.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1).cgColor
        $0.layer.cornerRadius = 4
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
        view.addSubview(userIntroduceVStackView)
        view.addSubview(moreButton)
        view.addSubview(followMessageMoreHStackview)
        postVStackView.addArrangedSubviews(postCountLabel, postLabel)
        followerVStackView.addArrangedSubviews(followerCountLabel, followerLabel)
        followingVStackView.addArrangedSubviews(followingCountLabel, followingLabel)
        userFollowInfoHStackView.addArrangedSubviews(postVStackView, followerVStackView, followingVStackView)
        userFollowInfoView.addSubview(userFollowInfoHStackView)
        userIntroduceVStackView.addArrangedSubviews(userIntroduceLabel1, userIntroduceLabel2, userIntroduceLabel3)
        followMessageMoreHStackview.addArrangedSubviews(followButton, messageButton, moreButton)
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
            $0.trailing.equalToSuperview().inset(20)
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
        userFollowInfoHStackView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        userIntroduceVStackView.snp.makeConstraints {
            $0.top.equalTo(userProfileImage.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset(15)
        }
        moreButton.snp.makeConstraints {
            $0.width.equalTo(30)
            $0.height.equalTo(30)
        }
        followButton.snp.makeConstraints {
            $0.width.equalTo(messageButton.snp.width)
        }
        followMessageMoreHStackview.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.top.equalTo(userIntroduceLabel3.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(15)
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
