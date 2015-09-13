//
//  LIJOperation.swift
//  LIJWebImage
//
//  Created by  李俊 on 15/7/15.
//  Copyright (c) 2015年  李俊. All rights reserved.
//

import UIKit

class LIJOperation: NSOperation {
    
    
    var path: String?
    
    var  completion: ((UIImage) -> Void)?
    
    class func operationWith(path: String , complition: (image:UIImage) -> ()) -> LIJOperation{
    
        let op = LIJOperation()
        op.path = path
        op.completion = complition
        
        return op
        
    }
    
    override func main() {
        
        if self.cancelled {
            return
        }
        
        var image: UIImage?
        
        if path != nil{
        
//            NSThread.sleepForTimeInterval(5)
            
            let url = NSURL(string: path!)
            
            let data = NSData(contentsOfURL: url!)
            
            if (self.cancelled) {return}
            
            if let imageData = data {
                image = UIImage(data: imageData)
                
                imageData.writeToFile(path!.cachesPath(), atomically: true)
                
            } else {
                print("网络不给力")
            }
        }
        
        
        if (self.cancelled) {return}
        
        if completion != nil && image != nil{
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                
                self.completion!(image!)
            })
            
        }
    }
    
   
   
}
