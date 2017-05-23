//
//  SMKRouter.h
//  SMKMVVMKitDemo
//
//  Created by Mac on 17/5/23.
//  Copyright © 2017年 lovemo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMKRouterProtocol.h"
#import "SMKSingleton.h"

@interface SMKRouter : NSObject<SMKRouterProtocol>

SMKSingletonH(Router)

@end
