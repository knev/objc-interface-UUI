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

@synthesize nsstr_Datetime= _nsstr_Datetime;
@synthesize nsstr_Referer= _nsstr_Referer;

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

- (id) initWithJSON:(NSString*)nsstr_json
{
	if ([self init])
	{
		NSError* nserr;
		NSJSONReadingOptions r_opts= 0; //= NSJSONReadingJSON5Allowed;
		id id_JSON= [NSJSONSerialization JSONObjectWithData:[nsstr_json dataUsingEncoding:NSUTF8StringEncoding]
													options:r_opts
													  error:&nserr];
		
		if (! [id_JSON isKindOfClass:[NSDictionary class]] )
			return nil;
		
		NSDictionary* nsdic_JSON= id_JSON;
		
		id id_UUI= nsdic_JSON[@"UUI"];
		if (! [id_UUI isKindOfClass:[NSDictionary class]] )
			return nil;
		
		NSDictionary* nsdic_UUI= id_UUI;
		
		_nsstr_Cmd= nsdic_UUI[@"cmd"];
		_nsstr_App= nsdic_UUI[@"app"];
		_nsstr_msg= nsdic_UUI[@"_msg"];
		
		_nsstr_Datetime= nsdic_JSON[@"dt"];
		_nsstr_Referer= nsdic_JSON[@"referer"];
		
		// -----
		
		NSCAssert(_nsstr_Datetime != nil, @"No datetime timestamp found on message"); // NS_C_Assert, used for C functions only
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
