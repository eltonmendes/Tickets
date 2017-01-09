//
//  Tickets.m
//  ZendeskExercise
//
//  Created by Elton Mendes Viera on 07/01/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//

#import "Ticket.h"

static NSString* const subjectJsonKey = @"subject";
static NSString* const ticketDescriptionJsonKey = @"description";
static NSString* const ticketNumberJsonKey = @"subject";
static NSString* const ticketStatusJsonKey = @"status";
static NSString* const ticketStatusNewKey = @"new";
static NSString* const ticketStatusPendingKey = @"pending";
static NSString* const ticketStatusOpenKey = @"open";

@implementation Ticket

- (instancetype)initTicketWithJson:(NSDictionary *)jsonObject {
    
    if (self = [super init]) {
        _subject = jsonObject[subjectJsonKey];
        _ticketDescription = jsonObject[ticketDescriptionJsonKey];
        _ticketStatusDescription = jsonObject[ticketStatusJsonKey];
        [self setupStatus];
        
    }
    
    return self;
}

- (void)setupStatus {
    if([_ticketStatusDescription isEqualToString:ticketStatusNewKey]) {
        _ticketStatus = TicketStatusNew;
    } else if([_ticketStatusDescription isEqualToString:ticketStatusPendingKey]) {
        _ticketStatus = TicketStatusPending;
    } else if([_ticketStatusDescription isEqualToString:ticketStatusOpenKey]) {
        _ticketStatus = TicketStatusOpen;
    }
}
@end
