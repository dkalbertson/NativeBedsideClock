//
//  DKAUserPreferences.m
//  NativeBedsideClock
//
//  Created by Daniel Albertson on 1/2/14.
//
//

#import "DKAUserPreferences.h"

@implementation DKAUserPreferences

-(id)initWithFontColor: (NSString*)fontColor andFontName:(NSString*)fontName andShowTwentyFourHour:(bool)twentyFourHour andShowSeconds:(bool)displaySeconds andBrightness:(float)theBrightness
{
    if (self = [super init])
    {
        _fontColorString    = fontColor;
        _fontNameString     = fontName;
        _showTwentyFourHour = twentyFourHour;
        _showSeconds        = displaySeconds;
        _brightness         = theBrightness;
    }
    
    return self;
}

//*********************************************************************************************************************

#pragma mark NSCoding

#define kColorKey       @"Color"
#define kFontKey        @"Font"
#define k24HourKey      @"24Hour"
#define kSecondsKey     @"Seconds"
#define kBrightnessKey  @"Brightness"

- (void) encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:_fontColorString  forKey:kColorKey];
    [encoder encodeObject:_fontNameString   forKey:kFontKey];
    [encoder encodeBool:_showTwentyFourHour forKey:k24HourKey];
    [encoder encodeBool:_showSeconds        forKey:kSecondsKey];
    [encoder encodeFloat:_brightness        forKey:kBrightnessKey];
}

//*********************************************************************************************************************

- (id)initWithCoder:(NSCoder *)decoder
{
    NSString *colorString   = [decoder decodeObjectForKey:kColorKey];
    NSString *fontString    = [decoder decodeObjectForKey:kFontKey];
    
    bool twentyFourHour = [decoder decodeBoolForKey:k24HourKey];
    bool seconds        = [decoder decodeBoolForKey:kSecondsKey];
    
    float bright = [decoder decodeFloatForKey:kBrightnessKey];
    
    return [self initWithFontColor:colorString andFontName:fontString andShowTwentyFourHour:twentyFourHour andShowSeconds:seconds andBrightness:bright];
}

@end
