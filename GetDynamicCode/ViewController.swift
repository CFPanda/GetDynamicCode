//
//  ViewController.swift
//  GetDynamicCode
//
//  Created by duanchuanfen on 16/6/2.
//  Copyright © 2016年 duanchuanfen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var dataArray:NSMutableArray?
    var authCodeStr:NSMutableString?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let codeView:AuthCodeView = AuthCodeView(frame:CGRectMake(100,100,100,30))
        self.view.addSubview(codeView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}

