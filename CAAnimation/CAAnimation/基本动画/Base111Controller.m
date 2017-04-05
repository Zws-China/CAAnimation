//
//  Base111Controller.m
//  CAAnimation
//
//  Created by iMac on 17/4/5.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "Base111Controller.h"

@interface Base111Controller ()

@property (nonatomic , strong) UIImageView *wsView;

@end

@implementation Base111Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initUI];
    
}


- (void)initUI {
    
    _wsView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-80, kScreenHeight/2-80,160 ,160 )];
    _wsView.image = [UIImage imageNamed:@"img1"];
    [self.view addSubview:_wsView];
    
    
    
    
    NSArray *titleArr = @[@"上移",@"下移",@"左移",@"右移",@"帧动画",@"Path动画"];
    for (NSInteger i = 0 ; i < titleArr.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20+(kScreenWidth-100)/4*(i%4)+20*(i%4), kScreenHeight - 150 +60*(i/4), (kScreenWidth-100)/4, 40);
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
    
    
    //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
    //anima.fillMode = kCAFillModeForwards;
    //anima.removedOnCompletion = NO;
    
    
    switch (btn.tag) {
        case 0:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
            anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2-80+_wsView.frame.size.width/2, kScreenHeight/2-80+_wsView.frame.size.height/2)];
            anima.toValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2-80+_wsView.frame.size.width/2, kScreenHeight/2-80+_wsView.frame.size.height/2-200)];
            anima.duration = 1.0f;
            
            anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            [_wsView.layer addAnimation:anima forKey:@"positionAnimation"];

        }
            break;
        case 1:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
            anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2-80+_wsView.frame.size.width/2, kScreenHeight/2-80+_wsView.frame.size.height/2)];

            anima.toValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2-80+_wsView.frame.size.width/2, kScreenHeight/2-80+_wsView.frame.size.height/2+200)];
            anima.duration = 1.0f;
            
            anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            [_wsView.layer addAnimation:anima forKey:@"positionAnimation"];

        }
            break;
        case 2:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
            anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2-80+_wsView.frame.size.width/2, kScreenHeight/2-80+_wsView.frame.size.height/2)];

            anima.toValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2-80+_wsView.frame.size.width/2-200, kScreenHeight/2+_wsView.frame.size.height/2-80)];
            anima.duration = 1.0f;
            
            anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            [_wsView.layer addAnimation:anima forKey:@"positionAnimation"];

        }
            break;
        case 3:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
            anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2-80+_wsView.frame.size.width/2, kScreenHeight/2-80+_wsView.frame.size.height/2)];
            
            anima.toValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2-80+_wsView.frame.size.width/2+200, kScreenHeight/2+_wsView.frame.size.height/2-80)];
            anima.duration = 1.0f;
            
            anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            [_wsView.layer addAnimation:anima forKey:@"positionAnimation"];
            
        }
            break;
        case 4:
        {
            CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, kScreenHeight/2-100)];
            NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth, kScreenHeight/2-100)];
            NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(0, kScreenHeight/2+100)];
            NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth, kScreenHeight/2+100)];
            anima.values = [NSArray arrayWithObjects:value0,value1,value2,value3, nil];
            anima.duration = 2.0f;
            anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];//设置动画的节奏
            anima.delegate = self;//设置代理，可以检测动画的开始和结束
            [_wsView.layer addAnimation:anima forKey:@"keyFrameAnimation"];

            
        }
            break;
        case 5:
        {
            CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(kScreenWidth/2-100, kScreenHeight/2-100, 200, 200)];
            anima.path = path.CGPath;
            anima.duration = 2.0f;
            [_wsView.layer addAnimation:anima forKey:@"pathAnimation"];
            
            
        }
            break;
            
        default:
            break;
    }
    

    
    
}



@end
