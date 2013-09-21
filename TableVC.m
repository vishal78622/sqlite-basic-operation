//
//  TableVC.m
//  Practise_2
//
//  Created by IndiaNIC on 20/09/13.
//  Copyright (c) 2013 IndiaNIC. All rights reserved.
//

#import "TableVC.h"
#import "ViewController.h"
@interface TableVC ()

@end

@implementation TableVC
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    aObjMuteAry=[[NSMutableArray alloc]init];
    
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [aObjMuteAry addObjectsFromArray:[[Database shareDatabase]SelectAllFromTable:@"select *from akshay"]];
//    NSLog(@"muteArray is:%@",aObjMuteAry);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return [aObjMuteAry count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ViewController *aRootVC=[[self.navigationController viewControllers] objectAtIndex:0];
    aRootVC.myDataAry=[aObjMuteAry objectAtIndex:indexPath.row];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
   //  NSString *strIdent=[NSString stringWithFormat:@"customCell"];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"customCell"];
    UILabel *alblOne = (UILabel *)[cell viewWithTag:1];
    [alblOne setText:[[aObjMuteAry objectAtIndex:indexPath.row]objectForKey:@"Firstname"]];
    UILabel *albltwo = (UILabel *)[cell viewWithTag:2];
    [albltwo setText:[[aObjMuteAry objectAtIndex:indexPath.row]objectForKey:@"Lastname"]];
    UILabel *alblthree = (UILabel *)[cell viewWithTag:3];
    [alblthree setText:[[aObjMuteAry objectAtIndex:indexPath.row]objectForKey:@"Number"]];
    
//    cell.textLabel.text=[aObjMuteAry objectAtIndex:indexPath.row];
    
    return cell;
    
}

//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
        {
            NSString *aStr = [[aObjMuteAry objectAtIndex:indexPath.row]objectForKey:@"id"];
            int aIntID = [aStr integerValue];
             [aObjMuteAry removeObjectAtIndex:indexPath.row];
            [_tblView reloadData];
            
            NSString *aDelete = [NSString stringWithFormat:@"Delete from akshay where id='%i'",aIntID];
            [[Database shareDatabase] Delete:aDelete];
    }

}



@end
