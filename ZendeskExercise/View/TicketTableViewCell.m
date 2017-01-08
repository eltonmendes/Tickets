//
//  TicketTableViewCell.m
//  ZendeskExercise
//
//  Created by Elton Mendes Viera on 07/01/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//

#import "TicketTableViewCell.h"
#import "Ticket.h"

@interface TicketTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *ticketDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *subjectLabel;
@property (weak, nonatomic) IBOutlet UILabel *ticketStatusLabel;

@end

@implementation TicketTableViewCell

-(void)setupTicketCellWithTicket:(Ticket *)ticket {
    self.ticketDescriptionLabel.text = ticket.ticketDescription;
    self.subjectLabel.text = ticket.subject;
    self.ticketStatusLabel.text = ticket.ticketStatusDescription;
    [self setupStatus:ticket.ticketStatus];

}

- (void)setupStatus:(TicketStatus)ticketStatus {
    switch (ticketStatus) {
        case TicketStatusNew:
            self.ticketStatusLabel.textColor = [UIColor greenColor];
            break;
        case TicketStatusPending:
            self.ticketStatusLabel.textColor = [UIColor orangeColor];
            break;
        default:
            break;
    }
}


@end
