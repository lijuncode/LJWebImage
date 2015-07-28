//
//  AppInfo.swift
//  LIJWebImage
//
//  Created by  李俊 on 15/7/15.
//  Copyright (c) 2015年  李俊. All rights reserved.
//

import UIKit

class AppInfo: NSObject {
    
    var icon: String?
    var name: String?
    var download: String?
    
    
    class func appInfo() -> NSArray {
        
        let path = NSBundle.mainBundle().pathForResource("apps", ofType: "plist");
        
        let apps = NSArray(contentsOfFile: path!)!
        
        let appInfos = NSMutableArray()
        
        for obj in apps{
            
            let appInfo = AppInfo()
            
            appInfo.setValuesForKeysWithDictionary(obj as! [String : AnyObject])
            
        
            appInfos.addObject(appInfo)
        
        }

        return appInfos
    }
    
    
   
}
