//
//  ViewController.h
//  Practise_2
//
//  Created by IndiaNIC on 20/09/13.
//  Copyright (c) 2013 IndiaNIC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *tfFirstname;
@property (strong, nonatomic) IBOutlet UITextField *tfLastName;
@property (strong, nonatomic) IBOutlet UITextField *tfNumber;
@property(strong,nonatomic)NSDictionary * myDataAry;







- (IBAction)btnClick:(id)sender;
@end
