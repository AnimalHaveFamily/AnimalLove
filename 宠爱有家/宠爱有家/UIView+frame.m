//
//  UIView+frame.m
//  百思不得姐
//
//  Created by scjy on 16/5/11.
//  Copyright © 2016年 XXXX. All rights reserved.
//


#import "UIView+frame.h"

@implementation UIView (frame)

- (CGFloat)x{
    return self.origin.x;
}

- (CGFloat)y{
    return self.origin.y;
}

- (CGFloat)width{
    return self.size.width;
}


- (CGFloat)height{
    return self.size.height;
}

- (CGPoint)origin{
    return self.frame.origin;
}

- (CGPoint)center{
    return (CGPoint){self.x + self.width/2, self.y + self.height/2};
}

- (CGSize)size{
    return self.frame.size;
}

- (void)setX:(CGFloat)x{
    self.origin = (CGPoint){x, self.y};
}

- (void)setY:(CGFloat)y{
    self.origin = (CGPoint){self.x, y};
}

- (void)setWidth:(CGFloat)width{
    self.size = (CGSize){width, self.height};
}

- (void)setHeight:(CGFloat)height{
    self.size = (CGSize){self.width, height};
}

- (void)setOrigin:(CGPoint)origin{
    self.frame = (CGRect){origin,self.size};
}

- (void)setCenter:(CGPoint)center{
    self.frame = (CGRect){center.x - self.width/2,center.y - self.height/2,self.size};
}

- (void)setSize:(CGSize)size{
    self.frame = (CGRect){self.x,self.y,self.size};
}

@end
