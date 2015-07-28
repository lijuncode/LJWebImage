//
//  UIImageView+WebImage.swift
//  LIJWebImage
//
//  Created by  李俊 on 15/7/15.
//  Copyright (c) 2015年  李俊. All rights reserved.
//

import Foundation
import UIKit


private var xoAssociationKey: String = "likumb.com.LIJWebImage"
extension UIImageView {
   
    var urlParh: String?{
        get{
            return objc_getAssociatedObject(self, &xoAssociationKey) as? String
            
        }
        set{
            
            objc_setAssociatedObject(self, &xoAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    func setWebImage(path: String){
        
        if urlParh != nil && urlParh != path{
            
            WebImageManager.sharedInstance.cancelOperation(urlParh!)
            
        }
        
        urlParh = path
    
        WebImageManager.sharedInstance.downloadWebImage(urlParh!, complition: { (image) -> () in
            
            self.image = image
            
            self.urlParh = nil
        })
        
        
    }
    
}