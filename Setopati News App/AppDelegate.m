//
//  AppDelegate.m
//  Setopati News App
//
//  Created by InfoTrade Tech on 7/21/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import "AppDelegate.h"
#import "PoliticsViewController.h"
//#import "DataBO.h"
//#import "DataBaseManger.h"
//#import "DataParser.h"

@implementation AppDelegate
@synthesize strDBPath;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /*self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];*/
    
    [self createEditableCopyOfDatabaseIfNeeded];
    [self initializeDataStructures];
   
    ViewController *mvc = [[ViewController alloc]init];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:mvc];
    self.window.rootViewController=navController;
    
    [self.window makeKeyAndVisible];

    // Override point for customization after application launch.
    return YES;
}

-(void)createEditableCopyOfDatabaseIfNeeded
{
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    printf("\n *********paths %lu",(unsigned long)[paths count]);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    printf("\n ********documentsDirectory***** %s",[documentsDirectory UTF8String]);
    
    
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"Data.sqlite"];
    
    printf("\n ****writableDBPath*** %s",[writableDBPath UTF8String]);
    
    success = [fileManager fileExistsAtPath:writableDBPath];
    
    if (success)
    {
        return;
    }
    else
    {
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Data.sqlite"];
        printf("\n defaultDBPath %s",[defaultDBPath UTF8String]);
        success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    }
    
    if (!success)
    {
    NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    }
    else
    {
        printf("\n Database Successfully copied");
    }
}

-(void)initializeDataStructures
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Data.sqlite"];
    
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
    }
    else
    {
        sqlite3_close(database);
        NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
    }
}

-(NSMutableArray *)getSetopatisList;
{
	NSMutableArray *setopatiList = [[NSMutableArray alloc]init];
    sqlite3_stmt* getStatement;
	
    const char* sql = "select * from business order by rowid asc limit 9";
	if (sqlite3_prepare_v2(database, sql, -1, &getStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	if (sqlite3_step(getStatement) == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
		//return NO;
    }
    else{
        
        do {
            
            Setopati *stdObj = [[Setopati alloc]init];
            
            stdObj.row_id=sqlite3_column_int(getStatement, 0);
            printf("Setopati row_id is %d",sqlite3_column_int(getStatement, 0));
            
            stdObj.title = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 1)];
            printf("\nSetopati Title is %s",[stdObj.title
                                           UTF8String]);
            
            stdObj.mixed_intro = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 2)];
            printf("\nSetopati mixed_intro is %s",[stdObj.mixed_intro UTF8String]);
            
            stdObj.body = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 4)];
            printf("\nSetopati Body is %s",[stdObj.body UTF8String]);
            stdObj.image = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 5)];
            printf("\nSetopati image is %s",[stdObj.place UTF8String]);
            stdObj.place = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 6)];
            printf("\nSetopati Place is %s",[stdObj.place UTF8String]);
            
            [setopatiList addObject:stdObj];
            
            //  [stdObj release];
            
         }
        
         while (sqlite3_step(getStatement) == SQLITE_ROW);
         printf("Successfully retrieved data from database");
    }
	
    sqlite3_finalize(getStatement);
    
    return setopatiList;
	}

/*-(void)addServiceToDataBase:(NSMutableArray *)arrData
{
    
    BOOL returnValue = YES;
    sqlite3_stmt *addStmt = nil;
    sqlite3 *dataBase = nil;
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
    }
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([strDBPath UTF8String], &dataBase) == SQLITE_OK)
    {
        
        for (int i=0 ; i< arrData.count-1; i++)
        {
            DataBO *objDetails = [arrData objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  politics(row_id,title,mixed_intro,author,body,image,place,news_date,lang,updt_tmstmp,link_href) Values (?,?,?,?,?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO tblSample statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            //}
            if(rowidentifier == -1)
            {
                if(sqlite3_bind_text(addStmt, 1, [objDetails.strRowId UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 2, [objDetails.strTitle UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 3, [objDetails.strintro UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 4, [objDetails.strAuthor UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 5, [objDetails.strBody UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 6, [objDetails.strImage UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 7, [objDetails.strplace UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                
                if(sqlite3_bind_text(addStmt, 8, [objDetails.strnews_date UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 9, [objDetails.strlang UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 10, [objDetails.strTime UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(sqlite3_bind_text(addStmt, 11, [objDetails.strLink_href UTF8String], -1, SQLITE_TRANSIENT) != SQLITE_OK)
                {
                    returnValue = NO;
                }
                if(SQLITE_DONE != sqlite3_step(addStmt))
                {
                    returnValue = NO;
                }
                
                sqlite3_reset(addStmt);
            }
            
            objDetails = nil;
        }
    }
    
    if (addStmt)
    {
        sqlite3_finalize(addStmt);
        addStmt = nil;
    }
    sqlite3_close(dataBase);
    dataBase = nil;
    
    //return returnValue;
}

*/

/*-(void)insertSetopati:(Setopati*)stdObj
{
	
    sqlite3_stmt* insertStatement;
	
    //const char* sql = "insert into politics(data) values (?)";
    NSString *strValue = [NSString stringWithFormat:@"INSERT INTO politics(row_id,title,body,place) Values (?,?,?,?)"];
    const char *sql = [strValue UTF8String];
 
	
	
    if (sqlite3_prepare_v2(database, sql, -1, &insertStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	   
	
   // sqlite3_bind_text(insertStatement, 1, [objectForKey.title UTF8String], -1, SQLITE_TRANSIENT);
    //sqlite3_bind_text(insertStatement, 1, [stdObj.row_id UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(insertStatement, 2, [stdObj.title UTF8String], -2, SQLITE_TRANSIENT);
     sqlite3_bind_text(insertStatement, 3, [stdObj.place UTF8String], -3, SQLITE_TRANSIENT);
     sqlite3_bind_text(insertStatement, 4, [stdObj.body UTF8String], -4, SQLITE_TRANSIENT);
    int success = sqlite3_step(insertStatement);
    sqlite3_finalize(insertStatement);
	 
    if (success == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
	}
    else
    {
		printf("\n Insertion Successful");
    }
	}

-(void)insertSetopati1:(Setopati*)stdObj
{
	
    sqlite3_stmt* insertStatement;
	
	NSString *sql = [NSString stringWithFormat:@"insert into politics(data) values ('%@')",stdObj.title];
    
	NSLog(@"String is %@",sql);
	
	
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &insertStatement, NULL) != SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
    }
	
    sqlite3_bind_text(insertStatement, 2, [stdObj.data UTF8String], -1, SQLITE_TRANSIENT);
	
    int success = sqlite3_step(insertStatement);
    sqlite3_finalize(insertStatement);
    if (success == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
	}
    else
    {
		printf("\n Insertion Successful");
    }
	
}*/



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
