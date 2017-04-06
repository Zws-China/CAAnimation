//
//  UIViewAnimationController.m
//  CAAnimation
//
//  Created by iMac on 17/4/6.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "UIViewAnimationController.h"

@interface UIViewAnimationController ()
@property (nonatomic , strong) UIImageView *wsView;

@end

@implementation UIViewAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initUI];
    
}


- (void)initUI {
    
    _wsView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-50, kScreenHeight/2-50,100 ,100 )];
    _wsView.image = [UIImage imageNamed:@"img1"];
    [self.view addSubview:_wsView];
    
    
    NSArray *titleArr = [NSArray arrayWithObjects:@"右移100",@"放大2倍",@"旋转180°",@"组合动画",@"反转", nil];
    for (NSInteger i = 0 ; i < titleArr.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20+(kScreenWidth-100)/4*(i%4)+20*(i%4), kScreenHeight - 170 +60*(i/4), (kScreenWidth-100)/4, 40);
        btn.layer.cornerRadius = 5;
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        btn.backgroundColor = [UIColor lightGrayColor];
        btn.tag = i;
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    
}



- (void)btnAction:(UIButton *)btn {
    
    switch (btn.tag) {
        case 0:
            [self positionAnimation];
            break;
        case 1:
            [self scaleAnimation];
            break;
        case 2:
            [self rotateAnimation];
            break;
        case 3:
            [self combinationAnimation];
            break;
        case 4:
            [self invertAnimation];
            break;
        default:
            break;
    }
    
}

-(void)positionAnimation{
    _wsView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        _wsView.transform = CGAffineTransformMakeTranslation(100, 0);
    }];
}

-(void)scaleAnimation{
    _wsView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        _wsView.transform = CGAffineTransformMakeScale(2, 2);
    }];
}

-(void)rotateAnimation{
    _wsView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        _wsView.transform = CGAffineTransformMakeRotation(M_PI);
    }];
}

-(void)combinationAnimation{
    //组合使用
    _wsView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        CGAffineTransform transform1 = CGAffineTransformMakeRotation(M_PI);
        CGAffineTransform transform2 = CGAffineTransformScale(transform1, 0.5, 0.5);
        _wsView.transform = CGAffineTransformTranslate(transform2, -200, 0);
    }];
}

-(void)invertAnimation{
    _wsView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        //反转
        _wsView.transform = CGAffineTransformInvert(CGAffineTransformMakeScale(11, 11));
    }];
}









@end
