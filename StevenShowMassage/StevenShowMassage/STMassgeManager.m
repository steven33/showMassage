//
//  STMassgeManager.m
//  StevenShowMassage
//
//  Created by 李方建 on 2018/6/9.
//  Copyright © 2018年 李方建. All rights reserved.
//

#import "STMassgeManager.h"
@interface STMassgeManager ()
@property (nonatomic, strong) UIWindow *showWindow;
@property (nonatomic, strong) UIView *topBar;
@property (nonatomic ,strong) UILabel *massageLabel;
@property (nonatomic,strong)NSMutableArray *massages;
@property (nonatomic,assign)BOOL isShow;

@end
@implementation STMassgeManager
+ (STMassgeManager*)shared{
    static dispatch_once_t once;
    static STMassgeManager *shared;
    dispatch_once(&once, ^ {
        shared = [[STMassgeManager alloc] init];
        
    });
    return shared;
}
- (void)showMassage:(NSString *)massage{
    [self.massages addObject:massage];
    if (self.isShow == NO) {
        [self showInFirst];
    }

}

- (void)showInFirst{
    if (self.massages.count >0) {
        NSString *str =self.massages[0];
        
        self.isShow = YES;
        self.showWindow.hidden = NO;
        [UIView animateWithDuration:0.35 animations:^{
            self.massageLabel.text = str;
            self.showWindow.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60);
        } completion:^(BOOL finished) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5/2*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.35 animations:^{
                    self.showWindow.frame = CGRectMake(0, -60, [UIScreen mainScreen].bounds.size.width, 60);
                } completion:^(BOOL finished) {
                    
                    self.showWindow.hidden = YES;
                    [self.massages removeObjectAtIndex:0];
                    self.isShow = NO;
                    [self showInFirst];
                }];
            });
            
        }];
    }

}

#pragma mark-----UI
- (NSMutableArray *)massages{
    if (!_massages) {
        _massages = [NSMutableArray array];
    }
    return _massages;
}
- (UIWindow *)showWindow {
    if(!_showWindow) {
        _showWindow = [[UIWindow alloc] initWithFrame:CGRectMake(0, -60, [UIScreen mainScreen].bounds.size.width, 60)];
        _showWindow.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _showWindow.backgroundColor = [UIColor redColor];
        _showWindow.userInteractionEnabled = NO;
        _showWindow.windowLevel = UIWindowLevelStatusBar;
        [_showWindow addSubview:self.topBar];
    }
    return _showWindow;
}
- (UIView *)topBar {
    if(!_topBar) {
        _topBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
        [_topBar addSubview:self.massageLabel];
    }
    return _topBar;
}

- (UILabel *)massageLabel{
    if (!_massageLabel) {
        _massageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
        _massageLabel.font = [UIFont systemFontOfSize:16];
        _massageLabel.textColor = [UIColor blueColor];
    }
    return _massageLabel;
}
@end
