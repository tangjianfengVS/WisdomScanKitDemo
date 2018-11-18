//
//  WisdomScanManager.swift
//  WisdomScanKitDemo
//
//  Created by jianfeng on 2018/11/9.
//  Copyright © 2018年 All over the sky star. All rights reserved.
//

import UIKit

class WisdomScanManager: NSObject {
    
   
    
    
}

extension UIViewController {
    
    /**  拍照  */
    public func startScanPhotos(type: WisdomScanningType,
                                photosTypes: WisdomPhotosType?,
                                photosTask: @escaping WisdomPhotosTask,
                                errorTask: @escaping WisdomErrorTask) {
        
        let photosVC = WisdomPhotosVC(types: type,
                                      photosTypes: photosTypes,
                                      photosTasks: photosTask,
                                      errorTasks: errorTask)
        switch type {
        case .push:
            if isKind(of: UINavigationController.self){
                (self as! UINavigationController).pushViewController(photosVC, animated: true)
            }else if navigationController != nil {
                navigationController!.pushViewController(photosVC, animated: true)
            }else{
                push(rootVC: photosVC)
            }
        case .present:
            present(photosVC, animated: true, completion: nil)
        }
    }
    
    /**  扫码  */
    public func startScanRQCode(type: WisdomScanningType,
                                themeTypes: WisdomRQCodeThemeType?,
                                navBarTask: WisdomNavBarTask,
                                answerTask: @escaping WisdomAnswerTask,
                                errorTask: @escaping WisdomErrorTask ) {
        
        let rqCodeVC = WisdomRQCodeVC(types: type,
                                      themeTypes: themeTypes,
                                      navBarTasks: navBarTask,
                                      answerTasks: answerTask,
                                      errorTasks: errorTask)
        switch type {
        case .push:
            if isKind(of: UINavigationController.self){
                (self as! UINavigationController).pushViewController(rqCodeVC, animated: true)
            }else if navigationController != nil {
                navigationController!.pushViewController(rqCodeVC, animated: true)
            }else{
                push(rqCodeVC: rqCodeVC, hideNavBar: rqCodeVC.hideNavBar)
            }
        case .present:
            var rootVC: UIViewController = rqCodeVC
            if !rqCodeVC.hideNavBar {
                let nav = UINavigationController(rootViewController: rqCodeVC)
                rqCodeVC.isCreatNav = true
                rootVC = nav
            }
            present(rootVC, animated: true, completion: nil)
        }
    }
}


extension UIViewController {
    private func push(rqCodeVC: WisdomRQCodeVC, hideNavBar: Bool) {
        var rootVC: UIViewController = rqCodeVC
        if !hideNavBar {
            let nav = UINavigationController(rootViewController: rqCodeVC)
            rqCodeVC.isCreatNav = true
            rootVC = nav
        }
        push(rootVC: rootVC)
    }
    
    private func push(rootVC: UIViewController) {
        addChild(rootVC)
        view.addSubview(rootVC.view)
        rootVC.view.transform = CGAffineTransform(translationX: view.bounds.width, y: 0)
        
        UIView.animate(withDuration: 0.35) {
            rootVC.view.transform = .identity
        }
    }
}
