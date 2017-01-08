//
//  Service.m
//  ZendeskExercise
//
//  Created by Elton Mendes Viera on 07/01/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//

#import "Service.h"
#import "AFNetworking.h"

static NSString* const APIUsername = @"acooke+techtest@zendesk.com";
static NSString* const APIPassword = @"mobile";

@implementation Service


+ (void)performRequestWithURL:(NSString *)URL
                withParameter:(id)parameters
                  withSuccess:(successBlock)success
                  withFailure:(failureBlock)failure  {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:APIUsername
                                                              password:APIPassword];
 
    [manager GET:URL
      parameters:parameters
         success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if(success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if(failure) {
            failure(error);
        }
    }];

}


@end
