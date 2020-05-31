#import "HomeModulePlugin.h"
#if __has_include(<home_module/home_module-Swift.h>)
#import <home_module/home_module-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "home_module-Swift.h"
#endif

@implementation HomeModulePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHomeModulePlugin registerWithRegistrar:registrar];
}
@end
