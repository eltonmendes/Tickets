//
//  TicketsViewModel.h
//  ZendeskExercise
//
//  Created by Elton Mendes Viera on 07/01/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Ticket;

typedef void (^ticketsCompletionBlock) (BOOL success , NSError *error);

@interface TicketsViewModel : NSObject

- (NSUInteger)numberOfTickets;
- (NSUInteger)numberOfTicketsSections;
- (Ticket *)ticketForIndex:(NSUInteger)index;
- (void)allTicketsFromServerWithCompletion:(ticketsCompletionBlock) completion;

@end
