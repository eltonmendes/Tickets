//
//  DashboardViewController.m
//  ZendeskExercise
//
//  Created by Elton Mendes Viera on 07/01/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//

#import "DashboardViewController.h"

@interface DashboardViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(ticketRequestCompleted) name:@"TicketsRequestCompleted"
                                               object:nil];
}

- (void)ticketRequestCompleted {
    [self.activityIndicator stopAnimating];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:@"TicketsRequestCompleted"
                                                  object:nil];
}

@end
