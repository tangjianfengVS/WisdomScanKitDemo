//
//  WisdomViewController.swift
//  WisdomScanKitDemo
//
//  Created by jianfeng on 2018/11/10.
//  Copyright © 2018年 All over the sky star. All rights reserved.
//

import UIKit

class WisdomViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func clickScanRQCode(_ sender: UIButton) {
        
        startScanRQCode(type: .push, themeTypes: .green, navDelegate: nil, answerTask: { (str, session) in
            
        }) { (session, type) -> (Bool) in
            
            return true
        }
    }
    
    @IBAction func clickScanPhoto(_ sender: UIButton) {
        
        startScanPhotos(type: .push, photoCountType: .nine, photosTask: { (list) in
            
        }) { (type) -> (Bool) in
            
            return true
        }
    }
    
    @IBAction func clickScanBackCard(_ sender: UIButton) {
        
        startSelectSystemPhoto(type: .push, setectTypes: .group, photoCountTypes: .nine, navDelegate: nil, photoTasks: { (list) in
            
        }) { (error) -> (Bool) in
            
            return true
        }
    }
}

extension WisdomViewController: WisdomScanNavbarDelegate{
    func wisdomNavbarBackBtnItme(navigationVC: UINavigationController?) -> UIButton {
        let btn = UIButton()
        btn.setTitle("返回", for: .normal)
        return btn
    }
    
    func wisdomNavbarThemeTitle(navigationVC: UINavigationController?) -> String {
        return "Wisdom Scan"
    }
    
    func wisdomNavbarRightBtnItme(navigationVC: UINavigationController?) -> UIButton? {
        return nil
    }
}
