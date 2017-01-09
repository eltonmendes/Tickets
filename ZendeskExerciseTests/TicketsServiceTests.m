//
//  TicketsServiceTests.m
//  ZendeskExercise
//
//  Created by Elton Mendes Viera on 09/01/2017.
//  Copyright © 2017 EltonMendes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TicketsService.h"

@interface TicketsServiceTests : XCTestCase

@end

@implementation TicketsServiceTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRequestTickets {
    XCTestExpectation *successExpectation = [self expectationWithDescription:@"Should return tickets or Error"];
    
    [TicketsService requestTicketsFromServiceWithSuccess:^(NSArray<Ticket *> *tickets) {
        XCTAssertNotNil(tickets);
        [successExpectation fulfill];
    } withFailure:^(NSError *error) {
        XCTAssertNotNil(error);
        [successExpectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:30 handler:nil];

}

@end
