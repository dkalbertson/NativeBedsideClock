//
//  DKAClockUiViewController.m
//  NativeBedsideClock
//
//  Created by Daniel Albertson on 12/11/13.
//
//

#import "DKAUserPreferences.h"
#import "DKAClockUiViewController.h"
#import "DKAPrefencesViewController.h"


@interface DKAClockUiViewController ()

@end

@implementation DKAClockUiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//*********************************************************************************************************************

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    NSData *data    = [[NSUserDefaults standardUserDefaults] objectForKey:kUserPreferencesObjectKey];
    self.userPrefs  = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    
    if (self.userPrefs == nil)
    {
        self.userPrefs =[[DKAUserPreferences alloc] initWithFontColor:@"White" andFontName:[self.timeLabel.font fontName] andShowTwentyFourHour:false andShowSeconds:true andBrightness:1.0];
    }
    
    self.timeLabel.font = [UIFont fontWithName:self.userPrefs.fontNameString size:self.timeLabel.font.pointSize];
    
    [self formatTimeString];
    
    [self updateTime];
}

//*********************************************************************************************************************

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//*********************************************************************************************************************

-(void)updateTime
{
    self.timeLabel.text = [self.dateFormatter stringFromDate:[NSDate date]];
    
    // repeat every second
    [self performSelector:@selector(updateTime) withObject:self afterDelay:1.0];
    
}

//*********************************************************************************************************************

- (IBAction)unwindToClock:(UIStoryboardSegue *)segue
{
    self.timeLabel.font = [UIFont fontWithName:self.userPrefs.fontNameString size:self.timeLabel.font.pointSize];
    
    [self formatTimeString];
    
    [self updateTime];
}

//*********************************************************************************************************************

-(void)formatTimeString
{
    if (self.userPrefs.showTwentyFourHour)
    {
        if (self.userPrefs.showSeconds)
        {
            [self.dateFormatter setDateFormat:@"HH:mm:ss"];
        }
        else
        {
            [self.dateFormatter setDateFormat:@"HH:mm"];
        }
    }
    else
    {
        if (self.userPrefs.showSeconds)
        {
            [self.dateFormatter setDateFormat:@"hh:mm:ss a"];
        }
        else
        {
            [self.dateFormatter setDateFormat:@"hh:mm a"];
        }
    }

}

//*********************************************************************************************************************

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"clockToPreferences"])
    {
        DKAPrefencesViewController* dest = [segue destinationViewController];
        
        dest.userPrefs = self.userPrefs;
    }
}

@end
