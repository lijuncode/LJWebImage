//
//  String+Path.swift
//  LIJWebImage
//
//  Created by  李俊 on 15/7/27.
//  Copyright © 2015年  李俊. All rights reserved.
//

import Foundation

extension String {
    
    func documentPath() -> String {
        
        let path = NSSearchPathForDirectoriesInDomains( .DocumentDirectory, .UserDomainMask, true).last
        
        let nsPath: NSString = path!
        let nsSelf: NSString = self
        
        return nsPath.stringByAppendingPathComponent(nsSelf.lastPathComponent)
    }
    
    func cachesPath() -> String {
        
        let path = NSSearchPathForDirectoriesInDomains( .CachesDirectory, .UserDomainMask, true).last
        
        let nsPath: NSString = path!
        let nsSelf: NSString = self
        
        return nsPath.stringByAppendingPathComponent(nsSelf.lastPathComponent)
    }
    
    func tempPath() -> String {
        
        let path: NSString = NSTemporaryDirectory()
        
        let nsSelf: NSString = self
        
        return path.stringByAppendingPathComponent(nsSelf.lastPathComponent)
        
    }
    
    
    
}
