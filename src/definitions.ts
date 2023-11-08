import {Session, Identity} from "@ory/kratos-client";

export interface OryAuthOptions {
    basePath: string,
    withCredentials?: boolean,
    timeout?: number
}

export interface SignInOptions {
    password: string,
    traits: {
        email: string,
    }
}

export interface SignInResult {
    verificationFlowId: string,
    identity: Identity;
    session?: Session;
}

export interface VerifyOptions {
    id: string,
    code: string,
    email?: string,
}

export interface VerifyResult {
    state: string
}

export interface LogInOptions {
    identifier: string,
    password: string
}

export interface LoginResult {
    session: Session;
}

export interface OryAuthPlugin {
    initialize(options?: OryAuthOptions): Promise<void>;

    session(): Promise<Session>

    signIn(options: SignInOptions): Promise<SignInResult>;

    verify(options: VerifyOptions): Promise<VerifyResult>;

    logIn(options: LogInOptions): Promise<LoginResult>;

    logOut(): Promise<void>;
}
