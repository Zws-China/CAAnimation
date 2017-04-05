//
//  Base444Controller.m
//  CAAnimation
//
//  Created by iMac on 17/4/5.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "Base444Controller.h"

@interface Base444Controller ()


@property (nonatomic , strong) UIImageView *wsView;

@end

@implementation Base444Controller


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self initUI];
    
}


- (void)initUI {
    
    _wsView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-80, kScreenHeight/2-80,160 ,160 )];
    _wsView.image = [UIImage imageNamed:@"img1"];
    [self.view addSubview:_wsView];
    
    
    NSArray *titleArr = @[@"Z轴旋转",@"X轴旋转",@"Y轴旋转",@"抖动"];
    for (NSInteger i = 0 ; i < titleArr.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20+(kScreenWidth-100)/titleArr.count*i+20*i, kScreenHeight - 100, (kScreenWidth-100)/titleArr.count, 40);
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
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//绕着z轴为矢量，进行旋转(@"transform.rotation.z"==@@"transform.rotation")
            anima.toValue = [NSNumber numberWithFloat:M_PI*2];
            anima.duration = 2.0f;
            [_wsView.layer addAnimation:anima forKey:@"rotateAnimation"];
        }
            break;
        case 1:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
            anima.toValue = [NSNumber numberWithFloat:M_PI*2];
            anima.duration = 2.0f;
            [_wsView.layer addAnimation:anima forKey:@"rotateAnimation"];
        }
            break;
        case 2:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
            anima.toValue = [NSNumber numberWithFloat:M_PI*2];
            anima.duration = 2.0f;
            [_wsView.layer addAnimation:anima forKey:@"rotateAnimation"];
        }
            break;
        case 3:
        {
            CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];//在这里@"transform.rotation"==@"transform.rotation.z"
            NSValue *value1 = [NSNumber numberWithFloat:-M_PI/180*4];
            NSValue *value2 = [NSNumber numberWithFloat:M_PI/180*4];
            NSValue *value3 = [NSNumber numberWithFloat:-M_PI/180*4];
            anima.values = @[value1,value2,value3];
            anima.repeatCount = MAXFLOAT;
            
            [_wsView.layer addAnimation:anima forKey:@"shakeAnimation"];
        }
            break;
            
        default:
            break;
    }

    
    
}




@end
