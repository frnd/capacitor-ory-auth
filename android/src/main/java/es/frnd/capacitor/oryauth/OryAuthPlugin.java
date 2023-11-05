package es.frnd.capacitor.oryauth;

import android.webkit.JavascriptInterface;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

import sh.ory.ApiClient;
import sh.ory.ApiException;
import sh.ory.Configuration;

@CapacitorPlugin(name = "OryAuth")
public class OryAuthPlugin extends Plugin {

    private OryAuth auth;

    private SessionTokenStore sessionTokenStore;

    @Override
    public void load() {
        sessionTokenStore = new SessionTokenStore(getContext());
        this.bridge.getWebView().addJavascriptInterface(this, "CapacitorOryAuthAndroidInterface");
        super.load();
    }

    @JavascriptInterface
    public String sessionToken() {
        return sessionTokenStore.get();
    }

    @PluginMethod()
    public void initialize(PluginCall call) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        String basePath = call.getString("basePath");
        defaultClient.setBasePath(basePath);
        auth = new OryAuth(sessionTokenStore, defaultClient);
        call.resolve();
    }

    @PluginMethod()
    public void session(PluginCall call) {

        if (auth == null) call.reject("Initialize plugin before use.");

        JSObject ret = new JSObject();
        ret.put("active", auth.session());
        call.resolve(ret);
    }

    @PluginMethod()
    public void signIn(PluginCall call) {

        if (auth == null) call.reject("Initialize plugin before use.");

        String password = call.getString("password");
        JSObject traits = call.getObject("traits");

        try {
            String flowId = auth.signIn(password, traits.toString());
            JSObject res = new JSObject();
            res.put("verificationFlowId", flowId);
            call.resolve(res);
        } catch (ApiException e) {
            call.reject(e.getMessage());
        }

    }

    @PluginMethod()
    public void verify(PluginCall call) {

        if (auth == null) call.reject("Initialize plugin before use.");

        String id = call.getString("id");
        String code = call.getString("code");
        String email = call.getString("email");

        try {
            Object state = auth.verify(id, code, email);
            JSObject res = new JSObject();
            res.put("state", state);
            call.resolve(res);
        } catch (ApiException e) {
            call.reject(e.getMessage());
        }
    }

    @PluginMethod()
    public void logIn(PluginCall call) {

        if (auth == null) call.reject("Initialize plugin before use.");

        String identifier = call.getString("identifier");
        String password = call.getString("password");

        try {
            auth.login(identifier, password);
            call.resolve();
        } catch (ApiException e) {
            call.reject(e.getMessage());
        }

        System.out.println("logIn");
        call.resolve();
    }

    @PluginMethod()
    public void logOut(PluginCall call) {

        if (auth == null) call.reject("Initialize plugin before use.");

        try {
            JSObject res = new JSObject();
            res.put("state", auth.logout());
            call.resolve(res);
        } catch (ApiException e) {
            call.reject(e.getMessage());
        }
    }
}
