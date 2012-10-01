//
//  TGVSearchiewController.h
//  twitter-searcher
//
//  Created by Pablo Grigolatto on 10/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TGVSearchiewController : UIViewController


@property (strong, nonatomic) IBOutlet UIButton *searchButton;
@property (strong, nonatomic) IBOutlet UILabel *loadingLabel;
@property (strong, nonatomic) IBOutlet UITextField *searchTextField;



- (IBAction)searchClicked:(id)sender;


@end
