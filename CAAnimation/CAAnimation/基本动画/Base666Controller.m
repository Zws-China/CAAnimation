//
//  Base666Controller.m
//  CAAnimation
//
//  Created by iMac on 17/4/5.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "Base666Controller.h"

@interface Base666Controller ()
@property (nonatomic , strong) UIImageView *wsView;

@end

@implementation Base666Controller


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    [self initUI];
    
}


- (void)initUI {
    
    _wsView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-80, kScreenHeight/2-80,160 ,160 )];
    _wsView.image = [UIImage imageNamed:@"img1"];
    _wsView.layer.masksToBounds = YES;
    [self.view addSubview:_wsView];
    
    NSArray *titleArr = @[@"变换圆角",@"恢复直角"];
    for (NSInteger i = 0 ; i < titleArr.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20+(kScreenWidth-100)/titleArr.count*i+20*i, kScreenHeight - 100, (kScreenWidth-100)/titleArr.count, 40);
        btn.layer.cornerRadius = 5;
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
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
            anima.toValue = [NSNumber numberWithFloat:50.0f];
            anima.duration = 1.0f;
            //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
            anima.fillMode = kCAFillModeForwards;
            anima.removedOnCompletion = NO;
            [_wsView.layer addAnimation:anima forKey:@"cornerRadiusA"];
            
            
        }
            break;
        case 1:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
            anima.toValue = [NSNumber numberWithFloat:0.0f];
            anima.duration = 1.0f;
            //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
            anima.fillMode = kCAFillModeForwards;
            anima.removedOnCompletion = NO;
            [_wsView.layer addAnimation:anima forKey:@"cornerRadius"];
            
            
        }
            break;
            
        default:
            break;
    }
    
}




@end