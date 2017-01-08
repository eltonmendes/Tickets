//
//  Tickets.h
//  ZendeskExercise
//
//  Created by Elton Mendes Viera on 07/01/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    TicketStatusNew,
    TicketStatusPending,
} TicketStatus;

@interface Ticket : NSObject

@property (nonatomic , readonly , strong) NSString *subject;
@property (nonatomic , readonly , strong) NSString *ticketDescription;
@property (nonatomic , readonly , strong) NSString *ticketNumber;
@property (nonatomic , readonly , strong) NSString *ticketStatusDescription;
@property (nonatomic , readonly) TicketStatus ticketStatus;

- (instancetype)initTicketWithJson:(NSDictionary *)jsonObject;

@end
