/*
 
 File: MyWindowController.h
 Abstract: The window controller class for the clock.
 
 //
 //  MyWindowController.h
 //
 //  Created by Curt Gardner on 6/13/13.
 //
 //
 
 */

#import <Cocoa/Cocoa.h>

@class MyDecimalClock;

@interface MyWindowController : NSWindowController
{
    IBOutlet MyDecimalClock       *decimalClockView;
    
    IBOutlet NSTextField          *decimalTime;
    IBOutlet NSTextField          *bogusTime;
}

- (IBAction)refreshTime:(id)sender;

@end
