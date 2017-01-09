//
//  TicketsViewModel.m
//  ZendeskExercise
//
//  Created by Elton Mendes Viera on 07/01/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//
#import "TicketsViewModel.h"
#import "TicketsService.h"
#import "Constants.h"

@interface TicketsViewModel ()

@property (nonatomic, strong) NSArray<Ticket *> *tickets;

@end

@implementation TicketsViewModel

- (void)allTicketsFromServerWithCompletion:(ticketsCompletionBlock) completion {
    [TicketsService requestTicketsFromServiceWithSuccess:^(NSArray<Ticket *> *tickets) {
        [[NSNotificationCenter defaultCenter] postNotificationName:TICKETS_NOTIFICATION_REQUEST
                                                            object:nil];
        self.tickets = tickets;
        completion(YES, nil);
    } withFailure:^(NSError *error) {
        completion(NO,error);
    }];
}

- (Ticket *)ticketForIndex:(NSUInteger)index {
    return self.tickets[index];
}

- (NSUInteger)numberOfTickets {
    return self.tickets.count;
}

- (NSUInteger)numberOfTicketsSections {
    return 1;
}

#pragma mark - Private Methods

- (void)filteredTicketsBy {
    
}

@end
