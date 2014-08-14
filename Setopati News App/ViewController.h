//
//  ViewController.h
//  Setopati News App
//
//  Created by InfoTrade Tech on 7/21/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Setopati.h"
#import "AppDelegate.h"
#import "DetailsViewController.h"
#import <sqlite3.h>


@interface ViewController : UIViewController
{
    Setopati *stdObj;
    sqlite3 *database;
}
@property(strong, nonatomic) Setopati *stdObj;
@end
 