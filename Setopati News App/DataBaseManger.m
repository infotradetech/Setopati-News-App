//
//  DataBaseManger.m
//  sampleDataBase
//
//  Created by Connexun on 26/07/14.
//  Copyright (c) 2014 connexun. All rights reserved.
//

#import "DataBaseManger.h"

@implementation DataBaseManger

@synthesize strDBPath;

- (id) init
{
	self = [super init];
	if (self != nil)
	{
        strDBPath = [self getDBPath];
    }
	return self;
}

-(NSString *)getDBPath

{
    
    NSArray *arrPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    
    NSString *documentsDir = [arrPaths objectAtIndex:0];
    
    NSString *str = [documentsDir stringByAppendingPathComponent:@"DataSetopati.sqlite"];
    
    return str;
    
}


-(BOOL)addServiceToDataBase:(NSMutableArray *)arrData
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
        NSString *strValue = [NSString stringWithFormat:@"INSERT INTO politics(row_id,title,mixed_intro,author,body,image,place,news_date,lang,updt_tmstmp,link_href) Values (?,?,?,?,?,?,?,?,?,?,?)"];
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
    
    return returnValue;
}

-(BOOL)addServiceToDataBase1:(NSMutableArray *)arrData1
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
        for (int i =0 ; i< arrData1.count-1; i++)
        {
            DataBO *objDetails = [arrData1 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
    NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  society(row_id,title,mixed_intro,author,body,image,place,news_date,lang,updt_tmstmp,link_href) Values (?,?,?,?,?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO tblSample statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
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
    
    return returnValue;
}

-(BOOL)addServiceToDataBase2:(NSMutableArray *)arrData2
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
        for (int i =0 ; i< arrData2.count-1; i++)
        {
            DataBO *objDetails = [arrData2 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  business (row_id,title,mixed_intro,author,body,image,place,news_date,lang,updt_tmstmp,link_href) Values (?,?,?,?,?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO tblSample statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
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
    
    return returnValue;
}
-(BOOL)addServiceToDataBase3:(NSMutableArray *)arrData3
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
        for (int i =0 ; i< arrData3.count-1; i++)
        {
            DataBO *objDetails = [arrData3 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  art (row_id,title,mixed_intro,author,body,image,place,news_date,lang,updt_tmstmp,link_href) Values (?,?,?,?,?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO tblSample statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
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
    
    return returnValue;
}
-(BOOL)addServiceToDataBase4:(NSMutableArray *)arrData4
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
        for (int i =0 ; i< arrData4.count-1; i++)
        {
            DataBO *objDetails = [arrData4 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  sports (row_id,title,mixed_intro,author,body,image,place,news_date,lang,updt_tmstmp,link_href) Values (?,?,?,?,?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO tblSample statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
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
    
    return returnValue;
}
-(BOOL)addServiceToDataBase5:(NSMutableArray *)arrData5
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
        for (int i =0 ; i< arrData5.count-1; i++)
        {
            DataBO *objDetails = [arrData5 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  special (row_id,title,mixed_intro,author,body,image,place,news_date,lang,updt_tmstmp,link_href) Values (?,?,?,?,?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO tblSample statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
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
    
    return returnValue;
}

-(BOOL)addServiceToDataBase6:(NSMutableArray *)arrData6
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
        for (int i =0 ; i< arrData6.count-1; i++)
        {
            DataBO *objDetails = [arrData6 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  opinion (row_id,title,mixed_intro,author,body,image,place,news_date,lang,updt_tmstmp,link_href) Values (?,?,?,?,?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO tblSample statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
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
    
    return returnValue;
}
-(BOOL)addServiceToDataBase7:(NSMutableArray *)arrData7
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
        for (int i =0 ; i< arrData7.count-1; i++)
        {
            DataBO *objDetails = [arrData7 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  blog (row_id,title,mixed_intro,author,body,image,place,news_date,lang,updt_tmstmp,link_href) Values (?,?,?,?,?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO tblSample statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
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
    
    return returnValue;
}
-(BOOL)addServiceToDataBase8:(NSMutableArray *)arrData8
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
        for (int i =0 ; i< arrData8.count-1; i++)
        {
            DataBO *objDetails = [arrData8 objectAtIndex:i ];
            NSInteger rowidentifier = -1;
            if(addStmt == nil)
            {
                NSString *strValue = [NSString stringWithFormat:@"INSERT INTO  advd (row_id,title,mixed_intro,author,body,image,place,news_date,lang,updt_tmstmp,link_href) Values (?,?,?,?,?,?,?,?,?,?,?)"];
                const char *sql = [strValue UTF8String];
                if(sqlite3_prepare_v2(dataBase, sql, -1, &addStmt, NULL) != SQLITE_OK)
                {
                    NSLog(@"Error while creating INSERT INTO tblSample statement. '%s'", sqlite3_errmsg(dataBase));
                }
            }
            
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
    
    return returnValue;
}



/*-(NSMutableArray *)getAllBookedServices;
{
    // query selected

    sqlite3_stmt *selectAllStmt = nil;
    sqlite3 *dataBase = nil;
    
    NSMutableArray *tempArr=[NSMutableArray array];
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        printf("\n Database Successfully Opened");
        
    }
    
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([ strDBPath UTF8String], &dataBase) == SQLITE_OK)
    {
        NSString *strQuery=@"select * from politics order by rowid asc limit 9";
        const char *sql = [strQuery UTF8String];
        
        if(sqlite3_prepare_v2(dataBase, sql, -1, &selectAllStmt,NULL) == SQLITE_OK)
        {
             NSLog(@"Error while get the data from database. '%s'", sqlite3_errmsg(dataBase));
           
            while(sqlite3_step(selectAllStmt) == SQLITE_ROW)
            {
                DataBO *objDetails = [[DataBO alloc] init];
                
                char *chrstr1 =(char *)sqlite3_column_text(selectAllStmt, 1);
                if(chrstr1 !=NULL)
                {
                    objDetails.strRowId = [NSString stringWithUTF8String:chrstr1];
                }

                char *chrstr2 =(char *)sqlite3_column_text(selectAllStmt, 2);
                if(chrstr2 !=NULL)
                {
                    objDetails.strTitle = [NSString stringWithUTF8String:chrstr2];
                }

                char *chrstr3 =(char *)sqlite3_column_text(selectAllStmt, 3);
                if(chrstr3 !=NULL)
                {
                    objDetails.strintro = [NSString stringWithUTF8String:chrstr3];
                }
                char *chrstr4 =(char *)sqlite3_column_text(selectAllStmt, 4);
                if(chrstr4 !=NULL)
                {
                    objDetails.strAuthor = [NSString stringWithUTF8String:chrstr4];
                }
                char *chrstr5 =(char *)sqlite3_column_text(selectAllStmt, 5);
                if(chrstr5 !=NULL)
                {
                  objDetails.strBody = [NSString stringWithUTF8String:chrstr5];
                }

                char *chrstr6 =(char *)sqlite3_column_text(selectAllStmt, 6);
                if(chrstr6 !=NULL)
                {
                    objDetails.strImage = [NSString stringWithUTF8String:chrstr6];
                }

                char *chrstr7 =(char *)sqlite3_column_text(selectAllStmt, 7);
                if(chrstr7 !=NULL)
                {
                    objDetails.strplace = [NSString stringWithUTF8String:chrstr7];
                }

                char *chrstr8 =(char *)sqlite3_column_text(selectAllStmt, 8);
                if(chrstr8 !=NULL)
                {
                   objDetails.strnews_date = [NSString stringWithUTF8String:chrstr8];
                }

               
            [tempArr addObject:objDetails];
              objDetails = nil;
            
            }
        
        }
        
        sqlite3_reset(selectAllStmt);
        if (selectAllStmt)
        {
            sqlite3_finalize(selectAllStmt);
            selectAllStmt = nil;
        }
    }
    sqlite3_close(dataBase);
    
    return tempArr;
   }
*/
/*-(NSMutableArray *)getAllBookedServices;
{
    // query selected
    
    sqlite3_stmt *selectAllStmt;
    sqlite3 *dataBase;
    
    NSMutableArray *tempArr=[NSMutableArray array];
    sqlite3_stmt *getStatement;
    const char *sql ="select * from politics";
    if(sqlite3_prepare_v2(dataBase, sql, -1, &selectAllStmt,NULL) == SQLITE_OK)
    {
        NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(dataBase));
    }
    if (sqlite3_step(getStatement) == SQLITE_ERROR)
    {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(dataBase));
		//return NO;
    }
    else{
        do{
            DataBO *objDetails = [[DataBO alloc] init];
            
            objDetails.strTitle = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 1)];
            printf("\n Title is %s",[objDetails.strTitle UTF8String]);
            
            objDetails.strBody = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 2)];
            printf("\n Title is %s",[objDetails.strTitle UTF8String]);
           
            objDetails.strplace = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 3)];
            printf("\n Title is %s",[objDetails.strTitle UTF8String]);
            
            objDetails.strAuthor = [NSString stringWithUTF8String:(char*)sqlite3_column_text(getStatement, 4)];
            printf("\n Title is %s",[objDetails.strTitle UTF8String]);



            
        }
        while (sqlite3_step(getStatement) == SQLITE_ROW);
        printf("Successfully retrieved data from database");
    }
    sqlite3_finalize(getStatement);
    
    return tempArr;
}
*/

-(BOOL)deleteSelectedService:(DataBO *)objService
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM politics"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)deleteSelectedService1:(DataBO *)objService
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM society"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)deleteSelectedService2:(DataBO *)objService
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM business"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)deleteSelectedService3:(DataBO *)objService
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM art"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)deleteSelectedService4:(DataBO *)objService
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM sports"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)deleteSelectedService5:(DataBO *)objService
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM special"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)deleteSelectedService6:(DataBO *)objService
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM opinion"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)deleteSelectedService7:(DataBO *)objService
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM blog"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}
-(BOOL)deleteSelectedService8:(DataBO *)objService
{
	sqlite3_stmt *deleteStmt = nil;
	sqlite3 *selectDatabase = nil;
	
	
	if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
	{
 	}
	// Open the database. The database was prepared outside the application.
	
	
	if (sqlite3_open([strDBPath UTF8String], &selectDatabase) == SQLITE_OK)
	{
        
        NSString *strDeleteStmt= [NSString stringWithFormat:@"DELETE FROM advd"];
        const char *DELETEsql = [strDeleteStmt UTF8String];
        
        if(sqlite3_prepare_v2(selectDatabase, DELETEsql, -1, &deleteStmt, NULL) != SQLITE_OK)
        {
            NSLog(@"Error while delete row preparing statement in tblBookedService. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        if(SQLITE_DONE != sqlite3_step(deleteStmt))
        {
            NSLog(@"Error while deleting into tblBookedService Row. '%s'", sqlite3_errmsg(selectDatabase));
        }
        
        sqlite3_reset(deleteStmt);
		
		sqlite3_finalize(deleteStmt);
		deleteStmt = nil;
		sqlite3_close(selectDatabase);
	}
	return YES;
}





@end
