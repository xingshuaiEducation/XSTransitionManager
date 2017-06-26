//
//  XSTransitionManager.h
//  AppmediatorManager
//
//  Created by suxx on 2017/6/23.
//  Copyright © 2017年 suxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XSTransitionManager : NSObject

/***************storyboard的相关方法*******************/
/**
 从storyboard中实现化一个对象

 @param storybard_name storyboard的名字
 @param storyboard_id Storyboard ID
 @return 实例化的对象,没有则返回nil
 */
+(UIViewController *)viewControllerWithStoryboardName:(NSString *)storybard_name storyboardID:(NSString *)storyboard_id;


/**
 从视图控制器viewController跳转到实例化的对象

 @param storybard_name storyboard的名字
 @param storyboard_id Storyboard ID
 @param viewController 即将要跳转的视图控制器
 */
+(void)pushToViewController:(NSString *)storybard_name sotryboardId:(NSString *)storyboard_id from:(UIViewController *)viewController;

/********************************************/

/**
 根据视图控制器名字实例化一个对象

 @param viewController_name 视图控制器的名字
 @return 实例化的对象，没有则返回nil
 */
+(UIViewController *)viewControllerWithName:(NSString *)viewController_name;

/**
  从视图控制器viewController跳转到实例化的对象

 @param viewController_name 实例化对象的名字
 @param params 实例化对象的参数
 @param viewController 即将要跳转的视图控制器
 */
+(void)pushToViewController:(NSString *)viewController_name params:(NSDictionary<NSString *,id> *)params from:(UIViewController *)viewController;


@end
