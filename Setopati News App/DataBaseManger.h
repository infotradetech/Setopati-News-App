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
-(BOOL)addServiceToDataBase3:(NSMutableArray *)arrData3;
-(BOOL)addServiceToDataBase4:(NSMutableArray *)arrData4;
-(BOOL)addServiceToDataBase5:(NSMutableArray *)arrData5;
-(BOOL)addServiceToDataBase6:(NSMutableArray *)arrData6;
-(BOOL)addServiceToDataBase7:(NSMutableArray *)arrData7;
-(BOOL)addServiceToDataBase8:(NSMutableArray *)arrData8;
//-(NSMutableArray *)getAllBookedServices;
//-(BOOL)SelectedService:(NSMutableArray *)getAllBookedServices;
-(BOOL)deleteSelectedService:(DataBO *)objService;
-(BOOL)deleteSelectedService1:(DataBO *)objService;
-(BOOL)deleteSelectedService2:(DataBO *)objService;
-(BOOL)deleteSelectedService3:(DataBO *)objService;
-(BOOL)deleteSelectedService4:(DataBO *)objService;
-(BOOL)deleteSelectedService5:(DataBO *)objService;
-(BOOL)deleteSelectedService6:(DataBO *)objService;
-(BOOL)deleteSelectedService7:(DataBO *)objService;
-(BOOL)deleteSelectedService8:(DataBO *)objService;


@end
