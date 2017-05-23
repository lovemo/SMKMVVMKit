//
//  SMKRouterProtocol.h
//  SMKMVVMKitDemo
//
//  Created by Mac on 17/5/23.
//  Copyright © 2017年 lovemo. All rights reserved.
//

#ifndef SMKRouterProtocol_h
#define SMKRouterProtocol_h

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    SMKRouterPushType,
    SMKRouterModelType,
    
} SMKRouterType;

@protocol SMKRouterProtocol <NSObject>
@optional

- (instancetype)map:(NSString *)url controller:(Class)controller;

- (void)open:(NSString *)url routeType:(SMKRouterType)routeType handle:(BOOL(^)())block;

@end

#endif /* SMKRouterProtocol_h */
