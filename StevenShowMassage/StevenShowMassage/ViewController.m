//
//  ViewController.m
//  StevenShowMassage
//
//  Created by 李方建 on 2018/6/9.
//  Copyright © 2018年 李方建. All rights reserved.
//

#import "ViewController.h"
#import "STMassgeManager.h"

@interface ViewController ()
@property (nonatomic,assign)int mark;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 80, 40)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(butAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)butAction{
    self.mark++;
    NSString *haha= [NSString stringWithFormat:@"你好世界---%d",self.mark];
    [[STMassgeManager shared] showMassage:haha];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
