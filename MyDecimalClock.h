//
//  MyDecimalClock.h
//  Grady
//
//  Created by Curt Gardner on 6/13/13.
//
//

#import <Foundation/Foundation.h>

@interface MyDecimalClock : NSView
{
    CGRect      myHourHandRect;
    CGRect      myMinuteHandRect;
    
    float       decimalTime;
	
	CGFloat		myHourAngle;		// the angle used for the hour hand
    CGFloat		myMinuteAngle;		// the angle used for the minute hand
	
}

- (void)setDecimalTime:(float)deciTime;
- (void)initialSettings;

@end
