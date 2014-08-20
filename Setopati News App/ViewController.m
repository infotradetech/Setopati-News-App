//
//  ViewController.m
//  Setopati News App
//
//  Created by InfoTrade Tech on 7/21/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import "ViewController.h"
#import "DataBO.h"
#import "DataBaseManger.h"
#import "DataParser.h"
#import "PoliticsViewController.h"
@interface ViewController ()
{
   // NSData *data;
    NSMutableArray *setopatisDataArr;
    NSDictionary *jsonDictionary, *jsonDict;
    NSArray *jsonArray;
    NSMutableArray *setopatiList;
}

@end

@implementation ViewController
@synthesize stdObj;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
if (self) {
    /*self.view = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.*/
    self.view.backgroundColor = [UIColor grayColor];
    
    UIImage *image = [UIImage imageNamed:@"t1.png"];
    UIButton *thirdButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 75,300,235)];
    [thirdButton setImage:image forState:UIControlStateNormal];
    [thirdButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:thirdButton];
    
    UIImage *imagese = [UIImage imageNamed:@"t2.png"];
    UIButton *thirdButton1 = [[UIButton alloc]initWithFrame:CGRectMake(10, 320,300,235)];
    [thirdButton1 setImage:imagese forState:UIControlStateNormal];
    [thirdButton1 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:thirdButton1];
   
}
    return self;
}
-(void)buttonAction
{
    PoliticsViewController *fvc = [[PoliticsViewController alloc]init];
    // fvc.stdObj=[setopatisDataArr objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:fvc animated:NO];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
    NSString *urlString = @"http://www.infotradetechapp.com/Setopati/setopatiapi.php?action=politics_en";
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    jsonDictionary=[NSJSONSerialization JSONObjectWithData:
                    data options:NSJSONReadingMutableLeaves error:nil];
    jsonArray=[jsonDictionary objectForKey:@"data"];
    NSLog(@"jsonDictionary data is %@",jsonDictionary);
    
    NSString *urlString1 = @"http://www.infotradetechapp.com/Setopati/setopatiapi.php?action=society_en";
    NSURL *url1 = [NSURL URLWithString:urlString1];
    NSData *data1 = [NSData dataWithContentsOfURL:url1];
    jsonDictionary=[NSJSONSerialization JSONObjectWithData:
                    data1 options:NSJSONReadingMutableLeaves error:nil];
    jsonArray=[jsonDictionary objectForKey:@"data"];
    NSLog(@"jsonDictionary data is %@",jsonDictionary);
    
    NSString *urlString2 = @"http://www.infotradetechapp.com/Setopati/setopatiapi.php?action=business_en";
    NSURL *url2 = [NSURL URLWithString:urlString2];
    NSData *data2 = [NSData dataWithContentsOfURL:url2];
    jsonDictionary=[NSJSONSerialization JSONObjectWithData:
                    data2 options:NSJSONReadingMutableLeaves error:nil];
    jsonArray=[jsonDictionary objectForKey:@"data"];
    NSLog(@"jsonDictionary data is %@",jsonDictionary);
    
    NSString *urlString3 = @"http://www.infotradetechapp.com/Setopati/setopatiapi.php?action=art_en";
    NSURL *url3 = [NSURL URLWithString:urlString3];
    NSData *data3 = [NSData dataWithContentsOfURL:url3];
    jsonDictionary=[NSJSONSerialization JSONObjectWithData:
                    data3 options:NSJSONReadingMutableLeaves error:nil];
    jsonArray=[jsonDictionary objectForKey:@"data"];
    NSLog(@"jsonDictionary data is %@",jsonDictionary);
    
    NSString *urlString4 = @"http://www.infotradetechapp.com/Setopati/setopatiapi.php?action=sports_en";
    NSURL *url4 = [NSURL URLWithString:urlString4];
    NSData *data4 = [NSData dataWithContentsOfURL:url4];
    jsonDictionary=[NSJSONSerialization JSONObjectWithData:
                    data4 options:NSJSONReadingMutableLeaves error:nil];
    jsonArray=[jsonDictionary objectForKey:@"data"];
    NSLog(@"jsonDictionary data is %@",jsonDictionary);
    
    NSString *urlString5 = @"http://www.infotradetechapp.com/Setopati/setopatiapi.php?action=special_en";
    NSURL *url5 = [NSURL URLWithString:urlString5];
    NSData *data5 = [NSData dataWithContentsOfURL:url5];
    jsonDictionary=[NSJSONSerialization JSONObjectWithData:
                    data5 options:NSJSONReadingMutableLeaves error:nil];
    jsonArray=[jsonDictionary objectForKey:@"data"];
    NSLog(@"jsonDictionary data is %@",jsonDictionary);
    
    NSString *urlString6 = @"http://www.infotradetechapp.com/Setopati/setopatiapi.php?action=opinion_en";
    NSURL *url6 = [NSURL URLWithString:urlString6];
    NSData *data6 = [NSData dataWithContentsOfURL:url6];
    jsonDictionary=[NSJSONSerialization JSONObjectWithData:
                    data6 options:NSJSONReadingMutableLeaves error:nil];
    jsonArray=[jsonDictionary objectForKey:@"data"];
    NSLog(@"jsonDictionary data is %@",jsonDictionary);
   
    NSString *urlString7 = @"http://www.infotradetechapp.com/Setopati/setopatiapi.php?action=blog_en";
    NSURL *url7 = [NSURL URLWithString:urlString7];
    NSData *data7 = [NSData dataWithContentsOfURL:url7];
    jsonDictionary=[NSJSONSerialization JSONObjectWithData:
                    data7 options:NSJSONReadingMutableLeaves error:nil];
    jsonArray=[jsonDictionary objectForKey:@"data"];
    NSLog(@"jsonDictionary data is %@",jsonDictionary);
  
    NSString *urlString8 = @"http://www.infotradetechapp.com/Setopati/setopatiapi.php?action=politics_en";
    NSURL *url8 = [NSURL URLWithString:urlString8];
    NSData *data8 = [NSData dataWithContentsOfURL:url8];
    jsonDictionary=[NSJSONSerialization JSONObjectWithData:
                    data8 options:NSJSONReadingMutableLeaves error:nil];
    jsonArray=[jsonDictionary objectForKey:@"data"];
    NSLog(@"jsonDictionary data is %@",jsonDictionary);
    
    
    DataParser *objParser = [[DataParser alloc]init];
    NSMutableArray *arrData = [objParser getDataFromParserWithPath:urlString];
    NSMutableArray *objService;
    DataBaseManger *dbMng = [[DataBaseManger alloc]init];
    
    DataParser *objParser1 = [[DataParser alloc]init];
    NSMutableArray *arrData1 = [objParser1 getDataFromParserWithPath:urlString1];
    NSMutableArray *objService1;
    DataBaseManger *dbMng1 = [[DataBaseManger alloc]init];
    
    DataParser *objParser2 = [[DataParser alloc]init];
    NSMutableArray *arrData2 = [objParser2 getDataFromParserWithPath:urlString2];
    NSMutableArray *objService2;
    DataBaseManger *dbMng2 = [[DataBaseManger alloc]init];
    
    DataParser *objParser3 = [[DataParser alloc]init];
    NSMutableArray *arrData3 = [objParser3 getDataFromParserWithPath:urlString3];
    NSMutableArray *objService3;
    DataBaseManger *dbMng3 = [[DataBaseManger alloc]init];

    DataParser *objParser4 = [[DataParser alloc]init];
    NSMutableArray *arrData4 = [objParser4 getDataFromParserWithPath:urlString4];
    NSMutableArray *objService4;
    DataBaseManger *dbMng4 = [[DataBaseManger alloc]init];
    
    DataParser *objParser5 = [[DataParser alloc]init];
    NSMutableArray *arrData5 = [objParser5 getDataFromParserWithPath:urlString5];
    NSMutableArray *objService5;
    DataBaseManger *dbMng5 = [[DataBaseManger alloc]init];
   
    DataParser *objParser6 = [[DataParser alloc]init];
    NSMutableArray *arrData6 = [objParser6 getDataFromParserWithPath:urlString6];
    NSMutableArray *objService6;
    DataBaseManger *dbMng6 = [[DataBaseManger alloc]init];
    
    DataParser *objParser7 = [[DataParser alloc]init];
    NSMutableArray *arrData7 = [objParser7 getDataFromParserWithPath:urlString7];
    NSMutableArray *objService7;
    DataBaseManger *dbMng7 = [[DataBaseManger alloc]init];
    
    DataParser *objParser8 = [[DataParser alloc]init];
    NSMutableArray *arrData8 = [objParser8 getDataFromParserWithPath:urlString8];
    NSMutableArray *objService8;
    DataBaseManger *dbMng8 = [[DataBaseManger alloc]init];
    if(arrData.count>0)
    {
        BOOL isDone=[dbMng deleteSelectedService :(DataBO *)objService];
        
        if(isDone)
        {
            NSLog(@"Data deleted in database Sucessfully");
        }
        else
        {
            NSLog(@"No Data hasbeen deleted in database");
        }
    }

    if(arrData.count>0)
    {
        BOOL isDone=[dbMng addServiceToDataBase:arrData];
        if(isDone)
        {
            NSLog(@"Data saved in database Sucessfully");
        }
        else
        {
            NSLog(@"No Data hasbeen saved in database");
        }
    }
    if(arrData.count>0)
    {
        BOOL isDone=[dbMng1 deleteSelectedService1 :(DataBO *)objService1];
        
        if(isDone)
        {
            NSLog(@"Data deleted in database Sucessfully");
        }
        else
        {
            NSLog(@"No Data hasbeen deleted in database");
        }
    }
    
    if(arrData.count>0)
    {
        BOOL isDone=[dbMng1 addServiceToDataBase1:arrData1];
        if(isDone)
        {
            NSLog(@"Data saved in database Sucessfully");
        }
        else
        {
            NSLog(@"No Data hasbeen saved in database");
        }
    }
   
    if(arrData.count>0)
    {
        BOOL isDone=[dbMng2 deleteSelectedService2 :(DataBO *)objService2];
        
        if(isDone)
        {
            NSLog(@"Data deleted in database Sucessfully");
        }
        else
        {
            NSLog(@"No Data hasbeen deleted in database");
        }
    }
    
    if(arrData.count>0)
    {
        BOOL isDone=[dbMng2 addServiceToDataBase2:arrData2];
        if(isDone)
        {
            NSLog(@"Data saved in database Sucessfully");
        }
        else
        {
            NSLog(@"No Data hasbeen saved in database");
        }
    }
    if(arrData.count>0)
    {
        BOOL isDone=[dbMng3 deleteSelectedService3 :(DataBO *)objService3];
        
        if(isDone)
        {
            NSLog(@"Data deleted in database Sucessfully");
        }
        else
        {
            NSLog(@"No Data hasbeen deleted in database");
        }
    }
    
    if(arrData.count>0)
    {
        BOOL isDone=[dbMng3 addServiceToDataBase3:arrData3];
        if(isDone)
        {
            NSLog(@"Data saved in database Sucessfully");
        }
        else
        {
            NSLog(@"No Data hasbeen saved in database");
        }
    }
    if(arrData.count>0)
    {
        BOOL isDone=[dbMng4 deleteSelectedService4 :(DataBO *)objService4];
        
        if(isDone)
        {
            NSLog(@"Data deleted in database Sucessfully");
        }
        else
        {
            NSLog(@"No Data hasbeen deleted in database");
        }
    }
    
    if(arrData.count>0)
    {
        BOOL isDone=[dbMng4 addServiceToDataBase4:arrData4];
        if(isDone)
        {
            NSLog(@"Data saved in database Sucessfully");
        }
        else
        {
            NSLog(@"No Data hasbeen saved in database");
        }
    }
    if(arrData.count>0)
    {
        BOOL isDone=[dbMng5 deleteSelectedService5 :(DataBO *)objService5];
        
        if(isDone)
        {
            NSLog(@"Data deleted in database Sucessfully");
        }
        else
        {
            NSLog(@"No Data hasbeen deleted in database");
        }
    }
    
    if(arrData.count>0)
    {
        BOOL isDone=[dbMng5 addServiceToDataBase5:arrData5];
        if(isDone)
        {
            NSLog(@"Data saved in database Sucessfully");
        }
        else
        {
            NSLog(@"No Data hasbeen saved in database");
        }
    }
    if(arrData.count>0)
    {
        BOOL isDone=[dbMng6 deleteSelectedService6 :(DataBO *)objService6];
        
        if(isDone)
        {
            NSLog(@"Data deleted in database Sucessfully");
        }
        else
        {
            NSLog(@"No Data hasbeen deleted in database");
        }
    }
    
    if(arrData.count>0)
    {
        BOOL isDone=[dbMng6 addServiceToDataBase6:arrData6];
        if(isDone)
        {
            NSLog(@"Data saved in database Sucessfully");
        }
        else
        {
            NSLog(@"No Data hasbeen saved in database");
        }
    }
    if(arrData.count>0)
    {
        BOOL isDone=[dbMng7 deleteSelectedService7 :(DataBO *)objService7];
        
        if(isDone)
        {
            NSLog(@"Data deleted in database Sucessfully");
        }
        else
        {
            NSLog(@"No Data hasbeen deleted in database");
        }
    }
    
    if(arrData.count>0)
    {
        BOOL isDone=[dbMng7 addServiceToDataBase7:arrData7];
        if(isDone)
        {
            NSLog(@"Data saved in database Sucessfully");
        }
        else
        {
            NSLog(@"No Data hasbeen saved in database");
        }
    }
    if(arrData.count>0)
    {
        BOOL isDone=[dbMng8 deleteSelectedService8 :(DataBO *)objService8];
        
        if(isDone)
        {
            NSLog(@"Data deleted in database Sucessfully");
        }
        else
        {
            NSLog(@"No Data hasbeen deleted in database");
        }
    }
    
    if(arrData.count>0)
    {
        BOOL isDone=[dbMng8 addServiceToDataBase8:arrData8];
        if(isDone)
        {
            NSLog(@"Data saved in database Sucessfully");
        }
        else
        {
            NSLog(@"No Data hasbeen saved in database");
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
