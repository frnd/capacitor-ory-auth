#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(OryAuthPlugin, "OryAuth",
           CAP_PLUGIN_METHOD(echo, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(initialize, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(session, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(signIn, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(verify, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(logIn, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(logOut, CAPPluginReturnPromise);
)
