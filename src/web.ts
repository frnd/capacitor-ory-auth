import {WebPlugin} from '@capacitor/core';

import type {
    LogInOptions, LoginResult,
    OryAuthOptions,
    OryAuthPlugin,
    SignInOptions,
    VerifyOptions,
    VerifyResult
} from './definitions';
import {FrontendApi, Configuration, UiNodeInputAttributes, Session} from '@ory/kratos-client';
import {SignInResult} from "./definitions";


let kratos: FrontendApi;

export class OryAuthWeb extends WebPlugin implements OryAuthPlugin {

    initialize(options: OryAuthOptions): Promise<void> {
        const {
            basePath,
            withCredentials = true,
            timeout = 5000
        } = options || {};

        const kratosConfiguration = new Configuration({
            basePath,
            baseOptions: {
                withCredentials,
                timeout,
            },
        });

        kratos = new FrontendApi(kratosConfiguration);
        return Promise.resolve()
    }

    async session(): Promise<Session> {

        if (!kratos) return Promise.reject("Initialize plugin before use.")

        const {data: session} = await kratos.toSession()
        return session
    }

    async signIn({password, traits}: SignInOptions): Promise<SignInResult> {

        if (!kratos) return Promise.reject("Initialize plugin before use.")

        const {data: flow} = await kratos.createBrowserRegistrationFlow()
        const defaultNode = flow.ui.nodes.find(n => n.group === 'default')
        if (defaultNode && defaultNode.type === 'input') {
            const attributes: UiNodeInputAttributes = defaultNode.attributes as UiNodeInputAttributes
            const {data: registration} = await kratos.updateRegistrationFlow({
                flow: flow.id,
                updateRegistrationFlowBody: {
                    method: 'password',
                    csrf_token: attributes.value,
                    password,
                    traits,
                }
            });

            for (const cw of (registration.continue_with || [])) {
                if(cw.action === 'show_verification_ui' && 'flow' in cw) return Promise.resolve({
                    ...registration,
                    verificationFlowId: cw.flow.id,
                })
            }

            return Promise.reject("No verification flow Id");
        }

        return Promise.reject("Error")
    }

    async verify({id, code, email}: VerifyOptions): Promise<VerifyResult> {

        if (!kratos) return Promise.reject("Initialize plugin before use.")

        const {data: flow} = await kratos.getVerificationFlow({id})
        const defaultNode = flow.ui.nodes.find(n => n.group === 'default')
        if (defaultNode && defaultNode.type === 'input') {
            const attributes: UiNodeInputAttributes = defaultNode.attributes as UiNodeInputAttributes
            const {data: verification} = await kratos.updateVerificationFlow({
                flow: flow.id,
                updateVerificationFlowBody: {
                    method: 'code',
                    csrf_token: attributes.value,
                    email,
                    code
                }
            })
            return Promise.resolve(verification);
        }

        return Promise.reject("Error")
    }

    async logIn({identifier, password}: LogInOptions): Promise<LoginResult> {

        if (!kratos) return Promise.reject("Initialize plugin before use.")

        const {data: flow} = await kratos.createBrowserLoginFlow();
        const defaultNode = flow.ui.nodes.find(n => n.group === 'default')
        if (defaultNode && defaultNode.type === 'input') {
            const attributes: UiNodeInputAttributes = defaultNode.attributes as UiNodeInputAttributes
            const {data: verification} = await kratos.updateLoginFlow({
                flow: flow.id,
                updateLoginFlowBody: {
                    method: 'password',
                    csrf_token: attributes.value,
                    password,
                    identifier
                }
            })
            return Promise.resolve(verification);
        }

        return Promise.reject("Error")
    }

    async logOut(): Promise<void> {

        if (!kratos) return Promise.reject("Initialize plugin before use.");

        const {data: flow} = await kratos.createBrowserLogoutFlow();
        const {data: logout} = await kratos.updateLogoutFlow({
            token: flow.logout_token
        })

        return Promise.resolve(logout)
    }
}
