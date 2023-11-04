package es.frnd.capacitor.oryauth;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import androidx.core.os.BuildCompat;

import com.getcapacitor.plugin.CapacitorCookieManager;

import java.net.CookieHandler;
import java.util.List;

import sh.ory.ApiClient;
import sh.ory.ApiException;
import sh.ory.api.FrontendApi;
import sh.ory.model.ContinueWith;
import sh.ory.model.ContinueWithVerificationUi;
import sh.ory.model.PerformNativeLogoutBody;
import sh.ory.model.RegistrationFlow;
import sh.ory.model.Session;
import sh.ory.model.SuccessfulNativeRegistration;
import sh.ory.model.UpdateRegistrationFlowBody;
import sh.ory.model.UpdateRegistrationFlowWithPasswordMethod;
import sh.ory.model.UpdateVerificationFlowBody;
import sh.ory.model.UpdateVerificationFlowWithCodeMethod;
import sh.ory.model.VerificationFlow;

public class OryAuth {

    private static final String TAG = OryAuth.class.getSimpleName();
    private static final String X_SESSION_TOKEN_PREFERENCES_NAME = "ory_session_token_preferences";
    private static final String X_SESSION_TOKEN = "ory_session_token";
    private static final String X_SESSION_TOKEN_COOKIE_NAME = "X-Session-Token-TEST";
    private SharedPreferences mSharedPreferences;

    private FrontendApi frontendApi;

    public OryAuth(Context context, ApiClient defaultClient) {
        Context storageContext;
        if (BuildCompat.isAtLeastN()) {
            // All N devices have split storage areas, but we may need to
            // move the existing preferences to the new device protected
            // storage area, which is where the data lives from now on.
            final Context deviceContext = context.createDeviceProtectedStorageContext();
            if (!deviceContext.moveSharedPreferencesFrom(context,
                    X_SESSION_TOKEN_PREFERENCES_NAME)) {
                Log.w(TAG, "Failed to migrate shared preferences.");
            }
            storageContext = deviceContext;
        } else {
            storageContext = context;
        }
        mSharedPreferences = storageContext
                .getSharedPreferences(X_SESSION_TOKEN_PREFERENCES_NAME, Context.MODE_PRIVATE);

        frontendApi = new FrontendApi(defaultClient);
    }

    public boolean session() {
        String xSessionToken = mSharedPreferences.getString(X_SESSION_TOKEN, null);
        if (xSessionToken == null) return false;
        try {
            Session session = frontendApi.toSession(xSessionToken, (String) null, (String) null);

            boolean active = Boolean.TRUE.equals(session.getActive());
            if (active) {
                ((CapacitorCookieManager)CookieHandler.getDefault()).setCookie(
                        frontendApi.getApiClient().getBasePath(),
                        X_SESSION_TOKEN_COOKIE_NAME,
                        xSessionToken
                );
            }
            return active;
        } catch (Exception e) {
            return false;
        }
    }

    public String signIn(String password, String traits) throws ApiException {
        RegistrationFlow flow = frontendApi.createNativeRegistrationFlow(true, null);

        UpdateRegistrationFlowWithPasswordMethod psswd = new UpdateRegistrationFlowWithPasswordMethod();
        psswd.setPassword(password);
        psswd.setMethod("password");
        psswd.setTraits(traits);
        UpdateRegistrationFlowBody body = new UpdateRegistrationFlowBody(psswd);

        SuccessfulNativeRegistration registration = frontendApi.updateRegistrationFlow(flow.getId(), body, null);
        String xSessionToken = registration.getSessionToken();
        SharedPreferences.Editor editor = mSharedPreferences.edit();
        editor.remove(X_SESSION_TOKEN);
        editor.putString(X_SESSION_TOKEN, xSessionToken);
        editor.commit();

        ContinueWithVerificationUi continueWithVerificationUi;
        List<ContinueWith> continueWith = registration.getContinueWith();
        for (int i = 0; i < continueWith.size(); i++) {
            ContinueWith next = continueWith.get(i);
            try {
                continueWithVerificationUi = next.getContinueWithVerificationUi();
                return continueWithVerificationUi.getFlow().getId();
            } catch (ClassCastException ignored) {}
        }
        return null;
    }

    public Object verify(String id, String code, String email) throws ApiException {

        VerificationFlow flow = frontendApi.createNativeVerificationFlow();

        UpdateVerificationFlowWithCodeMethod codeBody = new UpdateVerificationFlowWithCodeMethod().code(code).email(email);
        UpdateVerificationFlowBody body = new UpdateVerificationFlowBody(codeBody);
        VerificationFlow verification = frontendApi.updateVerificationFlow(flow.getId(), body, null, null);

        return verification.getState();
    }

    public boolean logout() throws ApiException {
        String xSessionToken = mSharedPreferences.getString(X_SESSION_TOKEN, null);
        if (xSessionToken == null) return false;

        PerformNativeLogoutBody performNativeLogoutBody = new PerformNativeLogoutBody();
        performNativeLogoutBody.setSessionToken(xSessionToken);
        frontendApi.performNativeLogout(performNativeLogoutBody);
        SharedPreferences.Editor editor = mSharedPreferences.edit();
        editor.remove(X_SESSION_TOKEN);
        editor.commit();

        return true;
    }
}
