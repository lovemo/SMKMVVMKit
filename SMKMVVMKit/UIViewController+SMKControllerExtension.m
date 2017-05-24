//
//  UIViewController+SMKControllerExtension.m
//  SMKMVVMKitDemo
//
//  Created by Mac on 17/5/24.
//  Copyright © 2017年 lovemo. All rights reserved.
//

#import "UIViewController+SMKControllerExtension.h"
#import <objc/runtime.h>

@implementation UIViewController (SMKControllerExtension)

- (id)smk_routeParams {
    return objc_getAssociatedObject(self, @selector(smk_routeParams));
}
- (void)setSmk_routeParams:(id)smk_routeParams {
    objc_setAssociatedObject(self, @selector(smk_routeParams), smk_routeParams, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
