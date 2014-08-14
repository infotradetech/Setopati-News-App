//
//  DataBaseManger.h
//  sampleDataBase
//
//  Created by Connexun on 26/07/14.
//  Copyright (c) 2014 connexun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataBO.h"
#import <sqlite3.h>



@interface DataBaseManger : NSObject

@property (strong, nonatomic)NSString *strDBPath;

-(BOOL)addServiceToDataBase:(NSMutableArray *)arrData;
-(BOOL)addServiceToDataBase1:(NSMutableArray *)arrData1;
-(BOOL)addServiceToDataBase2:(NSMutableArray *)arrData2;
//-(NSMutableArray *)getAllBookedServices;
//-(BOOL)SelectedService:(NSMutableArray *)getAllBookedServices;
-(BOOL)deleteSelectedService:(DataBO *)objService;


@end
