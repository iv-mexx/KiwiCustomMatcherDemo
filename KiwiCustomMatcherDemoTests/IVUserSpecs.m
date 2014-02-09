//
//  IVUserSpecs.m
//  KiwiCusomtMatcherDemo
//
//  Created by Markus Chmelar on 09.02.14.
//  Copyright (c) 2014 Innovaptor OG. All rights reserved.
//

#import <Kiwi.h>
#import "IVUser.h"
#import "IVUserMatcher.h"

SPEC_BEGIN(Chat)

describe(@"User", ^{
    
    registerMatchers(@"IV");
    
    __block IVUser *user;
    
    beforeEach(^{
        user = [[IVUser alloc] initWithUsername:@"TestUser"];
    });
    
    context(@"login", ^{
        it(@"should be logged out after initialization", ^{
            [[user should] beLoggedOutUser];
        });
        
        it(@"should be able to login", ^{
            [[user should]beLoggedOutUser];
            [user logIn];
            [[user should] beLoggedInUser];
        });        
    });
    
    context(@"failing tests", ^{
        // These Tests are failing on purpose to demostrate the failure messages
        
        it(@"should report that the username is missing", ^{
            user.userName = nil;
            [[user should] beLoggedOutUser];
        });
        
        it(@"should report that the user is valid when he was expected to be invalid", ^{
            [[user shouldNot] beLoggedOutUser];
        });
    });
});

SPEC_END

