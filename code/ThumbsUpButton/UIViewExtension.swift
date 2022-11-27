//
//  UIViewExtension.swift
//  ThumbsUpButton
//
//  Created by kim on 2022/11/26.
//

import UIKit

extension UIView{
    var left:CGFloat{
        get{
            return self.frame.origin.x
        }
        
        set{
            var rect = self.frame
            rect.origin.x = newValue
            self.frame = rect
        }
    }
    
    var right:CGFloat{
        get{
            return self.frame.origin.x + self.frame.size.width
        }
        
        set{
            var rect = self.frame
            rect.origin.x = newValue - rect.size.width
            self.frame = rect
        }
    }
    
    var top:CGFloat{
        get{
            return self.frame.origin.y
        }
        
        set{
            var rect = self.frame
            rect.origin.y = newValue
            self.frame = rect
        }
    }
    
    var bottom:CGFloat{
        get{
            return self.frame.origin.y + self.frame.size.height
        }
        
        set{
            var rect = self.frame
            rect.origin.y = newValue - rect.size.height
            self.frame = rect
        }
    }
    
    var width:CGFloat{
        get{
            return self.frame.size.width
        }
        
        set{
            var rect = self.frame
            rect.size.width = newValue
            self.frame = rect
        }
    }
    
    var height:CGFloat{
        get{
            return self.frame.size.height
        }
        
        set{
            var rect = self.frame
            rect.size.height = newValue
            self.frame = rect
        }
    }
    
    var centerX:CGFloat{
        get{
            return self.center.x
        }
        
        set{
            self.center = CGPointMake(newValue, self.center.y)
        }
    }
    
    var centerY:CGFloat{
        get{
            return self.center.y
        }
        
        set{
            self.center = CGPointMake(self.center.x, newValue)
        }
    }

}
