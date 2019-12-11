//
//  ViewController.m
//  SequeTest
//
//  Created by hyun0699 on 29/11/2019.
//  Copyright © 2019 hyun0699. All rights reserved.
//

#import "ViewController.h"
#import "RootViewController.h"

@interface ViewController ()



@end

@implementation ViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Root";
    


    
    
    

    
    [self performSegueWithIdentifier:@"TableShow" sender:self];
   //[self performSegueWithIdentifier:@"Second" sender:self];
    
    
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    
//    NSURL *URL= [NSURL URLWithString:@"http://example.com/download.zip"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//
//    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
//        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
//        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
//    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
//        NSLog(@"File downloaded to: %@", filePath);
//    }];
//    [downloadTask resume];
//
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURL *URL = [NSURL URLWithString:@"http://httpbin.org/get"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//
//    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
//        if (error) {
//            NSLog(@"Error: %@", error);
//        } else {
//            NSLog(@"%@ %@", response, responseObject);
//            NSDictionary *header = [responseObject valueForKey:@"headers"];
//        }
//    }];
//    [dataTask resume];
//
//    NSString *URLString = @"http://example.com";

    
    NSDictionary *parameters = @{@"foo": @"bar", @"baz": @[@1, @2, @3]};
//    [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:URLString parameters:parameters error:nil];
    
    AFHTTPSessionManager * session = [AFHTTPSessionManager manager];
    [session  GET:[URL absoluteString] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {

     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         NSLog(@"success");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"fail");
    }];
    
//    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
//    [session.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//
//    [session POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"responseObject=%@",responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"fail=%@",error);
//    }];
    
    
    
    
    
    

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"prepare..=%@",segue.identifier);
    
    if([segue.identifier isEqualToString:@"Cell2"]) {
        RootViewController *root =(RootViewController *)segue.destinationViewController;
        root.inSData = @{@"key1":@"value1"};
        root.preViewController = self;
    }
}

- (BOOL)canPerformUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController sender:(nullable id)sender {
    NSLog(@"canPerform...");
    return true;
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(nullable id)sender {
    NSLog(@"shouldPerformSegueWithIdentifier...");
    return true;
}

- (IBAction)Back1:(UIStoryboardSegue *)sender {
    NSLog(@"back1=%@",sender);
    [self finishBlock];
    
}



- (void)startBolck:(NSString *)star block:(returnBlock)block {
    self.block = block;
    
}

- (void)finishBlock {
    if(self.block != nil) {
        NSLog(@"finish block..");
        self.block(@"aaa", @"bbb");
    }
}

@end
