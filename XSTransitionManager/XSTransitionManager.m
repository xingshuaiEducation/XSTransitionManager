//
//  XSTransitionManager.m
//  AppmediatorManager
//
//  Created by suxx on 2017/6/23.
//  Copyright © 2017年 suxx. All rights reserved.
//

#import "XSTransitionManager.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

@implementation XSTransitionManager

#pragma mark - Delegate

#pragma mark - Event Handle

#pragma mark - Private Method
//判断一个类myClass中是否包含属性name
+ (BOOL)getVariableWithClass:(Class) myClass varName:(NSString *)name{	unsigned int outCount, i;
    Ivar *ivars = class_copyIvarList(myClass, &outCount);
    for (i = 0; i < outCount; i++) {
        Ivar property = ivars[i];
        NSString *keyName = [NSString stringWithCString:ivar_getName(property) encoding:NSUTF8StringEncoding];
        keyName = [keyName stringByReplacingOccurrencesOfString:@"_" withString:@""];
        if ([keyName isEqualToString:name]) {
            return YES;
        }
    }
    return NO;
}

+(UIViewController *)viewController:(NSString *)vcStr params:(NSDictionary *)paramDic{
    Class class = NSClassFromString(vcStr);
    UIViewController *vc = [[class alloc] init];
    NSArray *keyArr = [paramDic allKeys];
    NSArray *valueArr = [paramDic allValues];
    
    [keyArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([self getVariableWithClass:class varName:obj]) {
            [vc setValue:valueArr[idx] forKey:obj];
        }
    }];
    
    return vc;
}

#pragma mark - Public Method
+(UIViewController *)viewControllerWithStoryboardName:(NSString *)storybard_name storyboardID:(NSString *)storyboard_id{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:storybard_name bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:storyboard_id];
}

+(void)pushToViewController:(NSString *)storybard_name sotryboardId:(NSString *)storyboard_id from:(UIViewController *)viewController{
        UIStoryboard *sb = [UIStoryboard storyboardWithName:storybard_name bundle:nil];
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:storyboard_id];
        if (vc && viewController) {
            [viewController.navigationController pushViewController:vc animated:YES];
        }
}

+(UIViewController *)viewControllerWithName:(NSString *)viewController_name{
    Class class = NSClassFromString(viewController_name);
    return [[class alloc] init];
}

+(void)pushToViewController:(NSString *)viewController_name params:(NSDictionary<NSString *,id> *)params from:(UIViewController *)viewController{
    Class class = NSClassFromString(viewController_name);
    UIViewController *vc = [[class alloc] init];
    NSArray *keyArr = [params allKeys];
    NSArray *valueArr = [params allValues];
    
    [keyArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([self getVariableWithClass:class varName:obj]) {
            [vc setValue:valueArr[idx] forKey:obj];
        }
    }];
    
    if (vc && viewController) {
        [viewController.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - Getter 和 Setter

@end
