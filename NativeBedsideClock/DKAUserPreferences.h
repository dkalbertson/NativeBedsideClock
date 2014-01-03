//
//  DKAUserPreferences.h
//  NativeBedsideClock
//
//  Created by Daniel Albertson on 1/2/14.
//
//

#import <Foundation/Foundation.h>

#define kUserPreferencesObjectKey  @"UserPreferences"

@interface DKAUserPreferences : NSObject <NSCoding>

@property NSString* fontColorString;

@property NSString* fontNameString;

@property bool showTwentyFourHour;

@property bool showSeconds;

@property float brightness;


-(id)initWithFontColor: (NSString*)fontColor andFontName:(NSString*)fontName andShowTwentyFourHour:(bool)twentyFourHour andShowSeconds:(bool)displaySeconds andBrightness:(float)theBrightness;
@end
