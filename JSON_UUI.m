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
@synthesize nsstr_Src= _nsstr_Src;
@synthesize nsstr_Dest= _nsstr_Dest;
@synthesize id_msg= _id_msg;

@synthesize nsstr_Datetime= _nsstr_Datetime;
@synthesize nsstr_Referer= _nsstr_Referer;

- (id) init
{
	self= [super init];
	if (self) {
	}
	return self;
}

- (id) initWithCommand:(NSString*)nsstr_Cmd withSrc:(NSString*)nsstr_Src withDest:(NSString*)nsstr_Dest with_:(id)id_msg
{
	if ([self init]) {
		_nsstr_Cmd= nsstr_Cmd;
		_nsstr_Src= nsstr_Src;
		_nsstr_Dest= nsstr_Dest;
		_id_msg= id_msg;
	}
	return self;
}

- (id) initWithJSON:(NSDictionary*)nsdic_JSON
{
	if ([self init])
	{
		id id_UUI= nsdic_JSON[@"UUI"];
		if (! [id_UUI isKindOfClass:[NSDictionary class]] )
			return nil;
		
		NSDictionary* nsdic_UUI= id_UUI;
		
		_nsstr_Cmd= nsdic_UUI[@"cmd"];
		_nsstr_Src= nsdic_UUI[@"src"];
		_nsstr_Dest= nsdic_UUI[@"dest"];
		_id_msg= nsdic_UUI[@"_msg"];
		
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
			@"src" : _nsstr_Src,
			@"dest" : _nsstr_Dest,
			@"_msg" : _id_msg,
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
