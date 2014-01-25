//
//  PersistenceUtil.m
//  hiku
//
//  Created by Ophir Sweiry on 1/24/14.
//  Copyright (c) 2014 Ophir Sweiry. All rights reserved.
//

#import "PersistenceUtil.h"

@implementation PersistenceUtil

// OS: save array to storage
+(BOOL)SaveArray:(NSArray *)array;{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    BOOL result = [NSKeyedArchiver archiveRootObject:array toFile:filePath];
    return result;
}


// OS: load array from storage
+(NSArray *)LoadArray {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}


@end
