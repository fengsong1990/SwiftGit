//
//  MainVC.swift
//  SwiftGit
//
//  Created by Apple on 2017/11/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class MyClass: NSObject {
}
private var key: Void?
extension MyClass{
    
    ///标题
    var title : String?{
        get{
            return objc_getAssociatedObject(self, &key) as? String
        }
        set{
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}



class MainVC: UIViewController {

    /**
     输出信息
     */
    func printLog<T>(message: T,
                     file: String = #file,
                     method: String = #function,
                     line: Int = #line)
    {
        #if DEBUG
            print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
        #endif
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        
        let my = MyClass()
        my.title = "asdfa"
        printLog(message: my.title!)
        
        let data = 1...3
        let result = data.lazy.map {
            (i: Int) -> Int in
            print("正在处理 \(i)")
            return i * 2
        }
        
        print("准备访问结果")
        for i in result {
            print("操作后结果为 \(i)")
        }
        
        print("操作完毕git命令测试，看看效果")
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
