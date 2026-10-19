#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@interface GameController:UIViewController<WKUIDelegate,WKScriptMessageHandler>
@end
@implementation GameController
- (void)viewDidLoad {[super viewDidLoad]; self.view.backgroundColor=[UIColor colorWithRed:.98 green:.96 blue:.93 alpha:1];WKWebViewConfiguration *config=[WKWebViewConfiguration new];[config.userContentController addScriptMessageHandler:self name:@"haptic"];WKWebView *web=[[WKWebView alloc] initWithFrame:CGRectZero configuration:config];web.translatesAutoresizingMaskIntoConstraints=NO;web.UIDelegate=self;[self.view addSubview:web];[NSLayoutConstraint activateConstraints:@[[web.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],[web.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor],[web.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],[web.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor]]];NSURL *url=[[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html" subdirectory:@"Web"];[web loadFileURL:url allowingReadAccessToURL:[url URLByDeletingLastPathComponent]];}
- (void)userContentController:(WKUserContentController*)controller didReceiveScriptMessage:(WKScriptMessage*)message {if([message.name isEqualToString:@"haptic"]){UIImpactFeedbackGenerator *g=[[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];[g impactOccurred];}}
- (void)webView:(WKWebView*)web runJavaScriptTextInputPanelWithPrompt:(NSString*)prompt defaultText:(NSString*)text initiatedByFrame:(WKFrameInfo*)frame completionHandler:(void (^)(NSString*))handler {UIAlertController *a=[UIAlertController alertControllerWithTitle:prompt message:nil preferredStyle:UIAlertControllerStyleAlert];[a addTextFieldWithConfigurationHandler:^(UITextField *f){f.text=text;}];[a addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *x){handler(nil);}]];[a addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *x){handler(a.textFields.firstObject.text);}]];[self presentViewController:a animated:YES completion:nil];}
@end
@interface AppDelegate:UIResponder<UIApplicationDelegate>
@property(strong,nonatomic) UIWindow *window;
@end
@implementation AppDelegate
- (BOOL)application:(UIApplication*)app didFinishLaunchingWithOptions:(NSDictionary*)options {self.window=[[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];self.window.rootViewController=[GameController new];[self.window makeKeyAndVisible];return YES;}
@end
int main(int argc,char *argv[]){@autoreleasepool{return UIApplicationMain(argc,argv,nil,NSStringFromClass(AppDelegate.class));}}
