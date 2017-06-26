# XSTransitionManager
模块之间解耦合跳转，因为是在中介者里面跳转，所以不封装成类别。    

使用介绍：    
1.cocoapod引入：    
  pod 'XSTransitionManager', :git => 'https://github.com/xingshuaiEducation/XSTransitionManager.git'   
 
2.引入头文件：
  #import <XSTransitionManager.h>   
 
3.使用代码：    
  [XSTransitionManager pushToViewController:要跳转的类的名字（字符串） params:传递的参数（字典，没有为nil） from:self];
