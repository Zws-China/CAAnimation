//
//  Base555Controller.m
//  CAAnimation
//
//  Created by iMac on 17/4/5.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "Base555Controller.h"

@interface Base555Controller ()

@property (nonatomic , strong) UIImageView *wsView;

@end

@implementation Base555Controller


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self initUI];
    
}


- (void)initUI {
    
    _wsView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-80, kScreenHeight/2-80,160 ,160 )];
    _wsView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_wsView];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, kScreenHeight - 100, kScreenWidth-200, 40);
    btn.layer.cornerRadius = 5;
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn setTitle:@"变换背景颜色" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}



- (void)btnAction:(UIButton *)btn {
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anima.toValue =(id) [UIColor greenColor].CGColor;
    anima.duration = 2.0f;
    //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
    //anima.fillMode = kCAFillModeForwards;
    //anima.removedOnCompletion = NO;
    [_wsView.layer addAnimation:anima forKey:@"backgroundAnimation"];

    
}




@end