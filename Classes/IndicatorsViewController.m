//
//  IndicatorsViewController.m
//  Indicators
//  DESCRIPTION: display sample of Amber Waves indicators in a table
//  Created by Dina Li on 2/14/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

#import "IndicatorsViewController.h"

@interface IndicatorsViewController ()

@end

@implementation IndicatorsViewController

@synthesize myTableView = _myTableView;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.title = @"USDA-ERS Indicators";
    
    NSString *myListPath = [[NSBundle mainBundle] pathForResource:@"Indicators" ofType:@"plist"];
    tableData = [[NSArray alloc]initWithContentsOfFile:myListPath];
  //  NSLog(@"%@",tableData);
    // NSLog(@"tableData count %d", [tableData count]); // TODO: this works fine, but then it crashes right here!!
    
    self.myTableView.delegate = self;
    
    //NSLog(@"%@,%@",myTableView.delegate, myTableView.dataSource);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [tableData count];
    // TODO: have to tie the rows to the sections and fix this
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // NSLog(@"cellForRow");
    
    //static NSString *CellIdentifier = @"Cell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if( cell == nil )
    {
        // NSLog(@"Cell Creation");
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    //Set Data For each Cell
    cell.textLabel.text = [[tableData objectAtIndex:indexPath.row]objectForKey:@"Name"];
    cell.textLabel.numberOfLines = 3;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.detailTextLabel.text = [[tableData objectAtIndex:indexPath.row]objectForKey:@"Rate"];
    
    UIImage *cellImage = [UIImage imageNamed:@"tractor.png"];
    cell.imageView.image = cellImage;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
     
    return cell;
}

// TODO: fix the section titles
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return @"Farm, Rural, and Natural Resource Indicators (annual percent change: 2010 - 2011)";
    
   // NSArray *sectionTitleArray = [NSArray arrayWithObjects:@"Policy",@"Farm Techniques",@"Trends",nil];
    
   // return [sectionTitleArray objectAtIndex:section];
    
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
