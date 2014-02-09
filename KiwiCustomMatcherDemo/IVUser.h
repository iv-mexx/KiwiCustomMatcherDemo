//
//  IVUser.h
//  KiwiCusomtMatcherDemo
//
//  Created by Markus Chmelar on 09.02.14.
//  Copyright (c) 2014 Innovaptor OG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IVUser : NSObject

@property(nonatomic, strong)NSString *userName;
@property(nonatomic, strong)NSString *accessToken;
@property(nonatomic, readonly)BOOL isLoggedIn;

-(id)initWithUsername:(NSString *)userName;

-(void)logIn;
-(void)logOut;

@end
