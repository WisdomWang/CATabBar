//
//  MainTabBarController.m
//  CATabBar
//
//  Created by umer on 2020/4/14.
//  Copyright © 2020 umer. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainTabBar.h"
#import "FirstVC.h"
#import "SecondVC.h"
#import "ThreeVC.h"

@interface MainTabBarController ()

@property(nonatomic,strong)MainTabBar *mainTabBar;

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpChildVC];
    [self setValue:self.mainTabBar forKey:@"tabBar"];
}

-(void)setUpChildVC{
    
    FirstVC *firstVC = [FirstVC new];
    firstVC.navigationItem.title = @"首页";
    firstVC.view.backgroundColor = [self randomColor];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:firstVC];
    [self addChildViewController:nav1];
    
    SecondVC *secondVC = [SecondVC new];
    secondVC.navigationItem.title = @"拍摄";
    secondVC.view.backgroundColor = [self randomColor];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:secondVC];
    [self addChildViewController:nav2];
    
    ThreeVC *threeVC = [ThreeVC new];
    threeVC.navigationItem.title = @"我的";
    threeVC.view.backgroundColor = [self randomColor];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:threeVC];
    [self addChildViewController:nav3];
    
}

-(MainTabBar *)mainTabBar{
    if (!_mainTabBar) {
        NSArray *titArr = @[@"首页",@"",@"我的"];
        NSArray *imgArr = @[@"icon_zhizuo_gai",@"icon_paizhao_gai",@"icon_geren_gai"];
        NSArray *sImgArr = @[@"icon_zhizuo_xuanzhong_gai",@"icon_paizhao_gai",@"icon_geren_xuanzhong_gai"];
        MainTabBar *mainTabBar = [[MainTabBar alloc]initWithTitArr:titArr imgArr:imgArr sImgArr:sImgArr];
        mainTabBar.delegate = self;
        _mainTabBar = mainTabBar;
    }
    return _mainTabBar;
}

#pragma mark -TabBar Delegate
-(void)changeIndex:(NSInteger)index{
    self.selectedIndex = index;
}

-(void)setTabIndex:(NSInteger)tabIndex{
    _tabIndex = tabIndex;
    self.selectedIndex = _tabIndex;
    self.mainTabBar.tabIndex = _tabIndex;
}

-(UIColor*)randomColor{
    CGFloat hue = (arc4random() %256/256.0);
    CGFloat saturation = (arc4random() %128/256.0) +0.5;
    CGFloat brightness = (arc4random() %128/256.0) +0.5;
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
