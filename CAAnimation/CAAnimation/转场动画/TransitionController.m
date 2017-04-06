//
//  TransitionController.m
//  CAAnimation
//
//  Created by iMac on 17/4/5.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "TransitionController.h"

@interface TransitionController ()

@property (nonatomic , strong) UIImageView *wsView;

@property (nonatomic , strong) UILabel *indexLabel;

@property (nonatomic , assign) NSInteger index;


@end

@implementation TransitionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initUI];
    
    [self changeView:YES];
}


- (void)initUI {
    
    _wsView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-100, kScreenHeight/2-150,200 ,200 )];
    _wsView.image = [UIImage imageNamed:@"img1"];
    [self.view addSubview:_wsView];
    
    _indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(_wsView.frame)/2-30, CGRectGetHeight(_wsView.frame)/2-20, 60, 40)];
    _indexLabel.textAlignment = NSTextAlignmentCenter;
    _indexLabel.textColor = [UIColor cyanColor];
    _indexLabel.font = [UIFont systemFontOfSize:30];
    [_wsView addSubview:_indexLabel];
    
    
    NSArray *titleArr = [NSArray arrayWithObjects:@"fade",@"moveIn",@"push",@"reveal",@"cube",@"suck",@"oglFlip",@"ripple",@"Curl",@"UnCurl",@"caOpen",@"caClose", nil];
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
        
        if (i == 3) {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(btn.frame), kScreenWidth, 20)];
            label.text = @"————以下是私有api,请勿在您将上架的APP内使用————";
            label.adjustsFontSizeToFitWidth = YES;
            label.textColor = [UIColor orangeColor];
            label.textAlignment = NSTextAlignmentCenter;
            [self.view addSubview:label];
            
        }
    }
    
    
    
}

    
    
- (void)btnAction:(UIButton *)btn {

    switch (btn.tag) {
        case 0:
            [self fadeAnimation];
            break;
        case 1:
            [self moveInAnimation];
            break;
        case 2:
            [self pushAnimation];
            break;
        case 3:
            [self revealAnimation];
            break;
        case 4:
            [self cubeAnimation];
            break;
        case 5:
            [self suckEffectAnimation];
            break;
        case 6:
            [self oglFlipAnimation];
            break;
        case 7:
            [self rippleEffectAnimation];
            break;
        case 8:
            [self pageCurlAnimation];
            break;
        case 9:
            [self pageUnCurlAnimation];
            break;
        case 10:
            [self cameraIrisHollowOpenAnimation];
            break;
        case 11:
            [self cameraIrisHollowCloseAnimation];
            break;
        default:
            break;
    }
        
}

/**
 *  逐渐消失
 */
-(void)fadeAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionFade;//设置动画的类型
    //    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [_wsView.layer addAnimation:anima forKey:@"fadeAnimation"];
}

-(void)moveInAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionMoveIn;//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [_wsView.layer addAnimation:anima forKey:@"moveInAnimation"];
}

-(void)pushAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionPush;//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [_wsView.layer addAnimation:anima forKey:@"pushAnimation"];
}

-(void)revealAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionReveal;//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [_wsView.layer addAnimation:anima forKey:@"revealAnimation"];
}

//-----------------------------private api------------------------------------
/*
	Don't be surprised if Apple rejects your app for including those effects,
	and especially don't be surprised if your app starts behaving strangely after an OS update.
 */


/**
 *  立体翻滚效果
 */
-(void)cubeAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"cube";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [_wsView.layer addAnimation:anima forKey:@"revealAnimation"];
}


-(void)suckEffectAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"suckEffect";//设置动画的类型
    anima.subtype = kCATransitionFromLeft; //设置动画的方向
    anima.duration = 1.0f;
    
    [_wsView.layer addAnimation:anima forKey:@"suckEffectAnimation"];
}

-(void)oglFlipAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"oglFlip";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [_wsView.layer addAnimation:anima forKey:@"oglFlipAnimation"];
}

-(void)rippleEffectAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"rippleEffect";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [_wsView.layer addAnimation:anima forKey:@"rippleEffectAnimation"];
}

-(void)pageCurlAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"pageCurl";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [_wsView.layer addAnimation:anima forKey:@"pageCurlAnimation"];
}

-(void)pageUnCurlAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"pageUnCurl";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [_wsView.layer addAnimation:anima forKey:@"pageUnCurlAnimation"];
}

-(void)cameraIrisHollowOpenAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"cameraIrisHollowOpen";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [_wsView.layer addAnimation:anima forKey:@"cameraIrisHollowOpenAnimation"];
}

-(void)cameraIrisHollowCloseAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"cameraIrisHollowClose";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    
    [_wsView.layer addAnimation:anima forKey:@"cameraIrisHollowCloseAnimation"];
}



/**
 *   设置view的值
 */
-(void)changeView : (BOOL)isUp{
    if (_index>1) {
        _index = 0;
    }
    if (_index<0) {
        _index = 1;
    }
    NSArray *images = [NSArray arrayWithObjects:[UIImage imageNamed:@"img1"],[UIImage imageNamed:@"img2"], nil];
    NSArray *titles = [NSArray arrayWithObjects:@"1号",@"2号", nil];
    _wsView.image = [images objectAtIndex:_index];
    _indexLabel.text = [titles objectAtIndex:_index];
    if (isUp) {
        _index++;
    }else{
        _index--;
    }
}



@end
