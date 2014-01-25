//
//  ItemViewController.h
//  hiku
//
//  Created by Ophir Sweiry on 1/22/14.
//  Copyright (c) 2014 Ophir Sweiry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemViewController : UIViewController {
    // OS: labels to show the detailed data
    IBOutlet UILabel *labelName_Value;
    IBOutlet UILabel *labelAisleName_Value;
}
@property (strong, nonatomic) NSDictionary *itemData;

@end