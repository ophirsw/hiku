//
//  com_hiku_ListItemModel.h
//  hiku
//
//  Created by Ophir Sweiry on 1/22/14.
//  Copyright (c) 2014 Ophir Sweiry. All rights reserved.
//

#import "JSONModel.h"


@interface com_hiku_ListItemModel : JSONModel

@property (strong, nonatomic) NSString* aisleName;
@property (strong, nonatomic) NSString* aisle_id;
@property (strong, nonatomic) NSString* audioPath;
@property (strong, nonatomic) NSString* ean;
@property (strong, nonatomic) NSString* id;
@property (strong, nonatomic) NSArray* listTags;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* product_id;
@property (strong, nonatomic) NSString* quantity;
@property (strong, nonatomic) NSString* status;
@end
