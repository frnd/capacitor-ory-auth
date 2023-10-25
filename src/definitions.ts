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
}


export interface VerifyOptions {
  id: string,
  code: string,
  email?: string,
}

export interface LogInOptions {
  identifier: string,
  password: string
}


export interface OryAuthPlugin {
  initialize(options?: OryAuthOptions): void;

  session(): Promise<unknown>

  signIn(options: SignInOptions): Promise<SignInResult>;

  verify(options: VerifyOptions): Promise<unknown>;

  logIn(options: LogInOptions): Promise<unknown>;

  logOut(): Promise<unknown>;
}
