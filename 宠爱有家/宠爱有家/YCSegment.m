//
//  YCSegment.m
//  宠爱有家
//
//  Created by ymcgz on 16/5/10.
//  Copyright © 2016年 XXXX. All rights reserved.
//


#import "YCSegment.h"


@implementation YCSegment

- (instancetype)initWithFrame:(CGRect)frame withItems:(NSArray *)items{
    self = [super initWithFrame:frame];
    if (self) {
        //获取每块的宽度
        self.perWidth = W/items.count;
        
        //保存传过来的标签数组
        self.items = items;
        
        //记录上次点击的标签索引
        self.lastSelectIdx = 0;
    }
    return self;
}

//获取被点击的标签的下划线layer
- (CALayer *)underLayer{
    if (!_underLayer) {
        _underLayer = [CALayer layer];
        _underLayer.backgroundColor = self.underLayerBackgroudColor.CGColor;
        [self.layer addSublayer:_underLayer];
    }
    return _underLayer;
}

//设置标签的索引
- (void)setSelectIdx:(NSInteger)selectIdx{
    
    _selectIdx = selectIdx;
    
    self.underLayer.frame = CGRectMake(self.selectIdx * self.perWidth,25, self.perWidth, 2);
    
    //每次重置标签索引，必须要重新画线
    [self setNeedsDisplay];
}

//通过触摸事件来判断出，所点击的标签索引位置
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = touches.anyObject;
    
    CGPoint point = [touch locationInView:self];
    
    self.selectIdx = point.x/self.perWidth;
    
//    //tableView向右滑动
//    if (self.lastSelectIdx < self.selectIdx) {
//        self.changeDirection(YLMySegmentDirectionLeft);
//    }
//    //tableView向左滑动
//    else if (self.lastSelectIdx > self.selectIdx) {
//        self.changeDirection(YLMySegmentDirectionRight);
//    }
    self.lastSelectIdx = self.selectIdx;
}
//
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [self.segmentBgColor set];
    
    //在rect方法里面填充一些内容
    UIRectFill(rect);
    
    /**
     *  OC数组遍历
     *
     *  @param obj  遍历的元素
     *  @param idx  遍历的元素所对应的索引
     *  @param stop 是否停止
     */
    
    [self.items enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGRect rect = (CGRect){idx * self.perWidth,5,self.perWidth,H };
        
        //设置文字属性的现实位置，left，right，center
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.alignment = NSTextAlignmentCenter;
        
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:idx == self.selectIdx?self.perColor:self.defaultPerColor,NSParagraphStyleAttributeName:style};
        
        [obj drawInRect:rect withAttributes:attributes];
        
    }];
}


@end