//
//  TicketsTests.m
//  ZendeskExercise
//
//  Created by Elton Mendes Viera on 09/01/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OCMock.h"
#import "TicketsTableViewController.h"
#import "TicketTableViewCell.h"

@interface TicketsTests : XCTestCase

@end

@implementation TicketsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (TicketsTableViewController*)ticketsTableViewControllerMock {
    TicketsTableViewController *ticketsViewController = [[TicketsTableViewController alloc] init];
    id ticketsViewControllerMock = [OCMockObject partialMockForObject:ticketsViewController];
    [ticketsViewControllerMock verify];
    
    return ticketsViewController;
}

- (void)testTicketsTableViewController {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    UIViewController* viewController = [OCMArg checkWithBlock:^BOOL(id obj) {
        TicketsTableViewController *vc = obj;
        return ([vc isKindOfClass:[TicketsTableViewController class]]);
    }];
    XCTAssertNotNil(viewController,@"Is not kind of Class expected");
    UIView *view = [self ticketsTableViewControllerMock].view;
    XCTAssertNotNil(view, @"View expected");
    
}

- (void)testTicketsTableViewCell {
    
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    
    
    TicketTableViewCell *cell = [[TicketTableViewCell alloc] init];
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [[[mockTableView expect] andReturn:cell]
     dequeueReusableCellWithIdentifier:@"ticketCell"
     forIndexPath:indexPath];
    
    
    id result = [[self ticketsTableViewControllerMock] tableView:mockTableView
                                           cellForRowAtIndexPath:indexPath];
    
    
    XCTAssertEqual(result, cell, @"Should return a cell.");
    [mockTableView verify];
}


@end
