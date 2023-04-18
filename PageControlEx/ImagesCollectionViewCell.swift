//
//  ImagesCollectionViewCell.swift
//  PageControlEx
//
//  Created by mayank ranka on 18/04/23.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {
    
    var imagesView = UIImageView()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
            contentView.addSubview(imagesView)
        imagesView.contentMode = .scaleAspectFill
        imagesView.clipsToBounds = true
        imagesView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imagesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagesView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imagesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
