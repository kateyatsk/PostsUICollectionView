//
//  PostCell.swift
//  PostsUICollectionView
//
//  Created by Екатерина Яцкевич on 1.04.25.
//

import UIKit

final class PostCell: UICollectionViewCell {
    static let reuseIdentifier = "PostCell"
    
    private var cellWidth = UIScreen.main.bounds.width - 60
    
    lazy var profilePicture: UIImageView = {
        $0.layer.cornerRadius = 22
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    lazy var postImage: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    lazy var userNameLabel: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var dateLabel: UILabel = {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .gray
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var titleLabel: UILabel = {
        $0.font = .systemFont(ofSize: 22, weight: .bold)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var descriptionLabel: UILabel = {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubviews(profilePicture, postImage, dateLabel, titleLabel, descriptionLabel, userNameLabel)
        contentView.backgroundColor = .grayBackground
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(post: Post) {
        profilePicture.image = UIImage(named: post.profilePicture)
        postImage.image = UIImage(named: post.postImage)
        dateLabel.text = post.postDate
        titleLabel.text = post.postTitle
        descriptionLabel.text = post.postDescription
        userNameLabel.text = post.userName
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        let imageRatio = postImage.image?.getRatio() ?? 1
        let imageHeight = cellWidth * imageRatio
        
        NSLayoutConstraint.activate([
            profilePicture.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            profilePicture.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            profilePicture.widthAnchor.constraint(equalToConstant: 44),
            profilePicture.heightAnchor.constraint(equalToConstant: 44),
            
            postImage.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 20),
            postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            postImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            postImage.widthAnchor.constraint(equalToConstant: cellWidth - 40),
            postImage.heightAnchor.constraint(equalToConstant: imageHeight),
            
            userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            userNameLabel.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 20),
            
            dateLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 9),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            titleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)

            
        
        ])
    }
    
}
