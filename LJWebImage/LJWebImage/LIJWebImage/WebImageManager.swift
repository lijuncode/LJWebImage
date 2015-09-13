//
//  WebImageManager.swift
//  LIJWebImage
//
//  Created by  李俊 on 15/7/15.
//  Copyright (c) 2015年  李俊. All rights reserved.
//

import UIKit

class WebImageManager: NSObject {
    
    let queue = NSOperationQueue()
    
    var imageCache = NSCache()
    
    var operationCache = NSMutableDictionary()
    
    class var sharedInstance: WebImageManager {
        
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: WebImageManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = WebImageManager()
        }
        return Static.instance!
    }
    
    private override init() {
        
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receviMomeryWorning", name: UIApplicationDidReceiveMemoryWarningNotification, object: nil)
    }
    
    func cancelOperation(path: String){
        
        if let op = self.operationCache[path] as? NSOperation{
        
            op.cancel()
            
            operationCache.removeObjectForKey(path)
        
            print("取消下载")
        }
        
    }
    
    func downloadWebImage(path: String, complition: (image: UIImage) -> ()){
        
        if let ime = imageCache.objectForKey(path) as? UIImage {
            
            print("从内存中加载")
            complition(image: ime)
            
            
            return
            
        }
        
        let imagePath = path.cachesPath()
        
//       print(imagePath)
        
        if let ime = UIImage(contentsOfFile: imagePath) {
            
            complition(image: ime)
            
            imageCache.setObject(ime, forKey: path)
            
            
            print("从沙盒中加载")
            
            return
            
        }
        
        if let _ = self.operationCache[path] as? NSOperation {
            
            print("正在玩命下载中")
            
            return
        }
        
        
        print("开始下载")
        let op = LIJOperation.operationWith(path, complition: { (image) -> () in
            
            print("下载完成")
            
           self.operationCache.removeObjectForKey(path)
            self.imageCache.setObject(image, forKey: path)
            
                
                complition(image: image)
            
        })
        
        operationCache.setValue(op, forKey: path)
        
        queue.addOperation(op)
        
    }
    
     func receviMomeryWorning() {
        
        imageCache.removeAllObjects()
        operationCache.removeAllObjects()
        
    }
    
//    func test(){
//        
//    }
}
