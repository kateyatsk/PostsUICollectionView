//
//  ViewController.swift
//  PostsUICollectionView
//
//  Created by Екатерина Яцкевич on 28.03.25.
//

import UIKit

final class ViewController: UIViewController {
    var posts: [Post] = Post.getAllPosts()
  
    lazy var layout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = 30
        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        return $0
    }(UICollectionViewFlowLayout())

    lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        $0.register(PostCell.self, forCellWithReuseIdentifier: PostCell.reuseIdentifier)
 
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: layout))
    
    lazy var transformLayoutButton: UIButton = {
        $0.setTitle("Transform", for: .normal)
        $0.backgroundColor = .brown
        $0.layer.cornerRadius = 20
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addAction(UIAction(handler: { _ in self.setNewFlowLayout()} ), for: .touchUpInside)
        return $0
    }(UIButton())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(collectionView, transformLayoutButton)
        
        NSLayoutConstraint.activate([

            transformLayoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            transformLayoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            transformLayoutButton.widthAnchor.constraint(equalToConstant: 120),
            transformLayoutButton.heightAnchor.constraint(equalToConstant: 50)
           
        ])
    }

    func setNewFlowLayout() {
        
        let newLayout = UICollectionViewFlowLayout()
        newLayout.scrollDirection = .vertical
        newLayout.minimumLineSpacing = 10
        newLayout.minimumInteritemSpacing = 10
        newLayout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        newLayout.itemSize = CGSize(width: 159, height: 159)
    
        collectionView.setCollectionViewLayout(newLayout, animated: true)
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCell.reuseIdentifier, for: indexPath) as? PostCell {

            cell.configure(post: posts[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}




extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach{addSubview($0)}
    }
}

extension UIImage {
    func getRatio() -> CGFloat {
        self.size.height / self.size.width
    }
}
