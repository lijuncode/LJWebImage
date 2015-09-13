//
//  Cell.swift
//  LIJWebImage
//
//  Created by  李俊 on 15/7/28.
//  Copyright © 2015年  李俊. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var download: UILabel!
    
    var app: AppInfo? {
        
        didSet{
            
            appIcon.setWebImage(self.app!.icon!)
            name.text = self.app!.name!
            download.text = self.app!.download!
            
        }
    }

    override func prepareForReuse() {
        
        appIcon.image = nil
        name.text = nil
        download.text = nil
        
    }
    
    
}
