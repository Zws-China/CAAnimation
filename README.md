# CAAnimation
iOS动画演示，核心动画演示，CAAnimation动画
# CAAnimation
iOS动画演示，核心动画演示，CAAnimation动画

#### github下载地址：[https://github.com/Zws-China/CAAnimation](https://github.com/Zws-China/CAAnimation)<br/>
如果觉得对你还有些用，给一颗star吧。你的支持是我继续的动力。<br/>

## 一、简介
IOS 动画主要是指Core Animation框架。官方使用文档地址为：[CoreAnimation官方使用文档](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CoreAnimation_guide/Introduction/Introduction.html)。<br/>Core Animation是IOS和OS X平台上负责图形渲染与动画的基础框架。Core Animation可以作用与动画视图或者其他可视元素，为你完成了动画所需的大部分绘帧工作。你只需要配置少量的动画参数（如开始点的位置和结束点的位置）即可使用Core Animation的动画效果。Core Animation将大部分实际的绘图任务交给了图形硬件来处理，图形硬件会加速图形渲染的速度。这种自动化的图形加速技术让动画拥有更高的帧率并且显示效果更加平滑，不会加重CPU的负担而影响程序的运行速度。

## 二、Core Animation类的继承关系图
![coreAnimation.png](http://img.my.csdn.net/uploads/201507/23/1437617562_3190.png)

## animationwithkeypath有哪些值
transform.scale = 比例缩放<br>
transform.scale.x = 宽的比例缩放<br>
transform.scale.y = 高的比例缩放<br>
transform.rotation.z = 以Z轴为中心旋转<br>
opacity = 透明度<br>
margin = 布局<br>
zPosition = 翻转<br>
backgroundColor = 背景颜色<br>
cornerRadius = 圆角<br>
borderWidth = 边框宽<br>
bounds = 大小<br>
contents = 内容<br>
contentsRect = 内容大小<br>
cornerRadius = 圆角<br>
frame = 大小位置<br>
hidden = 显示隐藏<br>
mask<br>
masksToBounds<br>
position = 位置<br>
shadowColor = 阴影颜色<br>
shadowOffset = 阴影偏移<br>
shadowOpacity = 阴影透明度<br>
shadowRadius = 阴影圆角<br>

**常用属性**
duration : 动画的持续时间<br>
beginTime : 动画的开始时间<br>
repeatCount : 动画的重复次数<br>
autoreverses : 执行的动画按照原动画返回执行<br><br>
timingFunction : 控制动画的显示节奏系统提供五种值选择，分别是：

- kCAMediaTimingFunctionLinear 线性动画
- kCAMediaTimingFunctionEaseIn 先慢后快（慢进快出）
- kCAMediaTimingFunctionEaseOut 先块后慢（快进慢出）
- kCAMediaTimingFunctionEaseInEaseOut 先慢后快再慢
- kCAMediaTimingFunctionDefault 默认，也属于中间比较快

delegate ： 动画代理。检测动画的执行和结束。
```
- (void)animationDidStart:(CAAnimation *)anim;//开始动画
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag;//动画结束
```
path：关键帧动画中的执行路径<br>
type  ： 过渡动画的动画类型，系统提供了四种过渡动画。<br>

- kCATransitionFade   渐变效果
- kCATransitionMoveIn  进入覆盖效果
- kCATransitionPush  推出效果
- kCATransitionReveal   揭露离开效果<br>

subtype : 过渡动画的动画方向<br>

- kCATransitionFromRight   从右侧进入
- kCATransitionFromLeft    从左侧进入
- kCATransitionFromTop  从顶部进入
- kCATransitionFromBottom  从底部进入<br>
![这里写图片描述](http://img.blog.csdn.net/20170406110553044?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)<br>
## 三、Core Animation使用
#### 3.1：位移动画（CABaseAnimation）<br>
**重要属性**<br>
**fromValue** ： keyPath对应的初始值<br>
**toValue** ： keyPath对应的结束值<br/>
基础动画主要提供了对于CALayer对象中的可变属性进行简单动画的操作。效果演示：
![这里写图片描述](http://img.blog.csdn.net/20170406111041171?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
```
//使用CABasicAnimation创建基础动画
_wsView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-80, kScreenHeight/2-80,160 ,160 )];
_wsView.image = [UIImage imageNamed:@"img1"];
[self.view addSubview:_wsView];

CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2-80+_wsView.frame.size.width/2, kScreenHeight/2-80+_wsView.frame.size.height/2)];
anima.toValue = [NSValue valueWithCGPoint:CGPointMake(kScreenWidth/2-80+_wsView.frame.size.width/2, kScreenHeight/2-80+_wsView.frame.size.height/2-200)];
anima.duration = 1.0f;
anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
[_wsView.layer addAnimation:anima forKey:@"positionAnimation"];
```
**注意点:**
如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。

#### 3.2：透明度动画（CABaseAnimation）
![这里写图片描述](http://img.blog.csdn.net/20170406112056252?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
```
//使用CABasicAnimation创建基础动画
CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
anima.fromValue = [NSNumber numberWithFloat:1.0f];
anima.toValue = [NSNumber numberWithFloat:0.2f];
anima.duration = 1.0f;
[_wsView.layer addAnimation:anima forKey:@"opacityAniamtion"];

```

#### 3.3：缩放动画（CABaseAnimation）
![这里写图片描述](http://img.blog.csdn.net/20170406112423210?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
```
//整体缩放
CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
anima.toValue = [NSNumber numberWithFloat:2.0f];
anima.duration = 1.0f;
[_wsView.layer addAnimation:anima forKey:@"scaleAnimation"];

//X轴缩放
CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];//同上
anima.toValue = [NSNumber numberWithFloat:2.0f];
anima.duration = 1.0f;
[_wsView.layer addAnimation:anima forKey:@"scaleAnimationX"];

//Y轴缩放
CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];//同上
anima.toValue = [NSNumber numberWithFloat:2.0f];
anima.duration = 1.0f;
[_wsView.layer addAnimation:anima forKey:@"scaleAnimationY"];


```

#### 3.4：旋转动画（CABaseAnimation && CAKeyframeAnimation）
![这里写图片描述](http://img.blog.csdn.net/20170406112555225?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
```
//绕着z轴为矢量，进行旋转
CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//绕着z轴为矢量，进行旋转(@"transform.rotation.z"==@@"transform.rotation")
anima.toValue = [NSNumber numberWithFloat:M_PI*2];
anima.duration = 2.0f;
[_wsView.layer addAnimation:anima forKey:@"rotateAnimation"];

//绕着X轴为矢量，进行旋转
CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
anima.toValue = [NSNumber numberWithFloat:M_PI*2];
anima.duration = 2.0f;
[_wsView.layer addAnimation:anima forKey:@"rotateAnimation"];

//绕着Y轴为矢量，进行旋转
CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
anima.toValue = [NSNumber numberWithFloat:M_PI*2];
anima.duration = 2.0f;
[_wsView.layer addAnimation:anima forKey:@"rotateAnimation"];

//绕着z轴为矢量，进行抖动
CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
NSValue *value1 = [NSNumber numberWithFloat:-M_PI/180*4];
NSValue *value2 = [NSNumber numberWithFloat:M_PI/180*4];
NSValue *value3 = [NSNumber numberWithFloat:-M_PI/180*4];
anima.values = @[value1,value2,value3];
anima.repeatCount = MAXFLOAT;
[_wsView.layer addAnimation:anima forKey:@"shakeAnimation"];

```

#### 3.5：背景颜色变换动画（CABaseAnimation）
![这里写图片描述](http://img.blog.csdn.net/20170406112947000?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
```
CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
anima.toValue =(id) [UIColor greenColor].CGColor;
anima.duration = 2.0f;
[_wsView.layer addAnimation:anima forKey:@"backgroundAnimation"];
```

#### 3.6：圆角变换动画（CABaseAnimation）
![这里写图片描述](http://img.blog.csdn.net/20170406113136565?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
```
//变换圆角
CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
anima.toValue = [NSNumber numberWithFloat:50.0f];
anima.duration = 1.0f;
anima.fillMode = kCAFillModeForwards;
anima.removedOnCompletion = NO;
[_wsView.layer addAnimation:anima forKey:@"cornerRadiusA"];

//恢复直角
CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
anima.toValue = [NSNumber numberWithFloat:0.0f];
anima.duration = 1.0f;
anima.fillMode = kCAFillModeForwards;
anima.removedOnCompletion = NO;
[_wsView.layer addAnimation:anima forKey:@"cornerRadius"];
```

#### 3.7：切换图片动画（CABaseAnimation）
![这里写图片描述](http://img.blog.csdn.net/20170406113316536?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
```
//动画切换图标
- (void)changeImageAnimatedWithView:(UIImageView *)imageV AndImage:(UIImage *)image {

CATransition *transition = [CATransition animation];
transition.duration = 2;
transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
transition.type = kCATransitionFade;
[imageV.layer addAnimation:transition forKey:@"a"];
[imageV setImage:image];
}


```

#### 3.8：阴影颜色动画（CABaseAnimation）
![这里写图片描述](http://img.blog.csdn.net/20170406113425819?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
```
//使用CABasicAnimation创建基础动画
CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
anima.fromValue = [NSNumber numberWithFloat:1.0f];
anima.toValue = [NSNumber numberWithFloat:0.2f];
anima.duration = 1.0f;
[_wsView.layer addAnimation:anima forKey:@"opacityAniamtion"];

```

#### 3.9：组动画（CABaseAnimation）
![这里写图片描述](http://img.blog.csdn.net/20170406121115905?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
```
//同时进行的组动画（平移，放大，旋转）
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

//顺序进行的动画
CFTimeInterval currentTime = CACurrentMediaTime();
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

```

#### 3.10：转场动画（CATransition）
![这里写图片描述](http://img.blog.csdn.net/20170406121434829?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
```
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

//-----------------------------私有api----------------------
/*
请勿在您的APP内使用这些私有api，否则你的APP可能会被拒绝上架
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

```
## 下载地址
github下载地址：[https://github.com/Zws-China/CAAnimation](https://github.com/Zws-China/CAAnimation)<br/>
如果觉得对你还有些用，给一颗star吧。你的支持是我继续的动力。<br/>
<br/>
