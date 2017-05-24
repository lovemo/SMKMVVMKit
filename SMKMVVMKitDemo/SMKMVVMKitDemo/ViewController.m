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
#import "SMKCManger.h"
#import "LxDBAnything.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [[SMKCManger sharedManger] open:@"TestVC1" handle:^BOOL(SMKRouteOptions *options) {
        options.smk_routeType = SMKRouteModelType;
        options.smk_params = @{@"text" : @"fdfffffffffffff"};
        return YES;
    } completion:nil];

    
}

@end
