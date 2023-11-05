package es.frnd.capacitor.oryauth;

import com.getcapacitor.plugin.CapacitorCookieManager;

import java.net.CookieHandler;
import java.util.List;

import sh.ory.ApiClient;
import sh.ory.ApiException;
import sh.ory.api.FrontendApi;
import sh.ory.model.ContinueWith;
import sh.ory.model.ContinueWithVerificationUi;
import sh.ory.model.LoginFlow;
import sh.ory.model.PerformNativeLogoutBody;
import sh.ory.model.RegistrationFlow;
import sh.ory.model.Session;
import sh.ory.model.SuccessfulNativeLogin;
import sh.ory.model.SuccessfulNativeRegistration;
import sh.ory.model.UpdateLoginFlowBody;
import sh.ory.model.UpdateLoginFlowWithCodeMethod;
import sh.ory.model.UpdateLoginFlowWithPasswordMethod;
import sh.ory.model.UpdateRegistrationFlowBody;
import sh.ory.model.UpdateRegistrationFlowWithPasswordMethod;
import sh.ory.model.UpdateVerificationFlowBody;
import sh.ory.model.UpdateVerificationFlowWithCodeMethod;
import sh.ory.model.VerificationFlow;

public class OryAuth {

    private static final String TAG = OryAuth.class.getSimpleName();

    private final SessionTokenStore sessionTokenStore;
    private final FrontendApi frontendApi;

    public OryAuth(SessionTokenStore sessionTokenStore, ApiClient defaultClient) {
        this.sessionTokenStore = sessionTokenStore;
        frontendApi = new FrontendApi(defaultClient);
    }

    public boolean session() {
        String xSessionToken = sessionTokenStore.get();
        if (xSessionToken == null) return false;
        try {
            Session session = frontendApi.toSession(xSessionToken, (String) null, (String) null);

            return Boolean.TRUE.equals(session.getActive());
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
        sessionTokenStore.store(xSessionToken);

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
        String xSessionToken = sessionTokenStore.get();
        if (xSessionToken == null) return false;

        PerformNativeLogoutBody performNativeLogoutBody = new PerformNativeLogoutBody();
        performNativeLogoutBody.setSessionToken(xSessionToken);
        frontendApi.performNativeLogout(performNativeLogoutBody);
        sessionTokenStore.clear();

        return true;
    }

    public void login(String identifier, String password) throws ApiException {

        LoginFlow flow = frontendApi.createNativeLoginFlow(null, null, null, true, null);

        UpdateLoginFlowWithPasswordMethod psswd = new UpdateLoginFlowWithPasswordMethod();
        psswd.setPassword(password);
        psswd.setIdentifier(identifier);
        psswd.setMethod("password");
        UpdateLoginFlowBody body = new UpdateLoginFlowBody(psswd);
        SuccessfulNativeLogin login = frontendApi.updateLoginFlow(flow.getId(), body, null, null);

        String xSessionToken = login.getSessionToken();
        sessionTokenStore.store(xSessionToken);
    }
}
