//
//  DKAFontTableViewController.m
//  NativeBedsideClock
//
//  Created by Daniel Albertson on 12/12/13.
//
//

#import "DKAFontTableViewController.h"

@interface DKAFontTableViewController ()

@end

@implementation DKAFontTableViewController

NSMutableArray *fontNameArray;

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
    
    fontNameArray = [[NSMutableArray alloc] init];
    [self loadInitialData];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//*********************************************************************************************************************

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//*********************************************************************************************************************

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

//*********************************************************************************************************************

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [fontNameArray count];
}

//*********************************************************************************************************************

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FontCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [fontNameArray objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:cell.textLabel.text size:12.0f];
    
    return cell;
}

//*********************************************************************************************************************

- (void)loadInitialData
{
    // List all fonts on iPhone
    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    NSInteger indFamily, indFont;
    for (indFamily=0; indFamily<[familyNames count]; ++indFamily)
    {
        fontNames = [[NSArray alloc] initWithArray:
                     [UIFont fontNamesForFamilyName:
                      [familyNames objectAtIndex:indFamily]]];
        for (indFont=0; indFont<[fontNames count]; ++indFont)
        {
            [fontNameArray addObject:([fontNames objectAtIndex:indFont])];
        }
    }
    
    [fontNameArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];

}

//*********************************************************************************************************************


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSInteger index = [[self.tableView indexPathForSelectedRow] row];
    
    self.selectedFont = [[NSString alloc] init];
    self.selectedFont = [fontNameArray objectAtIndex:index];
}


@end
