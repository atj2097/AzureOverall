//
//  AddToCart.swift
//  AzureOverall
//
//  Created by God on 3/28/20.
//  Copyright © 2020 Adam Jackson. All rights reserved.
//

import UIKit

class AddToCart: UIButton {
    var addToCart = "Add To Cart"
    var newImage = UIImage(systemName: "plus.circle.fill")
    
    
    
    func setUpCartButton(button: AddToCart, target: Any?, action: Selector, width: Int, height: Int) {
        
        setTitleColor(.white, for: .normal)
        setTitle(addToCart, for: .normal)
        backgroundColor = AzureConstants.azureGreen
        setImage(newImage, for: .normal)
        tintColor = .white

        
        //Frame
        frame = CGRect(x: 0, y: 0, width: width, height: height)
        layer.cornerRadius = frame.height / 2
        layer.shadowColor = UIColor(red: 35/255, green: 46/255, blue: 33/255, alpha: 1).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0.5)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 1
        
        //Action
        addTarget(target, action: action, for: .touchUpInside)
        
    }
    

    

}
