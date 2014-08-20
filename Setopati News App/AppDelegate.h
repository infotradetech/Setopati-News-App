//
//  AppDelegate.h
//  Setopati News App
//
//  Created by InfoTrade Tech on 7/21/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "DetailsViewController.h"
#import "PoliticsViewController.h"
#import <sqlite3.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    sqlite3 *database;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic)NSString *strDBPath;
-(NSMutableArray *)getSetopatisList;
-(NSMutableArray *)getSetopatisList1;
-(NSMutableArray *)getSetopatisList2;
-(NSMutableArray *)getSetopatisList3;
-(NSMutableArray *)getSetopatisList4;
-(NSMutableArray *)getSetopatisList5;
-(NSMutableArray *)getSetopatisList6;
-(NSMutableArray *)getSetopatisList7;
-(NSMutableArray *)getSetopatisList8;
//-(void)insertSetopati:(Setopati*)sObj;
//-(void)insertSetopati1:(Setopati*)sObj;
//-(void)addServiceToDataBase:(NSMutableArray *)arrData;

@end
