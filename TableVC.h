//
//  TableVC.h
//  Practise_2
//
//  Created by IndiaNIC on 20/09/13.
//  Copyright (c) 2013 IndiaNIC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *aObjMuteAry;
}



@property (strong, nonatomic) IBOutlet UITableView *tblView;


@end
