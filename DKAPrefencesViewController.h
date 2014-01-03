//
//  DKAPrefencesViewController.h
//  NativeBedsideClock
//
//  Created by Daniel Albertson on 12/28/13.
//
//

#import <UIKit/UIKit.h>

@class DKAUserPreferences;

@interface DKAPrefencesViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *fontColor;

@property (weak, nonatomic) IBOutlet UILabel *fontName;

@property (weak, nonatomic) IBOutlet UISwitch *twentyFourHourSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *secondsSwitch;

@property (weak, nonatomic) IBOutlet UISlider *brightnessSlider;

@property DKAUserPreferences *userPrefs;

@end
