//
//  Base888Controller.m
//  CAAnimation
//
//  Created by iMac on 17/4/5.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "Base888Controller.h"

@interface Base888Controller ()
@property (nonatomic , strong) UIImageView *wsView;

@end

@implementation Base888Controller


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self initUI];
    
}


- (void)initUI {
    
    _wsView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-80, kScreenHeight/2-80,160 ,160 )];
    _wsView.image = [UIImage imageNamed:@"img1"];
    _wsView.layer.cornerRadius = 10;
    _wsView.layer.masksToBounds = YES;
    _wsView.layer.borderColor = [UIColor orangeColor].CGColor;
    [self.view addSubview:_wsView];
    
    NSArray *titleArr = @[@"边框宽1",@"边框宽5",@"边框宽10",@"边框宽20"];
    for (NSInteger i = 0 ; i < titleArr.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20+(kScreenWidth-100)/titleArr.count*i+20*i, kScreenHeight - 100, (kScreenWidth-100)/titleArr.count, 40);
        btn.layer.cornerRadius = 5;
        btn.titleLabel.font = [UIFont systemFontOfSize:10];
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
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
            anima.toValue = [NSNumber numberWithFloat:1.0f];
            anima.duration = 1.0f;
            //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
            anima.fillMode = kCAFillModeForwards;
            anima.removedOnCompletion = NO;
            [_wsView.layer addAnimation:anima forKey:@"borderWidth"];
            
            
        }
            break;
        case 1:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
            anima.toValue = [NSNumber numberWithFloat:5.0f];
            anima.duration = 1.0f;
            //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
            anima.fillMode = kCAFillModeForwards;
            anima.removedOnCompletion = NO;
            [_wsView.layer addAnimation:anima forKey:@"borderWidth"];
            
            
        }
            break;
        case 2:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
            anima.toValue = [NSNumber numberWithFloat:10.0f];
            anima.duration = 1.0f;
            //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
            anima.fillMode = kCAFillModeForwards;
            anima.removedOnCompletion = NO;
            [_wsView.layer addAnimation:anima forKey:@"borderWidth"];
            
            
        }
            break;
        case 3:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
            anima.toValue = [NSNumber numberWithFloat:20.0f];
            anima.duration = 1.0f;
            //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
            anima.fillMode = kCAFillModeForwards;
            anima.removedOnCompletion = NO;
            [_wsView.layer addAnimation:anima forKey:@"borderWidth"];
            
            
        }
            break;
            
        default:
            break;
    }
    
}




@end