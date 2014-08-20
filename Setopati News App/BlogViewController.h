//
//  BlogViewController.h
//  Setopati News App
//
//  Created by InfoTrade Tech on 8/20/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Setopati.h"
#import "AppDelegate.h"
#import "DetailsViewController.h"
#import <sqlite3.h>
#import "SocietyViewController.h"
#import "BusinessViewController.h"
#import "ArtViewController.h"
#import "SportsViewController.h"
#import "SpecialViewController.h"
#import "OpinionViewController.h"
#import "BlogViewController.h"
#import "AdvdViewController.h"

@interface BlogViewController : UIViewController<UITableViewDelegate,   UITableViewDataSource,
UITableViewDataSource,UITableViewDelegate>
{
    //IBOutlet UITableView *aTableView;
    Setopati *stdObj;
    sqlite3 *database;
    
    
    BOOL flag;
    NSArray *arryData;
    NSString *pType;
    
}
@property(strong, nonatomic) Setopati *stdObj;
//@property(strong, nonatomic) Setopati *stdObj;
@property (strong, nonatomic) IBOutlet UITableView *aTableView;
@property (strong, nonatomic) IBOutlet UITableView *bTableView;
@end
