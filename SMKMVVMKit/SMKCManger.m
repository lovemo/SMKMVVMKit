//
//  SMKRouter.m
//  SMKMVVMKitDemo
//
//  Created by Mac on 17/5/23.
//  Copyright © 2017年 lovemo. All rights reserved.
//

#import "SMKCManger.h"
#import <UIKit/UIKit.h>
#import "UIViewController+SMKControllerExtension.h"

@interface SMKCManger ()

@property (readwrite, nonatomic, strong) NSMutableDictionary *routes;

@end

@implementation SMKCManger

SMKSingletonM(Manger)


- (void)open:(id)controller handle:(BOOL (^)(SMKRouteOptions *))handle
    completion:(void (^)())completion {
    
    SMKRouteOptions *options = [[SMKRouteOptions alloc] init];
    if (handle(options)) {

        UIViewController *visible = [SMKCManger visibleViewController];
        UIViewController *vc = nil;
        
        if ([controller isKindOfClass:[NSString class]]) {
            controller = NSClassFromString(controller);
        }
        
        vc = [[controller alloc] init];
        vc.smk_routeParams = options.smk_routeParams;
        
        switch (options.smk_routeType) {
            case SMKRoutePushType:
                NSAssert(visible.navigationController, @"navigationController must have a value");
                visible.hidesBottomBarWhenPushed = options.smk_hideBar;
                [visible.navigationController pushViewController:vc animated:YES];
                break;
            case SMKRouteModelType: {
                    [visible presentViewController:vc animated:YES completion:^{
                        !completion ?: completion();
                    }];
                }
                break;
            case SMKRoutePopType:
                NSAssert(visible.navigationController, @"navigationController must have a value");
                [visible.navigationController popViewControllerAnimated:YES];
                break;
            case SMKRouteDismissType: {
                [visible dismissViewControllerAnimated:YES completion:^{
                    !completion ?: completion();
                }];
            }
                break;
            default:
                break;
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

@implementation SMKRouteOptions


@end
