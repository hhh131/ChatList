//
//  ChatListViewController.swift
//  ChatList
//
//  Created by 신희권 on 2023/01/12.
//

import UIKit

class ChatListViewController: UIViewController {

    @IBOutlet var colletionView: UICollectionView!
    var chatList : [Chat] = Chat.list
    override func viewDidLoad() {
            super.viewDidLoad()

        colletionView.dataSource = self
        colletionView.delegate = self
        
        chatList = chatList.sorted(by: { Chat1, Chat2 in
            return Chat1.date > Chat2.date
        })
        
    }
    
    
}


extension ChatListViewController : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatListCollectionViewCell", for: indexPath) as? ChatListCollectionViewCell else {
           return UICollectionViewCell()
        }
        
        let chat = chatList[indexPath.item]
        cell.configure(chat)
        
        return cell
    }
    
}

extension ChatListViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.bounds.width, height: 100)
        
    }
    
}
