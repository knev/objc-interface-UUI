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
@property NSString* nsstr_App;
@property NSString* nsstr_msg;

- (id) init;
- (id) initWithCommand:(NSString*)nsstr_Cmd withApp:(NSString*)nsstr_App withSrc:(NSString*)nsstr_msg;
- (NSString*) serializeToJSON;

@end

NS_ASSUME_NONNULL_END
