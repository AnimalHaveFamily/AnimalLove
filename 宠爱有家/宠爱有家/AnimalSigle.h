//
//  AnimalSigle.h
//  宠爱有家
//
//  Created by XXXX on 16/5/10.
//  Copyright © 2016年 XXXX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnimalSigle : NSObject
@property (nonatomic ,copy)NSString *username;

@property (nonatomic ,copy)NSString *password;

@property (nonatomic ,copy)NSString *headPhoto;

+ (id)SelfMessage;

@end
