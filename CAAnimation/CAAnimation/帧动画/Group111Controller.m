//
//  Frame111Controller.m
//  CAAnimation
//
//  Created by iMac on 17/4/5.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "Group111Controller.h"

@interface Group111Controller ()

@property (nonatomic , strong) UIImageView *wsView;

@end

@implementation Group111Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initUI];
    
}


- (void)initUI {
    
    _wsView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-50, kScreenHeight/2-50,100 ,100 )];
    _wsView.image = [UIImage imageNamed:@"img1"];
    [self.view addSubview:_wsView];
    
    
    
    
    NSArray *titleArr = @[@"同时",@"连续"];
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
    
    switch (btn.tag) {
        case 0:
        {
            //位移动画
            CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, kScreenHeight/2-50)];
            NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/3, kScreenHeight/2-50)];
            NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/3, kScreenHeight/2+50)];
            NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth*2/3, kScreenHeight/2+50)];
            NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth*2/3, kScreenHeight/2-50)];
            NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth, kScreenHeight/2-50)];
            anima1.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5, nil];
            
            //缩放动画
            CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
            anima2.fromValue = [NSNumber numberWithFloat:0.8f];
            anima2.toValue = [NSNumber numberWithFloat:2.0f];
            
            //旋转动画
            CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
            anima3.toValue = [NSNumber numberWithFloat:M_PI*4];
            
            //组动画
            CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
            groupAnimation.animations = [NSArray arrayWithObjects:anima1,anima2,anima3, nil];
            groupAnimation.duration = 4.0f;
            
            [_wsView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
            
            
            
            
            //-如下，使用三个animation不分装成group，只是把他们添加到layer，也有组动画的效果。----------
            /**
            CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, kScreenHeight/2-50)];
            NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/3, kScreenHeight/2-50)];
            NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/3, kScreenHeight/2+50)];
            NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth*2/3, kScreenHeight/2+50)];
            NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth*2/3, kScreenHeight/2-50)];
            NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth, kScreenHeight/2-50)];
            anima1.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5, nil];
            anima1.duration = 4.0f;
            [_wsView.layer addAnimation:anima1 forKey:@"aa"];
        
            //缩放动画
            CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
            anima2.fromValue = [NSNumber numberWithFloat:0.8f];
            anima2.toValue = [NSNumber numberWithFloat:2.0f];
            anima2.duration = 4.0f;
            [_wsView.layer addAnimation:anima2 forKey:@"bb"];
        
            //旋转动画
            CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
            anima3.toValue = [NSNumber numberWithFloat:M_PI*4];
            anima3.duration = 4.0f;
            [_wsView.layer addAnimation:anima3 forKey:@"cc"];
             
             */

        }
            break;
        case 1:
        {
            [self groupAnimation2];
        }
            break;
            
        default:
            break;
    }
    
}


/**
 *  顺序执行的组动画
 */
-(void)groupAnimation2{
    CFTimeInterval currentTime = CACurrentMediaTime();
    //位移动画
    //位移动画
    CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, kScreenHeight/2-50)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/4, kScreenHeight/2-50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/4, kScreenHeight/2+50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2, kScreenHeight/2+50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2, kScreenHeight/2-50)];
    anima1.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4, nil];
    anima1.beginTime = currentTime;
    anima1.duration = 2.0f;
    anima1.fillMode = kCAFillModeForwards;
    anima1.removedOnCompletion = NO;
    [_wsView.layer addAnimation:anima1 forKey:@"aa"];
    
    //缩放动画
    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima2.fromValue = [NSNumber numberWithFloat:0.8f];
    anima2.toValue = [NSNumber numberWithFloat:2.0f];
    anima2.beginTime = currentTime+2.0f;
    anima2.duration = 1.0f;
    anima2.fillMode = kCAFillModeForwards;
    anima2.removedOnCompletion = NO;
    [_wsView.layer addAnimation:anima2 forKey:@"bb"];
    
    //旋转动画
    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima3.toValue = [NSNumber numberWithFloat:M_PI*4];
    anima3.beginTime = currentTime+3.0f;
    anima3.duration = 1.0f;
    anima3.fillMode = kCAFillModeForwards;
    anima3.removedOnCompletion = NO;
    [_wsView.layer addAnimation:anima3 forKey:@"cc"];
}

@end
