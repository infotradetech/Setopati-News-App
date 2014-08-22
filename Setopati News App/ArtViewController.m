//
//  ArtViewController.m
//  Setopati News App
//
//  Created by InfoTrade Tech on 8/20/14.
//  Copyright (c) 2014 infotradetech. All rights reserved.
//

#import "ArtViewController.h"
#import "DataBO.h"
#import "DataBaseManger.h"
#import "DataParser.h"


@interface ArtViewController ()
{
    NSArray *setopatiList;
    UITextField *aTextField;
}
@end

@implementation ArtViewController
@synthesize aTableView;
@synthesize bTableView;
@synthesize stdObj;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"NEWS";

        aTableView = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen]bounds] style:UITableViewStylePlain];
        aTableView.rowHeight=50;
        aTableView.separatorColor=[UIColor grayColor];
        aTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
        aTableView.delegate=self;
        aTableView.dataSource=self;
        [self.view addSubview:aTableView];
        
        UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc]initWithTitle:@"Menu" style:UIBarButtonItemStyleBordered target:self action:@selector(barAction)];
        self.navigationItem.rightBarButtonItem=leftBarItem;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arryData = [[NSArray alloc] initWithObjects:@"HEADLINE",@"POLITICS",@"SOCIETY",@"BUSINESS",@"ART",@"SPORTS",
                @"SPECIAL",@"OPINION",@"BLOG",@"AUDIO/VIDEO",@"ABOUT US",nil];
    flag=1;
    bTableView.hidden=YES;
    // btn.layer.cornerRadius=20;
    bTableView.layer.cornerRadius=9;
    
    stdObj=[[Setopati alloc]init];
    AppDelegate *app=[[UIApplication sharedApplication]delegate];
    setopatiList=[app getSetopatisList3];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//return [arryData count];
{
    if (tableView == self.bTableView)
    {
        return [arryData count];
    }
    if (tableView == self.aTableView)
    {
        return [setopatiList count];
    }
    
    return [arryData count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    
    static NSString *CellIdentifier = @"first";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"first"];
    }
    if (tableView == self.bTableView)
    {
        cell.textLabel.text = [arryData objectAtIndex:indexPath.row];
        cell.textLabel.textColor=[UIColor whiteColor];
        cell.backgroundColor=[UIColor colorWithRed:22/255.0f green:124/255.0f blue:105/255.0f alpha:1.0f];
        cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
        
    }
    static NSString *CellIdentifier2 = @"second";
    UITableViewCell *cell2 =[tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
    
    
    if (cell2==nil)
    {
        cell2 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"second"];
    }
    if (tableView == self.aTableView)
    {
        if(indexPath.row==0)
        {
            stdObj=[setopatiList objectAtIndex:indexPath.row];
            cell.textLabel.text = @"ART";
            cell.textLabel.textColor=[UIColor whiteColor];
            cell.backgroundColor=[UIColor colorWithRed:22/255.0f green:124/255.0f blue:105/255.0f alpha:1.0f];
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:20];
        }
        if(indexPath.row==1)
        {
            stdObj=[setopatiList objectAtIndex:indexPath.row];
            cell.textLabel.text = stdObj.title;
            cell.detailTextLabel.text=stdObj.mixed_intro;
            cell.imageView.image=[UIImage imageNamed:@"icon"];
            cell.detailTextLabel.textColor=[UIColor blueColor];
            cell.textLabel.numberOfLines=2;
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            cell.detailTextLabel.font=[UIFont fontWithName:@"Arial" size:12];
        }
        if(indexPath.row==2)
        {
            stdObj=[setopatiList objectAtIndex:indexPath.row];
            cell.textLabel.text = stdObj.title;
            cell.detailTextLabel.text=stdObj.mixed_intro;
            cell.imageView.image=[UIImage imageNamed:@"icon"];
            cell.detailTextLabel.textColor=[UIColor blueColor];
            cell.textLabel.numberOfLines=2;
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            cell.detailTextLabel.font=[UIFont fontWithName:@"Arial" size:12];
        }
        if(indexPath.row==3)
        {
            stdObj=[setopatiList objectAtIndex:indexPath.row];
            cell.textLabel.text = stdObj.title;
            cell.detailTextLabel.text=stdObj.mixed_intro;
            cell.imageView.image=[UIImage imageNamed:@"icon"];
            cell.detailTextLabel.textColor=[UIColor blueColor];
            cell.textLabel.numberOfLines=2;
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            cell.detailTextLabel.font=[UIFont fontWithName:@"Arial" size:12];
        }
        if(indexPath.row==4)
        {
            stdObj=[setopatiList objectAtIndex:indexPath.row];
            cell.textLabel.text = stdObj.title;
            cell.detailTextLabel.text=stdObj.mixed_intro;
            cell.imageView.image=[UIImage imageNamed:@"icon"];
            cell.detailTextLabel.textColor=[UIColor blueColor];
            cell.textLabel.numberOfLines=2;
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            cell.detailTextLabel.font=[UIFont fontWithName:@"Arial" size:12];
        }
        if(indexPath.row==5)
        {
            stdObj=[setopatiList objectAtIndex:indexPath.row];
            cell.textLabel.text = stdObj.title;
            cell.detailTextLabel.text=stdObj.mixed_intro;
            cell.imageView.image=[UIImage imageNamed:@"icon"];
            cell.detailTextLabel.textColor=[UIColor blueColor];
            cell.textLabel.numberOfLines=2;
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            cell.detailTextLabel.font=[UIFont fontWithName:@"Arial" size:12];
        }
        if(indexPath.row==6)
        {
            stdObj=[setopatiList objectAtIndex:indexPath.row];
            cell.textLabel.text = stdObj.title;
            cell.detailTextLabel.text=stdObj.mixed_intro;
            cell.imageView.image=[UIImage imageNamed:@"icon"];
            cell.detailTextLabel.textColor=[UIColor blueColor];
            cell.textLabel.numberOfLines=2;
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            cell.detailTextLabel.font=[UIFont fontWithName:@"Arial" size:12];
        }
        if(indexPath.row==7)
        {
            stdObj=[setopatiList objectAtIndex:indexPath.row];
            cell.textLabel.text = stdObj.title;
            cell.detailTextLabel.text=stdObj.mixed_intro;
            cell.imageView.image=[UIImage imageNamed:@"icon"];
            cell.detailTextLabel.textColor=[UIColor blueColor];
            cell.textLabel.numberOfLines=2;
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            cell.detailTextLabel.font=[UIFont fontWithName:@"Arial" size:12];
        }
        if(indexPath.row==8)
        {
            stdObj=[setopatiList objectAtIndex:indexPath.row];
            cell.textLabel.text = stdObj.title;
            cell.detailTextLabel.text=stdObj.mixed_intro;
            cell.imageView.image=[UIImage imageNamed:@"icon"];
            cell.detailTextLabel.textColor=[UIColor blueColor];
            cell.textLabel.numberOfLines=2;
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            cell.detailTextLabel.font=[UIFont fontWithName:@"Arial" size:12];
        }
        if(indexPath.row==9)
        {
            stdObj=[setopatiList objectAtIndex:indexPath.row];
            cell.textLabel.text = stdObj.title;
            cell.detailTextLabel.text=stdObj.mixed_intro;
            cell.imageView.image=[UIImage imageNamed:@"icon"];
            cell.detailTextLabel.textColor=[UIColor blueColor];
            cell.textLabel.numberOfLines=2;
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            cell.detailTextLabel.font=[UIFont fontWithName:@"Arial" size:12];
        }
        if(indexPath.row==10)
        {
            stdObj=[setopatiList objectAtIndex:indexPath.row];
            cell.textLabel.text = stdObj.title;
            cell.detailTextLabel.text=stdObj.mixed_intro;
            cell.imageView.image=[UIImage imageNamed:@"icon"];
            cell.detailTextLabel.textColor=[UIColor blueColor];
            cell.textLabel.numberOfLines=2;
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
            cell.textLabel.font=[UIFont fontWithName:@"Arial" size:15];
            cell.detailTextLabel.font=[UIFont fontWithName:@"Arial" size:12];
        }
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Changing button label
    flag=1;
    bTableView.hidden=YES;
    
    if (tableView == self.bTableView)
    {
        if(indexPath.row==0)
        {
            
        }
        if(indexPath.row==1)
        {
            PoliticsViewController *dvc = [[PoliticsViewController alloc]init];
            //dvc.jsonDictionary=[jsonArray objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:dvc animated:YES];
            
        }
        if(indexPath.row==2)
        {
            SocietyViewController *dvc = [[SocietyViewController alloc]init];
            //dvc.jsonDictionary=[jsonArray objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:dvc animated:YES];
            
        }
        if(indexPath.row==3)
        {
            BusinessViewController *dvc = [[BusinessViewController alloc]init];
            //dvc.jsonDictionary=[jsonArray objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:dvc animated:YES];
            
        }
        if(indexPath.row==4)
        {
            ArtViewController *dvc = [[ArtViewController alloc]init];
            //dvc.jsonDictionary=[jsonArray objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:dvc animated:YES];
            
        }
        if(indexPath.row==5)
        {
            SportsViewController *dvc = [[SportsViewController alloc]init];
            //dvc.jsonDictionary=[jsonArray objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:dvc animated:YES];
            
        }
        if(indexPath.row==6)
        {
            SpecialViewController *dvc = [[SpecialViewController alloc]init];
            //dvc.jsonDictionary=[jsonArray objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:dvc animated:YES];
            
        }
        if(indexPath.row==7)
        {
            OpinionViewController *dvc = [[OpinionViewController alloc]init];
            //dvc.jsonDictionary=[jsonArray objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:dvc animated:YES];
            
        }if(indexPath.row==8)
        {
            BlogViewController *dvc = [[BlogViewController alloc]init];
            //dvc.jsonDictionary=[jsonArray objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:dvc animated:YES];
            
        }
        if(indexPath.row==9)
        {
            AdvdViewController *dvc = [[AdvdViewController alloc]init];
            //dvc.jsonDictionary=[jsonArray objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:dvc animated:YES];
            
        }
        
    }
    if (tableView == self.aTableView)
    {
        if(indexPath.row==0)
        {
            
        }
        if(indexPath.row==1)
        {
            DetailsViewController *fvc = [[DetailsViewController alloc]init];
            fvc.stdObj=[setopatiList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:fvc animated:YES];
        }
        
        if(indexPath.row==2)
        {
            DetailsViewController *fvc = [[DetailsViewController alloc]init];
            fvc.stdObj=[setopatiList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:fvc animated:YES];
            
        }
        if(indexPath.row==3)
        {
            DetailsViewController *fvc = [[DetailsViewController alloc]init];
            fvc.stdObj=[setopatiList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:fvc animated:YES];        }
        
        if(indexPath.row==4)
        {
            DetailsViewController *fvc = [[DetailsViewController alloc]init];
            fvc.stdObj=[setopatiList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:fvc animated:YES];
            
        }
        if(indexPath.row==5)
        {
            DetailsViewController *fvc = [[DetailsViewController alloc]init];
            fvc.stdObj=[setopatiList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:fvc animated:YES];
            
        }
        
        if(indexPath.row==6)
        {
            DetailsViewController *fvc = [[DetailsViewController alloc]init];
            fvc.stdObj=[setopatiList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:fvc animated:YES];
        }
        if(indexPath.row==7)
        {
            DetailsViewController *fvc = [[DetailsViewController alloc]init];
            fvc.stdObj=[setopatiList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:fvc animated:YES];
        }
        if(indexPath.row==8)
        {
            DetailsViewController *fvc = [[DetailsViewController alloc]init];
            fvc.stdObj=[setopatiList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:fvc animated:YES];
        }
        if(indexPath.row==9)
        {
            DetailsViewController *fvc = [[DetailsViewController alloc]init];
            fvc.stdObj=[setopatiList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:fvc animated:YES];
        }
        if(indexPath.row==10)
        {
            DetailsViewController *fvc = [[DetailsViewController alloc]init];
            fvc.stdObj=[setopatiList objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:fvc animated:YES];
        }
    }
}

-(void)barAction
{
    if  (flag==1)
    {
        flag=0;
        bTableView.hidden=NO;
        bTableView = [[UITableView alloc]initWithFrame:CGRectMake(190,66,130,298)];
        bTableView.rowHeight=30;
        bTableView.separatorColor=[UIColor grayColor];
        bTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
        bTableView.delegate=self;
        bTableView.dataSource=self;
        [self.view addSubview:bTableView];
    }
    else
    {
        flag=1;
        bTableView.hidden=YES;
    }
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
