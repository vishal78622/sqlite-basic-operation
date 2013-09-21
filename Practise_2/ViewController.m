//
//  ViewController.m
//  Practise_2
//
//  Created by IndiaNIC on 20/09/13.
//  Copyright (c) 2013 IndiaNIC. All rights reserved.
//

#import "ViewController.h"
#import "TableVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_myDataAry=[[NSDictionary alloc]init];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated{
    
   
    if([_myDataAry count]){
        
         NSLog(@" Arry: %@",_myDataAry);
        _tfFirstname.text=[_myDataAry objectForKey:@"Firstname"];
        _tfLastName.text=[_myDataAry objectForKey:@"Lastname"];
        _tfNumber.text=[_myDataAry objectForKey:@"Number"];
    }
 }
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClick:(id)sender {
    UIStoryboard *aObjStryBoard=[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    TableVC *aObjTbl=[aObjStryBoard instantiateViewControllerWithIdentifier:@"TableVC"];
    if([_myDataAry count]==0){
      NSString *strInsert=[NSString stringWithFormat:@"insert into akshay (Firstname,Lastname,Number)values('%@','%@','%i')",
                         _tfFirstname.text,_tfLastName.text,_tfNumber.text.integerValue];
    [[Database shareDatabase]Insert:strInsert];
   
    [self.navigationController pushViewController:aObjTbl animated:YES];
    }
    else{
        
        NSString *strInsert=[NSString stringWithFormat:@"UPDATE akshay SET Firstname='%@',Lastname='%@',Number='%d' WHERE id=%d",
                             _tfFirstname.text,_tfLastName.text,_tfNumber.text.integerValue,[[_myDataAry objectForKey:@"id"] integerValue]];
        
        [[Database shareDatabase]Update:strInsert];
        
        [self.navigationController pushViewController:aObjTbl animated:YES];
        
    }
    
}
-(IBAction)unWind:(UIStoryboardSegue*)sender{
 
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
	//[scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}


@end
