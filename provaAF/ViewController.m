//
//  ViewController.m
//  provaAF
//
//  Created by miquel on 31/08/16.
//  Copyright © 2016 miquel. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
@interface ViewController ()

@end

@implementation ViewController
@synthesize tv;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    tv.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)boto:(id)sender {
/*
    // 2.0
 
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSURLCredential *credential = [NSURLCredential credentialWithUser:@"user" password:@"passwd" persistence:NSURLCredentialPersistenceNone];
    
//    NSMutableURLRequest *request = [manager.requestSerializer requestWithMethod:@"GET" URLString:@"https://httpbin.org/basic-auth/user/passwd" parameters:nil];

    NSMutableURLRequest * request = [manager.requestSerializer requestWithMethod:@"GET" URLString:@"https://httpbin.org/basic-auth/user/passwd" parameters:nil error:nil];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCredential:credential];
    [operation setResponseSerializer:[AFJSONResponseSerializer alloc]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        tv.text = operation.responseString;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        tv.text = [error description];
    }];
    [manager.operationQueue addOperation:operation];
*/
    // 3.0
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"user" password:@"passwd"];
    
    [manager GET:@"https://httpbin.org/basic-auth/user/passwd"
       parameters:[NSDictionary dictionaryWithObjectsAndKeys:@"A",@"B", nil]
         progress:^(NSProgress * _Nonnull uploadProgress) {
             NSLog(@"completion: %f",uploadProgress.fractionCompleted );
         }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NSLog(@"JSON: %@", responseObject);
              //              tv.text = responseObject;
              tv.text = [NSString stringWithFormat:@"%@",responseObject];
              

          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              NSLog(@"Error: %@", error);
              tv.text = [error description];
          }];

    // per fer un enviament
/*
    [manager POST:(NSString *)
          parameters:<#(id)#>
          success:<#^(AFHTTPRequestOperation *operation, id responseObject)success#>
          failure:<#^(AFHTTPRequestOperation *operation, NSError *error)failure#>
    ];
*/
}
- (IBAction)post2:(id)sender {
/*
    // 2.0
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSURLCredential *credential = [NSURLCredential credentialWithUser:@"user" password:@"passwd" persistence:NSURLCredentialPersistenceNone];
    
    //    NSMutableURLRequest *request = [manager.requestSerializer requestWithMethod:@"GET" URLString:@"https://httpbin.org/basic-auth/user/passwd" parameters:nil];
    
//    NSMutableURLRequest * request = [manager.requestSerializer requestWithMethod:@"GET" URLString:@"https://httpbin.org/basic-auth/user/passwd" parameters:nil error:nil];
    NSMutableURLRequest * request = [manager.requestSerializer requestWithMethod:@"POST" URLString:@"http://httpbin.org/post" parameters:[NSDictionary dictionaryWithObjectsAndKeys:@"A",@"B", nil] error:nil];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCredential:credential];
    [operation setResponseSerializer:[AFJSONResponseSerializer alloc]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        tv.text = operation.responseString;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        tv.text = [error description];
    }];
    [manager.operationQueue addOperation:operation];
*/
    
    // 3.0
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"user" password:@"passwd"];

    [manager POST:@"http://httpbin.org/post"
       parameters:[NSDictionary dictionaryWithObjectsAndKeys:@"A",@"B", nil]
         progress:^(NSProgress * _Nonnull uploadProgress) {
             NSLog(@"completion: %f",uploadProgress.fractionCompleted );
         }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NSLog(@"JSON: %@", responseObject);
//              tv.text = responseObject;
              tv.text = [NSString stringWithFormat:@"%@",responseObject];
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              NSLog(@"Error: %@", error);
              tv.text = [error description];
          }];
}

@end
