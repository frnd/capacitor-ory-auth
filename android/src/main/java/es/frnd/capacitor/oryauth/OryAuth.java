package es.frnd.capacitor.oryauth;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import androidx.core.os.BuildCompat;

import java.util.Optional;

import sh.ory.ApiClient;
import sh.ory.ApiException;
import sh.ory.api.FrontendApi;
import sh.ory.model.ContinueWith;
import sh.ory.model.RegistrationFlow;
import sh.ory.model.Session;
import sh.ory.model.SuccessfulNativeRegistration;
import sh.ory.model.UpdateRegistrationFlowBody;
import sh.ory.model.UpdateRegistrationFlowWithPasswordMethod;

public class OryAuth {

    private static final String TAG = OryAuth.class.getSimpleName();
    private static final String X_SESSION_TOKEN_PREFERENCES_NAME = "ory_session_token_preferences";
    private static final String X_SESSION_TOKEN = "ory_session_token";
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
        if(xSessionToken == null) return false;
        try {
            Session session = frontendApi.toSession(xSessionToken, null, null);
            return Boolean.TRUE.equals(session.getActive());
        } catch (ApiException e) {
           return false;
        }
    }

    public String signin(String password) {
        try {
            RegistrationFlow flow = frontendApi.createNativeRegistrationFlow(true, null);

            UpdateRegistrationFlowWithPasswordMethod psswd = new UpdateRegistrationFlowWithPasswordMethod();
            psswd.setPassword(password);
            UpdateRegistrationFlowBody body = new UpdateRegistrationFlowBody(psswd);
            SuccessfulNativeRegistration registration = frontendApi.updateRegistrationFlow(flow.getId(), body, null);
            String xSessionToken = registration.getSessionToken();
            SharedPreferences.Editor editor = mSharedPreferences.edit();
            editor.remove(X_SESSION_TOKEN);
            editor.putString(X_SESSION_TOKEN, xSessionToken);
            editor.commit();

            ContinueWith continueWith = registration.getContinueWith().get(0);
            return "";
        } catch (ApiException e) {
            return null;
        }
    }
}
