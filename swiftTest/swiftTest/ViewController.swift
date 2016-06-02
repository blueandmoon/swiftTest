//
//  ViewController.swift
//  swiftTest
//
//  Created by 李根 on 16/6/2.
//  Copyright © 2016年 ligen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor();
        
        //  global测试
        var globalToken: dispatch_once_t = 0
        func calledOnce() {
            print(globalToken)
            dispatch_once(&globalToken) {
                print("Called once in global scope.")
            }
        }
        
        calledOnce()
        calledOnce()
        calledOnce()
        
        //  static测试
        class MyClass {
            private static var staticToken: dispatch_once_t = 0
            class func doItOnce() {
                print(staticToken)
                dispatch_once(&staticToken) { 
                    print("Called in static scope")
                }
            }
        }
        class MyClassSub: MyClass {
            override static func doItOnce() {
                super.doItOnce()
                print("called in sub class")
            }
        }
        MyClass.doItOnce()
        MyClass.doItOnce()
        MyClassSub.doItOnce()
        MyClassSub.doItOnce()
        
        //  local测试
        class LocalTest {
            func doItOnce() {
                var localToken: dispatch_once_t = 0
                dispatch_once(&localToken) { 
                    print("Called every time")
                }
                
            }
        }
        let localTest = LocalTest()
        localTest.doItOnce()
        localTest.doItOnce()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

