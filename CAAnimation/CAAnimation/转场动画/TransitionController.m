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
    
}


- (void)initUI {
    
    _wsView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-80, kScreenHeight/2-80,160 ,160 )];
    _wsView.image = [UIImage imageNamed:@"img1"];
    [self.view addSubview:_wsView];
    
    _indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(_wsView.frame)/2-20, CGRectGetHeight(_wsView.frame)/2-20, 40, 40)];
    _indexLabel.textAlignment = NSTextAlignmentCenter;
    _indexLabel.font = [UIFont systemFontOfSize:40];
    [_wsView addSubview:_indexLabel];
    
    
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

    
        
}




/**
 *   设置view的值
 */
-(void)changeView : (BOOL)isUp{
    if (_index>3) {
        _index = 0;
    }
    if (_index<0) {
        _index = 3;
    }
    NSArray *colors = [NSArray arrayWithObjects:[UIColor cyanColor],[UIColor magentaColor],[UIColor orangeColor],[UIColor purpleColor], nil];
    NSArray *titles = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    _wsView.backgroundColor = [colors objectAtIndex:_index];
    _indexLabel.text = [titles objectAtIndex:_index];
    if (isUp) {
        _index++;
    }else{
        _index--;
    }
}



@end
