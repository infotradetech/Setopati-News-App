//
//  PoliticsViewController.h
//  Setopati News App
//
//  Created by InfoTrade Tech on 8/13/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Setopati.h"
#import "AppDelegate.h"
#import "DetailsViewController.h"
#import <sqlite3.h>

@interface PoliticsViewController : UIViewController<UITableViewDataSource,
UITableViewDelegate>

{
    //IBOutlet UITableView *aTableView;
    Setopati *stdObj;
    sqlite3 *database;
}
@property(strong, nonatomic) Setopati *stdObj;
@property (strong, nonatomic) IBOutlet UITableView *aTableView;

@end
