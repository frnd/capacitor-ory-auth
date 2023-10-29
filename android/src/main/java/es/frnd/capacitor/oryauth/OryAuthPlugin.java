package es.frnd.capacitor.oryauth;

import android.content.Context;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

import java.io.IOException;
import java.security.KeyStore;
import java.security.NoSuchAlgorithmException;
import java.security.Signature;
import java.security.cert.CertificateException;

import sh.ory.ApiClient;
import sh.ory.Configuration;
import sh.ory.api.FrontendApi;

@CapacitorPlugin(name = "OryAuth")
public class OryAuthPlugin extends Plugin {

    public static final String KEYSTORE_PROVIDER_ANDROID_KEYSTORE = "AndroidKeyStore";
    public static final String SIGNATURE_SHA256withRSA = "SHA256withRSA";
    public static final String KEYSTORE_KEY_NAME = "xSessionToken";

    private OryAuth auth;

    @PluginMethod()
    public void initialize(PluginCall call) {
        ApiClient defaultClient = Configuration.getDefaultApiClient();
        String basePath = call.getString("basePath");
        defaultClient.setBasePath(basePath);
        auth = new OryAuth(getContext(), defaultClient);
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
        // JSObject traits = call.getObject("traits");

        auth.signin(password);

        call.resolve();
    }

    @PluginMethod()
    public void verify(PluginCall call) {

        if (auth == null) call.reject("Initialize plugin before use.");

        System.out.println("verify");
        call.resolve();
    }

    @PluginMethod()
    public void logIn(PluginCall call) {

        if (auth == null) call.reject("Initialize plugin before use.");

        System.out.println("logIn");
        call.resolve();
    }

    @PluginMethod()
    public void logOut(PluginCall call) {

        if (auth == null) call.reject("Initialize plugin before use.");

        System.out.println("logOut");
        call.resolve();
    }
}
