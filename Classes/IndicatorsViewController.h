//
//  IndicatorsViewController.h
//  Indicators
//  DESCRIPTION: demonstrates displaying indicators from Amber Waves. Data stored in pList but could be read from an API
//  Created by Dina Li on 2/14/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndicatorsViewController : UITableViewController

{
    UITableView *myTableView;
    NSArray *tableData;
}
@property(nonatomic,retain) IBOutlet UITableView *myTableView;

@end
