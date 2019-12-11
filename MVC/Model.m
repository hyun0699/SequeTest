//
//  Model.m
//  SequeTest
//
//  Created by hyun0699 on 30/11/2019.
//  Copyright © 2019 hyun0699. All rights reserved.
//

#import "Model.h"
#import <AFNetworking/AFNetworking.h>

@implementation Model


-(instancetype)initWithData:(connectBlock)block {
    self = [super init];
      if (!self) {
          return nil;
    }
    [self connectApi:block];
    
    
    
    return self;
}

- (void)connectApi:(connectBlock)block {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *URL = @"http://httpbin.org/get";
    NSDictionary *parameters = @{@"foo": @"bar", @"baz": @[@1, @2, @3]};
    //manager.requestSerializer   = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer   = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"sdasdsdas" forHTTPHeaderField:@"Authorization"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSLog(@"commit test");

    
    [manager GET:URL parameters:parameters
        progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject=%@",[responseObject description]);
        block(responseObject, true);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil, false);  
    }];
}

@end
