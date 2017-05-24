//
//  SMKRouter.h
//  SMKMVVMKitDemo
//
//  Created by Mac on 17/5/23.
//  Copyright © 2017年 lovemo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMKSingleton.h"

typedef enum : NSUInteger {
    SMKRoutePushType,
    SMKRouteModelType,
    SMKRoutePopType,
    SMKRouteDismissType,
} SMKRouteType;

@interface SMKRouteOptions : NSObject

@property (nonatomic, assign) SMKRouteType  smk_routeType;

@property (nonatomic, retain) id smk_routeParams;

@property (nonatomic, assign) BOOL  smk_hideBar;

@end

@interface SMKCManger : NSObject

SMKSingletonH(Manger)

- (void)open:(id)controller handle:(BOOL(^)(SMKRouteOptions *options))handle
                                                completion:(void (^)())completion;


@end
