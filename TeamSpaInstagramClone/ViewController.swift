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
    let divider1 = UIView().then {
        $0.backgroundColor = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
    }
    let gridImageView = UIView().then {
        $0.backgroundColor = .green
    }
    let gridImage = UIImageView().then {
        $0.image = UIImage(named: "Grid")
    }
    let sectionIndicator = UIView().then {
        $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: setUpCollectionViewLayout()).then {
        $0.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        $0.backgroundColor = .systemPink
        $0.dataSource = self
        $0.delegate = self
    }
    let divider2 = UIView().then {
        $0.backgroundColor = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
    }
    let bottomView = UIView().then {
        $0.backgroundColor = .green
    }
    let profileTabBarIcon = UIImageView().then {
        $0.image = UIImage(named: "Profile")
    }
    let bottomdSafeAreaCoverView = UIView().then {
        $0.backgroundColor = .blue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpViewHierarchy()
        setUpLayout()
        collectionView.collectionViewLayout = setUpCollectionViewLayout()
    }
    
    func setUpViewHierarchy() {
        view.addSubview(userName)
        view.addSubview(menuButton)
        view.addSubview(userProfileImage)
        view.addSubview(userFollowInfoView)
        view.addSubview(userIntroduceVStackView)
        view.addSubview(moreButton)
        view.addSubview(followMessageMoreHStackview)
        view.addSubview(divider1)
        view.addSubview(gridImageView)
        view.addSubview(sectionIndicator)
        view.addSubview(bottomView)
        view.addSubview(bottomdSafeAreaCoverView)
        view.addSubview(collectionView)
        view.addSubview(divider2)
        
        postVStackView.addArrangedSubviews(postCountLabel, postLabel)
        followerVStackView.addArrangedSubviews(followerCountLabel, followerLabel)
        followingVStackView.addArrangedSubviews(followingCountLabel, followingLabel)
        userFollowInfoHStackView.addArrangedSubviews(postVStackView, followerVStackView, followingVStackView)
        userFollowInfoView.addSubview(userFollowInfoHStackView)
        userIntroduceVStackView.addArrangedSubviews(userIntroduceLabel1, userIntroduceLabel2, userIntroduceLabel3)
        followMessageMoreHStackview.addArrangedSubviews(followButton, messageButton, moreButton)
        gridImageView.addSubview(gridImage)
        bottomView.addSubview(profileTabBarIcon)
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
        divider1.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalTo(followMessageMoreHStackview.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
        }
        gridImageView.snp.makeConstraints {
            $0.width.equalTo(view.frame.width / 3)
            $0.height.equalTo(41)
            $0.top.equalTo(divider1.snp.bottom)
        }
        gridImage.snp.makeConstraints {
            $0.width.equalTo(22.5)
            $0.height.equalTo(22.5)
            $0.top.equalToSuperview().inset(8)
            $0.centerX.equalToSuperview()
        }
        sectionIndicator.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.width.equalTo(view.frame.width / 3)
            $0.top.equalTo(gridImageView.snp.bottom)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(sectionIndicator.snp.bottom).offset(1)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(divider2.snp.top).offset(1)
        }
        divider2.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(bottomView.snp.top)
            
        }
        bottomView.snp.makeConstraints {
            $0.height.equalTo(55)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        bottomdSafeAreaCoverView.snp.makeConstraints {
            $0.top.equalTo(bottomView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setUpCollectionViewLayout() -> UICollectionViewLayout {
        // 섹션에 대한 레이아웃을 정의합니다.
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0 / 3), heightDimension: .fractionalWidth(1.0 / 3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // 그룹을 설정합니다.
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0 / 3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item, item])

        // 섹션을 생성합니다.
        let section = NSCollectionLayoutSection(group: group)
        
        // 레이아웃을 반환합니다.
        return UICollectionViewCompositionalLayout(section: section)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageModel.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let image = ImageModel.images[indexPath.row]
        cell.configure(image)
        return cell
    }
}

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
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
