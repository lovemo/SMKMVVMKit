//
//  ViewController.m
//  SMKMVVMKitDemo
//
//  Created by Mac on 17/5/23.
//  Copyright © 2017年 lovemo. All rights reserved.
//

#import "ViewController.h"
#import "TestVC1.h"
#import "TestVC2.h"
#import "SMKRouter.h"
#import "LxDBAnything.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[SMKRouter sharedRouter] map:@"/user" controller:[TestVC1 class]];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [[SMKRouter sharedRouter]open:@"/user" routeType:SMKRouterModelType handle:^BOOL{
        
        return YES;
    }];
    
}

@end
