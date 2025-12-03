//
//  myWebViewController.m
//  FalconAd_Demo
//
//  Created by 1234 on 2025/11/17.
//  Copyright © 2025 King_liu. All rights reserved.
//

#import "myWebViewController.h"
#import <WebKit/WebKit.h>
#import "LogManager.h"
@interface myWebViewController ()<WKScriptMessageHandler,WKNavigationDelegate>

@end

@implementation myWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:scrollview];
    WKUserContentController *userContentController = [[WKUserContentController alloc] init];

    
    // 2. 注入 JS 脚本，重写 console.log 方法，将日志通过消息处理器发送给原生
    NSString *consoleScript = @"("
    "function() {"
    "   var originalLog = console.log;"
    "   console.log = function(message) {"
    "       // 将 console.log 的参数发送到原生，消息名称为 'consoleLog'"
    "       window.webkit.messageHandlers.consoleLog.postMessage(message);"
    "       // 保留原有的 console.log 功能（可选）"
    "       originalLog.apply(console, arguments);"
    "   };"
    "}"
    ")();";
   
    
    WKUserScript *script = [[WKUserScript alloc] initWithSource:consoleScript
                                              injectionTime:WKUserScriptInjectionTimeAtDocumentStart // 页面加载前注入
                                           forMainFrameOnly:YES]; // 只对主框架生效
    [userContentController addUserScript:script];
    
    // 3. 添加消息处理器，名称需与 JS 中一致（此处为 "consoleLog"）
    [userContentController addScriptMessageHandler:self name:@"consoleLog"];
    
    // 4. 配置 WKWebView
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config.userContentController = userContentController;
    
    // 5. 创建 WKWebView
   WKWebView *web  = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
//    WKWebView *web = [[WKWebView alloc] init];
   web.navigationDelegate = self;
   web.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
   web.backgroundColor = UIColor.redColor;
    [scrollview addSubview:web];

    [web loadRequest:[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://www.xiachufang.com/page/appfaq/"]]];
//
    // Do any additional setup after loading the view.
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"[ViewController] 页面加载完成，我的逻辑也执行了！");
    [[LogManager shared] logToTextView:@"页面加载完成，我的逻辑也执行了"];
//    self.title = webView.title;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
