//
//  CartItemCell.swift
//  AzureOverall
//
//  Created by God on 3/30/20.
//  Copyright © 2020 Adam Jackson. All rights reserved.
//

import UIKit

class CartItemCell: UITableViewCell {
    lazy var recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        UIUtilities.setUILabel(label, labelTitle: "", size: 14, alignment: .left)
        return label
    }()
    
    lazy var numberOfTimes: UILabel = {
        let label = UILabel()
               UIUtilities.setUILabel(label, labelTitle: "", size: 14, alignment: .left)
               return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          addSubviews()
          constraints()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
      
      // MARK: - Lifecycle Functions
      override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
      }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func addSubviews() {
        addSubview(recipeImageView)
        addSubview(title)
        addSubview(numberOfTimes)
    }
    
    private func constraints() {
        recipeImageView.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        numberOfTimes.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Recipe Image
        recipeImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        recipeImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        recipeImageView.heightAnchor.constraint(equalToConstant: contentView.bounds.height).isActive = true
        recipeImageView.widthAnchor.constraint(equalToConstant: contentView.bounds.width).isActive = true
        
        //Title
        title.leftAnchor.constraint(equalTo: recipeImageView.rightAnchor, constant: 15).isActive = true
        title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        //# Of Times in Cart
        numberOfTimes.leftAnchor.constraint(equalTo: title.rightAnchor, constant: 15).isActive = true
        numberOfTimes.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }

}
