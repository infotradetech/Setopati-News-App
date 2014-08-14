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
    [self.navigationController pushViewController:fvc animated:YES];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
    NSString *urlString = @"http://www.infotradetechapp.com/Setopati/setopatiapi.php?action=business_en";
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    jsonDictionary=[NSJSONSerialization JSONObjectWithData:
                    data options:NSJSONReadingMutableLeaves error:nil];
    jsonArray=[jsonDictionary objectForKey:@"data"];
    NSLog(@"jsonDictionary data is %@",jsonDictionary);
    DataParser *objParser = [[DataParser alloc]init];
    NSMutableArray *arrData = [objParser getDataFromParserWithPath:urlString];
    NSMutableArray *objService;
    DataBaseManger *dbMng = [[DataBaseManger alloc]init];
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
        BOOL isDone=[dbMng addServiceToDataBase2:arrData];
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
