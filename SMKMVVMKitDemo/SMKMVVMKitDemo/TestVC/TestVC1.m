
//
//  TestVC1.m
//  SMKMVVMKitDemo
//
//  Created by Mac on 17/5/23.
//  Copyright © 2017年 lovemo. All rights reserved.
//

#import "TestVC1.h"
#import "UIViewController+SMKControllerExtension.h"

@interface TestVC1 ()

@end

@implementation TestVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor redColor];

    NSLog(@"%@",self.smk_params);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    
}

@end
