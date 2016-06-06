//
//  HCDrawView.m
//  涂鸦
//
//  Created by Karma on 16/6/6.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

#import "HCDrawView.h"
@interface HCDrawView ()

//记录当前绘图路径
@property (nonatomic, strong) UIBezierPath * path;

//存放所有已经绘制的路径
@property (nonatomic, copy) NSMutableArray * pathArray;
@end


@implementation HCDrawView
-(UIBezierPath *)path{
    if (_path == nil) {
        _path = [UIBezierPath bezierPath];
    }
    
    return _path;
}


-(NSMutableArray *)pathArray{
    if (_pathArray == nil) {
        _pathArray = [NSMutableArray array];
    }
    return _pathArray;
}

//当用户开始触摸时，需要根据用户的触摸点设置路径的起始点，并且把路径添加到路径数组中
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //开启一个新的路径对象
    UIBezierPath *path = [UIBezierPath bezierPath];
    self.path = path;
    //把当前路径添加到数组中
    [self.pathArray addObject:path];
    
    //获取当前触摸点
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    
    //设置当前路径的开始点
    [path moveToPoint:touchPoint];
    
}
//用户手指在屏幕上滑动时，需要不断更新路径的结束点并画线，然后调用setNeedDisplay方法来绘图

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    CGPoint touchPoint = [touch locationInView:self];
    
    [self.path addLineToPoint:touchPoint];
    
    [self setNeedsDisplay];
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    CGPoint touchPoint = [touch locationInView:self];
    
    [self.path addLineToPoint:touchPoint];
    
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect{
    if (!self.pathArray.count) return;
    
    for (UIBezierPath *path in self.pathArray) {
        [path stroke];
    }
}


-(void)clearAllPath{
    
    [self.pathArray removeAllObjects];
    
    [self setNeedsDisplay];
}


@end
