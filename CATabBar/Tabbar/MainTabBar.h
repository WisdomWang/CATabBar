//
//  MainTabBar.h
//  CATabBar
//
//  Created by umer on 2020/4/14.
//  Copyright © 2020 umer. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MainTabBarDelegate <NSObject>

- (void)changeIndex:(NSInteger)index;

@end

@interface MainTabBar : UITabBar

@property(nonatomic,assign) NSInteger tabIndex;

@property(nonatomic,weak) id delegate;

- (instancetype)initWithTitArr:(NSArray *)titArr imgArr:(NSArray *)imgArr sImgArr:(NSArray *)sImgArr;

@end

NS_ASSUME_NONNULL_END
