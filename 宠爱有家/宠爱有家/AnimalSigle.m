//
//  AnimalSigle.m
//  宠爱有家
//
//  Created by XXXX on 16/5/10.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import "AnimalSigle.h"

@implementation AnimalSigle

+ (id)SelfMessage{
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    
    static AnimalSigle *message = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        message = [super allocWithZone:zone];
        message.username = @"";
        message.password = @"";
        message.headPhoto = @"";
    });
    return message;

}

@end
