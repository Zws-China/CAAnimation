//
//  ViewController.m
//  CAAnimation
//
//  Created by iMac on 17/4/5.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "ViewController.h"
#import "Base111Controller.h"
#import "Base222Controller.h"
#import "Base333Controller.h"
#import "Base444Controller.h"
#import "Base555Controller.h"
#import "Base666Controller.h"
#import "Base777Controller.h"
#import "Base888Controller.h"
#import "Base999Controller.h"

#import "Group111Controller.h"

#import "TransitionController.h"

#import "UIViewAnimationController.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self initUI];
    
}

- (void)initUI {
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = @"Animation动画";

    _dataArr = @[@[@"位移(position)",@"透明度(opacity)",@"缩放(scale)",@"旋转(rotation)",@"背景颜色变换(backgroundColor)",@"圆角(cornerRadius)",@"切换图片",@"边框宽(borderWidth)",@"阴影颜色(shadowColor)"],@[@"组动画"],@[@"转场动画"],@[@"UIView+Animation"]];

    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];

    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [(NSArray *)[self.dataArr objectAtIndex:section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identy = @"tableviewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identy];
    }
    cell.textLabel.text = [(NSArray *)[self.dataArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];

    
    return cell;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSArray *array = @[@"基础动画",@"组动画",@"转场动画",@"UIView+Animation"];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, kScreenWidth-40, 25)];
    label.textColor = [UIColor orangeColor];
    label.text = [array objectAtIndex:section];
    return label;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *viewController;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                    viewController = [[Base111Controller alloc] init];
                    break;
                case 1:
                    viewController = [[Base222Controller alloc] init];
                    break;
                case 2:
                    viewController = [[Base333Controller alloc] init];
                    break;
                case 3:
                    viewController = [[Base444Controller alloc] init];
                    break;
                case 4:
                    viewController = [[Base555Controller alloc] init];
                    break;
                case 5:
                    viewController = [[Base666Controller alloc] init];
                    break;
                case 6:
                    viewController = [[Base777Controller alloc] init];
                    break;
                case 7:
                    viewController = [[Base888Controller alloc] init];
                    break;
                case 8:
                    viewController = [[Base999Controller alloc] init];
                    break;
                    
                default:
                    break;
            }

        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    viewController = [[Group111Controller alloc] init];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 2:
        {
            switch (indexPath.row) {
                case 0:
                {
                    viewController = [[TransitionController alloc] init];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 3:
        {
            switch (indexPath.row) {
                case 0:
                {
                    viewController = [[UIViewAnimationController alloc] init];
                }
                    break;
                default:
                    break;
            }

        }
            break;
                    
        default:
            break;
    }
    
    
    //调用pushFrontViewController进行页面切换
    [self.navigationController pushViewController:viewController animated:YES];
    
}



- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //将cell的分隔线延长到整个屏幕宽   避免左边出现一段空隙
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
}
@end
