# @frnd/capacitor-ory-auth

Capacitor plugin for Ory Identity Platform

## Install

```bash
npm install @frnd/capacitor-ory-auth
npx cap sync
```

## API

<docgen-index>

* [`initialize(...)`](#initialize)
* [`session()`](#session)
* [`signIn(...)`](#signin)
* [`verify(...)`](#verify)
* [`logIn(...)`](#login)
* [`logOut()`](#logout)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### initialize(...)

```typescript
initialize(options?: OryAuthOptions | undefined) => void
```

| Param         | Type                                                      |
| ------------- | --------------------------------------------------------- |
| **`options`** | <code><a href="#oryauthoptions">OryAuthOptions</a></code> |

--------------------


### session()

```typescript
session() => Promise<unknown>
```

**Returns:** <code>Promise&lt;unknown&gt;</code>

--------------------


### signIn(...)

```typescript
signIn(options: SignInOptions) => Promise<unknown>
```

| Param         | Type                                                    |
| ------------- | ------------------------------------------------------- |
| **`options`** | <code><a href="#signinoptions">SignInOptions</a></code> |

**Returns:** <code>Promise&lt;unknown&gt;</code>

--------------------


### verify(...)

```typescript
verify(options: VerifyOptions) => Promise<unknown>
```

| Param         | Type                                                    |
| ------------- | ------------------------------------------------------- |
| **`options`** | <code><a href="#verifyoptions">VerifyOptions</a></code> |

**Returns:** <code>Promise&lt;unknown&gt;</code>

--------------------


### logIn(...)

```typescript
logIn(options: LogInOptions) => Promise<unknown>
```

| Param         | Type                                                  |
| ------------- | ----------------------------------------------------- |
| **`options`** | <code><a href="#loginoptions">LogInOptions</a></code> |

**Returns:** <code>Promise&lt;unknown&gt;</code>

--------------------


### logOut()

```typescript
logOut() => Promise<unknown>
```

**Returns:** <code>Promise&lt;unknown&gt;</code>

--------------------


### Interfaces


#### OryAuthOptions

| Prop                  | Type                 |
| --------------------- | -------------------- |
| **`basePath`**        | <code>string</code>  |
| **`withCredentials`** | <code>boolean</code> |
| **`timeout`**         | <code>number</code>  |


#### SignInOptions

| Prop           | Type                |
| -------------- | ------------------- |
| **`password`** | <code>string</code> |
| **`traits`**   | <code>object</code> |


#### VerifyOptions

| Prop        | Type                |
| ----------- | ------------------- |
| **`id`**    | <code>string</code> |
| **`code`**  | <code>string</code> |
| **`email`** | <code>string</code> |


#### LogInOptions

| Prop             | Type                |
| ---------------- | ------------------- |
| **`identifier`** | <code>string</code> |
| **`password`**   | <code>string</code> |

</docgen-api>
