//
//  GetParamsUrlUtil.m
//
//
//  Created by Ophir Sweiry //
//

#import "GetParamsUrlUtil.h"
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonDigest.h>

@implementation GetParamsUrlUtil


+(NSDictionary*)GetParamsUrl {
    // fetch the data from the API
    NSString *timeUTC = [self getTimeNowUTC];
    NSString *sha256hashSign = [self sha256hash:[NSString stringWithFormat:@"%@%@%@", appID, secret, timeUTC]];
    return @{@"app_id": appID,@"sig":sha256hashSign,@"time":timeUTC,@"token":token};
}

+ (NSString *) getTimeNowUTC

{
    
    NSDate* myDate = [NSDate date];//here it returns current date of device.
    
    
    
    // RB: what if the device is not set to the right time? shouldn't an atomic clock be used so that the
    
    // request isn't dependent on a property of the device? [TM]
    
    
    
    //now set the timeZone and set the Date format to this date as you want.
    
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSSSS"];
    
    [dateFormatter setTimeZone:timeZone];
    
    return [dateFormatter stringFromDate:myDate];
    
}





// Documented, Reviewed & Tested [TM-13/09/17]

+ (NSString *)sha256hash:(NSString *)input

{
    
    // Guard the input, return early.
    
    if (input == nil || [input isEqualToString:(@"")]) {
        
        return nil;
        
    }
    
    
    // Convert input string into NSData
    
    NSData *dataIn = [input dataUsingEncoding:NSASCIIStringEncoding];   // TODO - should this be ASCII? Why not UTF-16?
    
    NSMutableData *macOut = [NSMutableData dataWithLength:CC_SHA256_DIGEST_LENGTH];

    
    // Compute the SHA-256 hash of the input
    
    CC_SHA256(dataIn.bytes, dataIn.length,  macOut.mutableBytes);
    
    
    
    // Strip the output of corner brackets and return the result
    
    NSString* result = [NSString stringWithFormat:@"%@", macOut];
    
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@" <>"];
    
    return [[result componentsSeparatedByCharactersInSet: doNotWant] componentsJoinedByString: @""];
    
}

@end
