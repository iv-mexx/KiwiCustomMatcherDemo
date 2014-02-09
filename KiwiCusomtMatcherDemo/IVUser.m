//
//  IVUser.m
//  KiwiCusomtMatcherDemo
//
//  Created by Markus Chmelar on 09.02.14.
//  Copyright (c) 2014 Innovaptor OG. All rights reserved.
//

#import "IVUser.h"

@interface IVUser ()
@property(nonatomic, readwrite)BOOL isLoggedIn;
@end

@implementation IVUser

-(id)initWithUsername:(NSString *)userName
{
    self = [super init];
    if(self)
    {
        _userName = userName;
        _accessToken = nil;
        _isLoggedIn = NO;
    }
    return self;
}

-(void)logIn
{
    self.isLoggedIn = YES;
    self.accessToken = @"SomeToken";
}

-(void)logOut
{
    self.isLoggedIn = NO;
    self.accessToken = nil;
}

@end
