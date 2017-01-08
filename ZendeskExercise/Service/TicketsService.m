//
//  TicketsService.m
//  ZendeskExercise
//
//  Created by Elton Mendes Viera on 07/01/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//

#import "TicketsService.h"
#import "Ticket.h"

static NSString* const APIViewID = @"39551161";
static NSString* const APIsubDomain = @"mxtechtest";
static NSString* const APIURLFormat = @"https://%@.zendesk.com/api/v2/views/%@/tickets.json";
static NSString* const ticketJsonKey = @"tickets";

@implementation TicketsService

+ (void)requestTicketsFromServiceWithSuccess:(ticketsServiceSuccessBlock)successBlock
                                 withFailure:(ticketsServiceFailureBlock)failureBlock {
    
    NSString *URL = [NSString stringWithFormat:APIURLFormat,APIsubDomain,APIViewID];
    
    [self performRequestWithURL:URL
                  withParameter:nil
                    withSuccess:^(id responseObject) {
                        
                        NSArray *tickets = responseObject[ticketJsonKey];
                        NSMutableArray *ticketsModel = [NSMutableArray new];
                        [tickets enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                            Ticket *ticket = [[Ticket alloc] initTicketWithJson:obj];
                            [ticketsModel addObject:ticket];
                        }];
                        
                        if(successBlock) {
                            successBlock([ticketsModel copy]);
                        }
                        
                    } withFailure:^(NSError *error) {
                        if(failureBlock) {
                            failureBlock(error);
                        }
                    }];
    
}

@end
