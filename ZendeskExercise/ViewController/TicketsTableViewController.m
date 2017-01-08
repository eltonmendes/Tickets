
//
//  TicketsTableViewController.m
//  ZendeskExercise
//
//  Created by Elton Mendes Viera on 07/01/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//

#import "TicketsTableViewController.h"
#import "TicketsViewModel.h"
#import "TicketTableViewCell.h"

static NSString* const ticketReuseIdentifier = @"ticketCell";

@interface TicketsTableViewController ()
@property (nonatomic, readonly , strong) TicketsViewModel *viewModel;
@end

@implementation TicketsTableViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _viewModel = [TicketsViewModel new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak __block typeof(self) weakSelf = self;
    
    [self.viewModel allTicketsFromServerWithCompletion:^(BOOL success, NSError *error) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            if(success) {
                [weakSelf.tableView reloadData];
            } else if(error) {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
                [weakSelf presentViewController:alertController animated:YES completion:nil];
            }
        }];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.numberOfTicketsSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.numberOfTickets;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TicketTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ticketReuseIdentifier forIndexPath:indexPath];
    
    Ticket *ticket = [self.viewModel ticketForIndex:indexPath.row];
    [cell setupTicketCellWithTicket:ticket];
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
