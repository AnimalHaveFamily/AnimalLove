//
//  YCTableView.m
//  宠爱有家
//
//  Created by ymcgz on 16/5/13.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "YCTableView.h"
#import "YCCell.h"

@implementation YCTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerNib:[UINib nibWithNibName:@"YCCell" bundle:nil] forCellReuseIdentifier:@"cellReuse"];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    self.startPoint = [touch locationInView:self];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = touches.anyObject;
    
    CGPoint endPoint = [touch locationInView:self];
    
    if ((endPoint.x - self.startPoint.x) >= W /10) {
        //响应滑动tableView的代理方法
        if ([_YCDelegate respondsToSelector:@selector(withdicection:)]) {
            [_YCDelegate withdicection:YCTableViewPanDirectionRight];
        }
    }else if((self.startPoint.x - endPoint.x) >= W /4){
        //响应滑动tableView的代理方法
        if ([_YCDelegate respondsToSelector:@selector(withdicection:)]) {
            [_YCDelegate withdicection:YCTableViewPanDirectionLeft];
        }
    }else{
        
        //获取点所对应的indexPath位置
        NSIndexPath *indexPath = [self indexPathForRowAtPoint:endPoint];
        
        //设置选择位置的选择状态
        [self selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
        
        //触发tableView的代理方法
        [self.delegate tableView:self didSelectRowAtIndexPath:indexPath];
    }
}

#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YCCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuse" forIndexPath:indexPath];
    
    cell.textLabel.text = @"abc";
    
    return cell;
}



@end
