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

- (id)smk_params {
    return objc_getAssociatedObject(self, @selector(smk_params));
}
- (void)setSmk_params:(id)smk_params {
    objc_setAssociatedObject(self, @selector(smk_params), smk_params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
