//
//  MyDecimalClock.m
//  Grady
//
//  Created by Curt Gardner on 6/13/13.
//
//

#import "MyDecimalClock.h"
#include <math.h>


@implementation MyDecimalClock

// -------------------------------------------------------------------------------
//	initialSettings
//
//	This method is called once to perform initializations.
// -------------------------------------------------------------------------------
- (void)initialSettings
{    
    // ********** Create the hour hand ********** //
    myHourHandRect = CGRectMake (0, -2, 70, 4 );  // the hour hand
    
    // ********** Create the minute hand ********** //
    myMinuteHandRect = CGRectMake (0, -1, 80, 2 );  // the minute hand
    
    // ********** Set initial angles to 0 time ********* //
    myHourAngle = 270;
    myMinuteAngle = 270;
}

// -------------------------------------------------------------------------------
//	setMinuteAngle:angle
//
//	This method is called when the user changes the angle indicator,
//	which requires a re-display or update on this view.
// -------------------------------------------------------------------------------
- (void)setDecimalTime:(float)deciTime
{
	decimalTime = deciTime;
    
    // set myHourAngle value according to decimal time
    // the angle for deciHours is set by this line y = -36x + 270
    myHourAngle = deciTime * -36 + 270;
    
    // set myMinuteAngle value according to decimal time
    // first get decimal portion (minutes) of the time, then calculate minute angle
    // the angle for deciMinutes is set by this line y = -3.6x + 270
    int deciMinutes = 100 * (deciTime - floor(deciTime));
    myMinuteAngle = deciMinutes * -3.6 + 270;
    
	[self setNeedsDisplay:YES];	// make sure we update the change
}

// -------------------------------------------------------------------------------
//	drawRect:rect
//
//	This method is called to draw the clock, setting the hour and minute hands,
//	which requires a re-display or update on this view.
// -------------------------------------------------------------------------------
- (void)drawRect:(NSRect)rect
{
    // Get the graphics context
    CGContextRef myContext = [[NSGraphicsContext 
                               currentContext] graphicsPort];

    // transform to move origin point to center point of view
    CGContextTranslateCTM (myContext, 100, 100);
    
    // ********** Drawing the hour hand ********** //
    CGContextSaveGState(myContext);
    CGContextRotateCTM (myContext, ((myHourAngle * M_PI)/180));  // rotation in radians
    CGContextSetRGBFillColor (myContext, 1, 0, 0, 1);   // red
    CGContextFillRect (myContext, myHourHandRect);
    CGContextRestoreGState(myContext);
    
    // ********** Drawing the minute hand ********** // 
    CGContextSaveGState(myContext);
    CGContextRotateCTM (myContext, ((myMinuteAngle * M_PI)/180));  // rotation in radians
    CGContextSetRGBFillColor (myContext, 0, 0, 1, 1);   // blue
    CGContextFillRect (myContext, myMinuteHandRect);
    CGContextRestoreGState(myContext);
}

@end
