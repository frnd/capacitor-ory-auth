package es.frnd.capacitor.oryauth;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import androidx.core.os.BuildCompat;

public class SessionTokenStore {

    private static final String TAG = OryAuth.class.getSimpleName();

    private static final String X_SESSION_TOKEN_PREFERENCES_NAME = "ory_session_token_preferences";
    private static final String X_SESSION_TOKEN = "ory_session_token";

    private SharedPreferences mSharedPreferences;

    public SessionTokenStore(Context context) {
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
    }

    public String get() {
        return mSharedPreferences.getString(X_SESSION_TOKEN, null);
    }

    public void store(String xSessionToken) {
        SharedPreferences.Editor editor = mSharedPreferences.edit();
        editor.remove(X_SESSION_TOKEN);
        editor.putString(X_SESSION_TOKEN, xSessionToken);
        editor.apply();
    }

    public void clear() {
        SharedPreferences.Editor editor = mSharedPreferences.edit();
        editor.remove(X_SESSION_TOKEN);
        editor.apply();
    }
}
