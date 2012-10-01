//
//  TGResultsViewController.h
//  twitter-searcher
//
//  Created by Pablo Grigolatto on 10/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TGResultsViewController : UITableViewController

@property (nonatomic, strong) NSString *searchText;
@property (nonatomic, strong) NSDictionary* tweetData;

@end
