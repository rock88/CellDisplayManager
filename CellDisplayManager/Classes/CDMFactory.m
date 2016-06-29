//
//  DataDisplayManagerItemFabric.m
//  CellDisplayManager
//
//  Created by rock88 on 03/06/16.
//  Copyright © 2016 rock88. All rights reserved.
//

#import "CDMFactory.h"

@implementation CDMFactory

+ (NSMutableDictionary *)sharedClassDictionary {
    static NSMutableDictionary* dictionary = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dictionary = [NSMutableDictionary dictionary];
    });
    return dictionary;
}

+ (void)registerClass:(Class)class forProtocol:(Protocol *)protocol {
    [self sharedClassDictionary][NSStringFromProtocol(protocol)] = class;
}

- (id)instantiateObjectWithProtocol:(Protocol *)protocol {
    NSString* protocolName = NSStringFromProtocol(protocol);
    Class class = [CDMFactory sharedClassDictionary][protocolName];
    if (class) {
        return [[class alloc] init];
    }
    
    NSString* className = [protocolName substringToIndex:[protocolName rangeOfString:@"Protocol"].location];
    if (NSClassFromString(className)) {
        return [[NSClassFromString(className) alloc] init];
    }
    
    NSAssert(NO, @"Failed instantiate object with protocol %@", protocolName);
    return nil;
}

- (__kindof id<CDMSectionProtocol>)sectionWithProtocol:(Protocol *)protocol {
    return [self instantiateObjectWithProtocol:protocol];
}

- (__kindof id<CDMItemProtocol>)itemWithProtocol:(Protocol *)protocol {
    return [self instantiateObjectWithProtocol:protocol];
}

@end
