/*
     File: MyWindowController.m 
 Abstract: The window controller class for this sample.
  
 //
 //  MyWindowController.m
 //
 //  Created by Curt Gardner on 6/13/13.
 //
 //
 
*/

#import "MyWindowController.h"

#import "MyDecimalClock.h"

@implementation MyWindowController

// -------------------------------------------------------------------------------
//	initWithPath:newPath
// -------------------------------------------------------------------------------
- initWithPath:(NSString*)newPath
{
    return [super initWithWindowNibName:@"TestWindow"];
}

// -------------------------------------------------------------------------------
//	awakeFromNib:
// -------------------------------------------------------------------------------
- (void)awakeFromNib
{
    
    // setup timer to keep refreshing the clock
        
    [NSTimer scheduledTimerWithTimeInterval:1.0
                            target:self
                            selector:@selector(refreshTime:)
                            userInfo:nil
                            repeats:YES];
    [decimalClockView initialSettings];
    
}

// -------------------------------------------------------------------------------
//	refreshTime:sender
// -------------------------------------------------------------------------------
//  get the current time & convert to decimal time
//

- (IBAction)refreshTime:(id)sender {
    NSDate *today = [NSDate date];
    
    // get normal bogus time string
    NSDateFormatter *formatter;
    NSString        *bogusTimeString;
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    
    bogusTimeString = [formatter stringFromDate:today];
    [formatter release];
    
    [bogusTime setStringValue:bogusTimeString];
    
    // get time components and calculate decimal time
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *weekdayComponents =
    [gregorian components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:today];
    [gregorian release];
    
    NSInteger hour = [weekdayComponents hour];
    NSInteger minute = [weekdayComponents minute];
    NSInteger second = [weekdayComponents second];

    long hourSeconds = hour * 3600;
    long minuteSeconds = minute * 60;
    long totalSeconds = hourSeconds + minuteSeconds + second;
    float deciTime = (totalSeconds / (float)8640);
    
    NSString *timeString = [NSString stringWithFormat:@"%.2f", deciTime];
    [decimalTime setStringValue:timeString];
    
    // Send decimal time to the clock view
    
    [decimalClockView setDecimalTime: deciTime];
}


@end
