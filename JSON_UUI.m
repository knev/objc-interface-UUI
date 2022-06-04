//
//  JSON_UUI.m
//  objc-hubs-mask
//
//  Created by dev on 2022-06-02.
//  Copyright © 2022 Root Interface AB. All rights reserved.
//

#import "JSON_UUI.h"

@implementation JSON_UUI

@synthesize nsstr_Cmd= _nsstr_Cmd;
@synthesize nsstr_App= _nsstr_App;
@synthesize nsstr_msg= _nsstr_msg;

- (id) init
{
	self= [super init];
	if (self) {
	}
	return self;
}

- (id) initWithCommand:(NSString*)nsstr_Cmd withApp:(NSString*)nsstr_App withSrc:(NSString*)nsstr_msg
{
	if ([self init]) {
		_nsstr_Cmd= nsstr_Cmd;
		_nsstr_App= nsstr_App;
		_nsstr_msg= nsstr_msg;
	}
	return self;
}

- (NSString*) serializeToJSON
{
	NSISO8601DateFormatter* dtf= [[NSISO8601DateFormatter alloc] init];
	NSString* nstr_dt= [dtf stringFromDate: [NSDate date] ];
	
	NSDictionary* nsdic_UUI= @{
			@"cmd" : _nsstr_Cmd,
			@"app" : _nsstr_App,
			@"_msg" : _nsstr_msg,
		};
	
	NSDictionary* nsdic_Msg= @{
			@"UUI" : nsdic_UUI,
			@"dt" : nstr_dt,
		};
	
	NSError* nserr;
	NSJSONWritingOptions w_opts= 0; // NSJSONWritingWithoutEscapingSlashes;
	NSData* data_Msg= [NSJSONSerialization dataWithJSONObject:nsdic_Msg options:w_opts error:&nserr];
	
	return [[NSString alloc] initWithData:data_Msg encoding:NSUTF8StringEncoding];
}

@end
