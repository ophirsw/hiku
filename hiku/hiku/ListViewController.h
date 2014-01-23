//
//  ListViewController.h
//  hiku
//
//  Created by Ophir Sweiry on 1/22/14.
//  Copyright (c) 2014 Ophir Sweiry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UITableViewController
// OS: data container for the table
@property (strong, nonatomic) NSArray *listItemArrayFromAFNetworking;
@end
