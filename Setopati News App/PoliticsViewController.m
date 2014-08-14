//
//  PoliticsViewController.m
//  Setopati News App
//
//  Created by InfoTrade Tech on 8/13/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import "PoliticsViewController.h"
#import "DataBO.h"
#import "DataBaseManger.h"
#import "DataParser.h"

@interface PoliticsViewController ()
{
    //NSData *data;
    NSMutableArray *setopatisDataArr;
    NSDictionary *jsonDictionary, *jsonDict;
    NSArray *jsonArray;
    NSMutableArray *setopatiList;
    UITextField *aTextField;
}
@end

@implementation PoliticsViewController
@synthesize aTableView;
@synthesize stdObj;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        aTableView = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen]bounds] style:UITableViewStylePlain];
        aTableView.rowHeight=50;
        aTableView.separatorColor=[UIColor grayColor];
        aTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
        aTableView.delegate=self;
        aTableView.dataSource=self;
        [self.view addSubview:aTableView];
        
        stdObj=[[Setopati alloc]init];
        AppDelegate *app=[[UIApplication sharedApplication]delegate];
        setopatiList=[app getSetopatisList];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [setopatiList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=(UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
    if (cell==nil)
    {
        // cell=[[UITableViewCell alloc]initWithFrame:CGRectZero];
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyCell1"];
    }
    
    stdObj=[setopatiList objectAtIndex:indexPath.row];
    cell.textLabel.text = stdObj.title;
    cell.detailTextLabel.text=stdObj.mixed_intro;
    cell.imageView.image=[UIImage imageNamed:@"icon"];
    cell.detailTextLabel.textColor=[UIColor blueColor];
    cell.textLabel.numberOfLines=2;
    cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
    cell.detailTextLabel.font=[UIFont fontWithName:@"Arial" size:12];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsViewController *fvc = [[DetailsViewController alloc]init];
    fvc.stdObj=[setopatiList objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:fvc animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [aTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
