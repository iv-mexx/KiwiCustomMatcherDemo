//
//  IVUserMatcher.m
//  KiwiCusomtMatcherDemo
//
//  Created by Markus Chmelar on 09.02.14.
//  Copyright (c) 2014 Innovaptor OG. All rights reserved.
//

#import "IVUserMatcher.h"
#import "IVUser.h"

@interface IVUserMatcher ()
@property(nonatomic, readwrite)BOOL loggedIn;
@property(nonatomic, strong)NSString *shouldErrorMessage;
@property(nonatomic, strong)NSString *shouldNotErrorMessage;
@end

@implementation IVUserMatcher

#pragma mark - Getting Matcher Strings

+ (NSArray *)matcherStrings {
    return @[@"beLoggedOutUser", @"beLoggedInUser"];
}

#pragma mark - Matching

- (BOOL)evaluate {
    BOOL valid = YES;
    IVUser *user = (IVUser *)self.subject;
    
    self.shouldErrorMessage = @"Expected subject to be valid, but:";
    self.shouldNotErrorMessage = @"Expected subject to be invalid, but:";
    
    // A User must always have a username
    if(!user.userName)
    {
        valid = NO;
        self.shouldErrorMessage = [self.shouldErrorMessage stringByAppendingFormat:@"\n\tUsername was nil"];
    }
    else
    {
        self.shouldNotErrorMessage = [self.shouldNotErrorMessage stringByAppendingFormat:@"\n\tUsername was not nil"];
    }
    
    if(self.loggedIn)
    {
        // If the User is logged in, the AccessToken must not be empty
        if(!user.accessToken)
        {
            valid = NO;
            self.shouldErrorMessage = [self.shouldErrorMessage stringByAppendingFormat:@"\n\tAccessToken was nil"];
        }
        else
        {
            self.shouldNotErrorMessage = [self.shouldNotErrorMessage stringByAppendingFormat:@"\n\tAccessToken was not nil"];
        }
    }
    else
    {
        // If the User is logged out, the AccessToken must be nil
        if(user.accessToken)
        {
            valid = NO;
            self.shouldErrorMessage = [self.shouldErrorMessage stringByAppendingFormat:@"\n\tAccessToken was not nil"];
        }
        else
        {
            self.shouldNotErrorMessage = [self.shouldNotErrorMessage stringByAppendingFormat:@"\n\tAccessToken was nil"];
        }
    }
    
    return valid;
}

-(NSString *)failureMessageForShould
{
    return self.shouldErrorMessage;
}

-(NSString *)failureMessageForShouldNot
{
    return self.shouldNotErrorMessage;
}

#pragma mark - Configuring Matchers

- (void)beLoggedOutUser
{
    _loggedIn = NO;
}

-(void)beLoggedInUser
{
    _loggedIn = YES;
}

@end
