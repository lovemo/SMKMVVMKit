//
//  SMKRouter.m
//  SMKMVVMKitDemo
//
//  Created by Mac on 17/5/23.
//  Copyright © 2017年 lovemo. All rights reserved.
//

#import "SMKRouter.h"
#import <UIKit/UIKit.h>

@interface SMKRouter ()

@property (readwrite, nonatomic, strong) NSMutableDictionary *routes;

@end

@implementation SMKRouter

SMKSingletonM(Router)

- (instancetype)map:(NSString *)url controller:(Class)controller {
    NSAssert([self checkString:url], @"url must have a value");
    [self.routes setObject:controller forKey:url];

    return nil;
}

- (void)open:(NSString *)url routeType:(SMKRouterType)routeType handle:(BOOL (^)())block {
    NSAssert([self checkString:url], @"url must have a value");
    Class class = [self.routes objectForKey:url];
    UIViewController *controller = [[class alloc] init];
    
    if (block && block()) {
        if (routeType == SMKRouterPushType) {
            [[SMKRouter visibleViewController].navigationController pushViewController:controller animated:YES];
        } else {
            [[SMKRouter visibleViewController]presentViewController:controller animated:YES completion:nil];
        }
    }
    
}

- (BOOL)checkString:(NSString *)string {
    if (string == nil || [string isEqualToString:@""]) return NO;
    return YES;
}

+ (__kindof UIViewController *)visibleViewController {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (window == nil) return nil;
    
    return [self getVisibleViewControllerFrom:window.rootViewController];
}

+ (__kindof UIViewController *)getVisibleViewControllerFrom:(__kindof UIViewController *)viewController {
    
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        return [self getVisibleViewControllerFrom:[viewController visibleViewController]];
    } else if ([viewController isKindOfClass:[UITabBarController class]]) {
        return [self getVisibleViewControllerFrom:[viewController selectedViewController]];
    } else if (viewController == viewController.presentedViewController) {
        return [self getVisibleViewControllerFrom:viewController];
    } else {
        return viewController;
    }

}

- (NSMutableDictionary *)routes {
    if (!_routes) {
        _routes = [NSMutableDictionary dictionary];
    }
    return _routes;
}

@end
