//
//  ChatListCollectionViewCell.swift
//  ChatList
//
//  Created by 신희권 on 2023/01/12.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var thumnaliImg: UIImageView!
  
    override  func awakeFromNib() {
        super.awakeFromNib()
        thumnaliImg.layer.cornerRadius = 20
    }
    
    func configure(_ chat : Chat){
        thumnaliImg.image = UIImage(named: chat.name)
        nameLabel.text = chat.name
        chatLabel.text = chat.chat
        dateLabel.text = formmateddateString(dateString: chat.date)
        
    }

    func formmateddateString(dateString : String) -> String {
        let formaater = DateFormatter()
        formaater.dateFormat = "yyyy-MM-dd"
        
        if let date = formaater.date(from: dateString){
            formaater.dateFormat="M/d"
            return formaater.string(from: date)
            
        } else {
            return ""
        }
            
        
    }

}
