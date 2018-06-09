//
//  STMassgeManager.h
//  StevenShowMassage
//
//  Created by 李方建 on 2018/6/9.
//  Copyright © 2018年 李方建. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface STMassgeManager : NSObject
+ (STMassgeManager*)shared;
- (void)showMassage:(NSString *)massage;
@end
