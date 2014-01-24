//
//  GetParamsUrlUtil.h
//  
//
//  Created by Ophir Sweiry //
//

#import <Foundation/Foundation.h>

//OS : URl for geting List API
static NSString *APIGetListURL = @"http://hiku-staging.herokuapp.com/api/v1/list";

//OS : appId&Secret&token definition
static NSString *appID = @"e2a01662323845bf5b289b90f4c67dbae982d65247f235";
static NSString *secret = @"18f9d67455211c636e";
static NSString *token = @"b6d3a05255eb3a56db6b6b488a5f0073";

@interface GetParamsUrlUtil : NSObject

+(NSDictionary *) GetParamsUrl;
+(NSString *)sha256hash:(NSString *)input;
+(NSString *) getTimeNowUTC;

@end
