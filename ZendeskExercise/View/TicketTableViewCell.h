//
//  TicketTableViewCell.h
//  ZendeskExercise
//
//  Created by Elton Mendes Viera on 07/01/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Ticket;

@interface TicketTableViewCell : UITableViewCell

-(void)setupTicketCellWithTicket:(Ticket *)ticket
                       withIndex:(NSUInteger)idx;

@end
