//
//  Service.h
//  ZendeskExercise
//
//  Created by Elton Mendes Viera on 07/01/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^successBlock)(id responseObject);
typedef void (^failureBlock)(NSError *error);

@interface Service : NSObject

+ (void)performRequestWithURL:(NSString *)URL
                withParameter:(id)parameters
                  withSuccess:(successBlock)success
                  withFailure:(failureBlock)failure;

@end
