//
//  JSON_UUI.h
//  objc-hubs-mask
//
//  Created by dev on 2022-06-02.
//  Copyright © 2022 Root Interface AB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSON_UUI : NSObject

@property NSString* nsstr_Cmd;
@property NSString* nsstr_Src;
@property NSString* nsstr_Dest;
@property NSString* nsstr_;

@property NSString* nsstr_Datetime;
@property NSString* nsstr_Referer;

- (id) init;
- (id) initWithCommand:(NSString*)nsstr_Cmd withSrc:(NSString*)nsstr_Src withDest:(NSString*)nsstr_Dest with_:(NSString*)nsstr_;
- (id) initWithJSON:(NSString*)nsstr_json;
- (NSString*) serializeToJSON;

@end

NS_ASSUME_NONNULL_END
