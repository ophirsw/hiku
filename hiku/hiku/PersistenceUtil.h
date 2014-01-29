//
//  PersistenceUtil.h
//  hiku
//
//  Created by Ophir Sweiry on 1/24/14.
//  Copyright (c) 2014 Ophir Sweiry. All rights reserved.
//

#import <Foundation/Foundation.h>
static NSString *fileName = @"list.dgs";

@interface PersistenceUtil : NSObject
+(BOOL)SaveCoreData:(NSArray *)list;
+(NSMutableArray *)LoadCoreData;
+ (void)deleteAllObjectsInContext:(NSManagedObjectContext *)context;
@end
