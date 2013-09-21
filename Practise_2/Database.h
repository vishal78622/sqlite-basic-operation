/********************************************************************************\
 *
 * File Name       Database.h
 * Author          $Author:: gaurav.thummar   $: Author of last commit
 * Version         $Revision:: 03             $: Revision of last commit
 * Created by IndiaNIC on 8/29/12.
 * Copyright(c) 2012 IndiaNIC.com. All rights reserved.
 *
 \********************************************************************************/

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface Database : NSObject {

	sqlite3 *databaseObj;

}
+(Database*) shareDatabase;

-(BOOL) createEditableCopyOfDatabaseIfNeeded;
-(NSString *) GetDatabasePath;

-(NSMutableArray *)SelectAllFromTable:(NSString *)query;
-(int)getCount:(NSString *)query;
-(BOOL)CheckForRecord:(NSString *)query;
-(void)Insert:(NSString *)query;
-(void)Delete:(NSString *)query;
-(void)Update:(NSString *)query;
-(int)GetSum:(NSString*)query;
@end
