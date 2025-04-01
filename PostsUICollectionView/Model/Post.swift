//
//  Posts.swift
//  PostsUICollectionView
//
//  Created by Екатерина Яцкевич on 29.03.25.
//

import Foundation


struct Post {
    let profilePicture: String
    let userName: String
    let postImage: String
    let postTitle: String
    let postDate: String
    let postDescription: String
    
    static func getAllPosts() -> [Post] {
        [
            Post(profilePicture: "firstPerson" , userName: "User Name", postImage: "autumn", postTitle: "Ut enim ad minim veniam", postDate: "23 апреля 2024", postDescription: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in "),
            Post(profilePicture: "secondPerson" , userName: "User Name2", postImage: "mountain", postTitle: "Ut enim ad minim veniam  eiusmod tempor", postDate: "24 апреля 2024", postDescription: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore"),
            Post(profilePicture: "thirdPerson" , userName: "User Name3", postImage: "room", postTitle: "Ut enim ad minim veniam  eiusmod tempor", postDate: "25 апреля 2024", postDescription: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "),
            
            
        ]
    }
    
}
