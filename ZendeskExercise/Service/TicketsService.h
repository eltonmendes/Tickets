//
//  TicketsService.h
//  ZendeskExercise
//
//  Created by Elton Mendes Viera on 07/01/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//

#import "Service.h"

@class Ticket;

typedef void (^ticketsServiceSuccessBlock) (NSArray<Ticket *> * tickets);
typedef void (^ticketsServiceFailureBlock) (NSError *error);

@interface TicketsService : Service


+ (void)requestTicketsFromServiceWithSuccess:(ticketsServiceSuccessBlock)successBlock
                                 withFailure:(ticketsServiceFailureBlock)failureBlock;

@end
