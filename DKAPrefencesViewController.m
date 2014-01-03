//
//  DKAPrefencesViewController.m
//  NativeBedsideClock
//
//  Created by Daniel Albertson on 12/28/13.
//
//

#import "DKAUserPreferences.h"
#import "DKAPrefencesViewController.h"
#import "DKAFontTableViewController.h"
#import "DKAClockUiViewController.h"

@interface DKAPrefencesViewController ()

@end

@implementation DKAPrefencesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

//*********************************************************************************************************************

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.fontName.text = self.userPrefs.fontNameString;
    self.twentyFourHourSwitch.on = self.userPrefs.showTwentyFourHour;
    self.secondsSwitch.on = self.userPrefs.showSeconds;
    [self.brightnessSlider setValue:self.userPrefs.brightness animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//*********************************************************************************************************************


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Done"])
    {
        self.userPrefs.fontNameString = self.fontName.text;
        self.userPrefs.showTwentyFourHour = self.twentyFourHourSwitch.isOn;
        self.userPrefs.showSeconds = self.secondsSwitch.isOn;
        self.userPrefs.brightness = self.brightnessSlider.value;
        
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.userPrefs];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:kUserPreferencesObjectKey];
    }
}

//*********************************************************************************************************************

 - (IBAction)unwindToPreferences:(UIStoryboardSegue *)segue
 {
 DKAFontTableViewController* source = [segue sourceViewController];
 self.fontName.text = source.selectedFont;
 }

 

@end
