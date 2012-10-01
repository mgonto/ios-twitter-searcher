//
//  TGVSearchiewController.m
//  twitter-searcher
//
//  Created by Pablo Grigolatto on 10/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TGVSearchiewController.h"
#import "TGAppDelegate.h"
#import "TGResultsViewController.h"

#define URL   @"http://search.twitter.com/search.json?q="

@interface TGVSearchiewController ()


@property (strong, nonatomic) NSDictionary* tweetData;

@end

@implementation TGVSearchiewController


@synthesize searchButton;
@synthesize loadingLabel;
@synthesize searchTextField;
@synthesize tweetData;

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
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setSearchTextField:nil];
    [self setSearchButton:nil];
    [self setLoadingLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SearchSegue"]) {
        TGResultsViewController *dest = segue.destinationViewController;
        dest.searchText = self.searchTextField.text;
        dest.tweetData = self.tweetData;
    }
}

- (void) resetButtons {
    searchButton.hidden = false;
    loadingLabel.hidden = true;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self resetButtons];
    searchTextField.text = nil;

    
}

- (IBAction)searchClicked:(id)sender {
    searchButton.hidden = true;
    loadingLabel.hidden = false;
    [searchTextField resignFirstResponder];
   
    
    NSOperation* operation = [NSBlockOperation blockOperationWithBlock:^{
        NSString *stringUrl = [NSString stringWithFormat:@"%@%@", URL, self.searchTextField.text];
        NSURL *url = [NSURL URLWithString: stringUrl];
        NSError* error = nil;
        NSData* data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
            return;
        }
        
        self.tweetData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self performSegueWithIdentifier:@"SearchSegue" sender:self];
            
        });
        
    }];
    
    TGAppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate.queue addOperation:operation];
    
        
    
    
}
@end
