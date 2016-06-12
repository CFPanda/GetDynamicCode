//
//  AuthCodeView.swift
//  GetDynamicCode
//
//  Created by duanchuanfen on 16/6/2.
//  Copyright © 2016年 duanchuanfen. All rights reserved.
//

import UIKit

class AuthCodeView: UIView {
    var dataSoure:NSMutableArray?
    var codeStr:NSMutableString?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                    self.layer.cornerRadius = 5.0
            self.layer.masksToBounds = true
            self.backgroundColor = UIColor.cyanColor()
            self.getAuthcode()//获得随机验证码
       
            }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        self.backgroundColor = UIColor(colorLiteralRed:Float(Int(arc4random())%256)/255.0, green:Float(Int(arc4random())%256)/255.0, blue:Float(Int(arc4random())%256)/255.0, alpha: 1.0)
        let text:NSString = NSString(format: "%@", codeStr!)
        let size:CGSize = ("A" as NSString).sizeWithAttributes([NSAttachmentAttributeName:(UIFont.systemFontOfSize(20))])
        let width:Int = Int(rect.size.width)/text.length-Int(size.width)
        let height:Int = Int(rect.size.height-size.height);
        var point:CGPoint;
        var pX:CGFloat
        var pY:CGFloat
        for i in 0...text.length-1{
         pX = CGFloat(Int(arc4random())%Int(width)+Int(rect.size.width)/text.length*i)
         pY = CGFloat(Int(arc4random())%Int(height))
            point = CGPointMake(pX, pY)
            let c:unichar = text.characterAtIndex(i)
            let textC:NSString = NSString(format: "%C", c)
        
            textC.drawAtPoint(point, withAttributes: [NSAttachmentAttributeName:(UIFont.systemFontOfSize(CGFloat((Int)(arc4random()) % 5 + 15))),NSForegroundColorAttributeName:UIColor(colorLiteralRed:Float(Int(arc4random())%256)/255.0, green:Float(Int(arc4random())%256)/255.0, blue:Float(Int(arc4random())%256)/255.0, alpha: 1.0)])
        }
        let context:CGContextRef = UIGraphicsGetCurrentContext()!;
        //设置线条宽度
        CGContextSetLineWidth(context, 1.0)
        
        
        //绘制干扰线
        for _ in 0...3
        {
           let color:UIColor = UIColor(colorLiteralRed:Float(Int(arc4random())%256)/255.0, green:Float(Int(arc4random())%256)/255.0, blue:Float(Int(arc4random())%256)/255.0, alpha: 1.0)
            CGContextSetStrokeColorWithColor(context, color.CGColor);//设置线条填充色
            
            //设置线的起点
            pX = CGFloat(Int(arc4random()) % Int(rect.size.width))
            pY = CGFloat(Int(arc4random()) % Int(rect.size.height))
            CGContextMoveToPoint(context, pX, pY);
            //设置线终点
            pX = CGFloat(Int(arc4random()) % Int(rect.size.width))
            pY = CGFloat(Int(arc4random()) % Int(rect.size.height))
            CGContextAddLineToPoint(context, pX, pY);
            //画线
            CGContextStrokePath(context);
        
        }
    }
   
    func getAuthcode(){
        
        dataSoure = NSMutableArray(objects: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")
     
       codeStr = NSMutableString(capacity: 4)
        for _ in 0...3{
           
            let index:UInt32 =  arc4random_uniform(25)
            let tempStr:NSString = (dataSoure?.objectAtIndex(Int(index)))! as! NSString
            codeStr?.appendString(tempStr as String)
            
        }
     
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    
            self.getAuthcode()
            print(codeStr)
            //setNeedsDisplay调用drawRect方法来实现view的绘制
            self.setNeedsDisplay()
        
        
    }
   
}
