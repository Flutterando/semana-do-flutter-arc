#import "LoginModulePlugin.h"
#if __has_include(<login_module/login_module-Swift.h>)
#import <login_module/login_module-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "login_module-Swift.h"
#endif

@implementation LoginModulePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLoginModulePlugin registerWithRegistrar:registrar];
}
@end
