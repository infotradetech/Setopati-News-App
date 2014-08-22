//
//  NOpinionViewController.h
//  Setopati News App
//
//  Created by InfoTrade Tech on 8/22/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Setopati.h"
#import "AppDelegate.h"
#import "DetailsViewController.h"
#import <sqlite3.h>
#import "NSocietyViewController.h"
#import "NBusinessViewController.h"
#import "NArtViewController.h"
#import "NSportsViewController.h"
#import "NSpecialViewController.h"
#import "NOpinionViewController.h"
#import "NBlogViewController.h"
#import "NLiteratureViewController.h"

@interface NOpinionViewController : UIViewController<UITableViewDelegate,   UITableViewDataSource,
UITableViewDataSource,UITableViewDelegate>
{
    //IBOutlet UITableView *aTableView;
    Setopati *stdObj;
    sqlite3 *database;
    
    BOOL buttonClicked;
    
    BOOL flag;
    NSArray *arryData;
    NSString *pType;
    
}
@property(strong, nonatomic) Setopati *stdObj;
//@property(strong, nonatomic) Setopati *stdObj;
@property (strong, nonatomic) IBOutlet UITableView *aTableView;
@property (strong, nonatomic) IBOutlet UITableView *bTableView;



@end
