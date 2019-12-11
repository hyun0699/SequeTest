//
//  WKWebview.m
//  SequeTest
//
//  Created by hyun0699 on 02/12/2019.
//  Copyright © 2019 hyun0699. All rights reserved.
//

#import "WKWebview.h"

@interface WKWebview ()

@end

@implementation WKWebview

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    WKWebViewConfiguration * config = [[WKWebViewConfiguration alloc] init];
    WKUserContentController * jsctrl = [[WKUserContentController alloc]init];


     // 스크립트를 초기화 합니다.
        WKUserScript *cookie_script = [[WKUserScript alloc]initWithSource:@"alert('load!')"
                                        injectionTime:WKUserScriptInjectionTimeAtDocumentStart
                                        forMainFrameOnly:NO];
        // UserContentController에 스크립트를 삽입합니다.
        [jsctrl addUserScript:cookie_script];
    
    [jsctrl addScriptMessageHandler:self name:@"ioscall"];
    [jsctrl addScriptMessageHandler:self name:@"ioscall2"];
    [config setUserContentController:jsctrl];






    
    
    
    self.webview = [[WKWebView alloc] initWithFrame:self.view.frame configuration:config];
    self.webview.UIDelegate = self;
    self.webview.navigationDelegate = self;
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.6.67:8080"]];
//    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://m.daum.net"]];
    [self.webview loadRequest:request];
    [self.view addSubview:self.webview];
    
 
      // 스크립트를 초기화 합니다.
//        WKUserScript *cookie_script = [[WKUserScript alloc]initWithSource:@"alert('load!')"
//                                        injectionTime:WKUserScriptInjectionTimeAtDocumentStart
//                                        forMainFrameOnly:NO];
//        // UserContentController에 스크립트를 삽입합니다.
//        [jsctrl addUserScript:cookie_script];
    
    NSTimer * timer  = [NSTimer scheduledTimerWithTimeInterval:2.0f repeats:NO
                                                block:^(NSTimer * _Nonnull timer) {
        [self.webview evaluateJavaScript:@"window.alert('Hello World');" completionHandler:^(id test, NSError * _Nullable error) {
            NSLog(@"success");
        }];
        
    }];
    
    
    


    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)userContentController:(nonnull WKUserContentController *)userContentController didReceiveScriptMessage:(nonnull WKScriptMessage *)message {
    NSLog(@"userContentController=%@",message);
    NSLog(@"message name=%@ body=%@",[message name], [message body]);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    [self.webview evaluateJavaScript:@"window.alert('Hello World');" completionHandler:^(id test, NSError * _Nullable error) {
        NSLog(@"success");
    }];
}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }];
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:^{
        
    }];
    
                                
    
}

@end
