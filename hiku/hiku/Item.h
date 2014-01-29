//
//  Item.h
//  hiku
//
//  Created by Ophir Sweiry on 1/27/14.
//  Copyright (c) 2014 Ophir Sweiry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ListTags;

@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * aisleName;
@property (nonatomic, retain) NSString * aisle_id;
@property (nonatomic, retain) NSString * audioPath;
@property (nonatomic, retain) NSString * ean;
@property (nonatomic, retain) NSString * flFavorite;
@property (nonatomic, retain) NSString * item_id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * product_id;
@property (nonatomic, retain) NSNumber * quantity;
@property (nonatomic, retain) NSNumber * status;
@property (nonatomic, retain) ListTags *relationship;

@end
