//
//  DKAClockUiViewController.h
//  NativeBedsideClock
//
//  Created by Daniel Albertson on 12/11/13.
//
//

#import <UIKit/UIKit.h>

@class DKAUserPreferences;

@interface DKAClockUiViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property NSDateFormatter *dateFormatter;
@property DKAUserPreferences *userPrefs;

@end
