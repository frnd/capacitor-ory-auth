import {SplashScreen} from '@capacitor/splash-screen';
import {OryAuth} from '@frnd/capacitor-ory-auth';

function updateSessionInfo(element) {
    OryAuth.session().then((session) => {
        element.innerHTML = JSON.stringify(session, null, 2)
    }).catch(() => {
        element.innerHTML = "No session"
    }).finally(SplashScreen.hide)
}

window.customElements.define(
    'capacitor-welcome',
    class extends HTMLElement {
        constructor() {
            super();

            const root = this.attachShadow({mode: 'open'});

            root.innerHTML = `
    <style>
      :host {
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
        display: block;
        width: 100%;
        height: 100%;
      }
      h1, h2, h3, h4, h5 {
        text-transform: uppercase;
      }
      .button {
        display: inline-block;
        padding: 10px;
        background-color: #73B5F6;
        color: #fff;
        font-size: 0.9em;
        border: 0;
        border-radius: 3px;
        text-decoration: none;
        cursor: pointer;
      }
      main {
        padding: 15px;
      }
      main p {
        color: #333;
      }
      .form-container {
        display: flex;
        flex-direction: column;
        column-gap: 18px;
        padding 12px;
      }
      .form-field {
        display: flex;
        flex-direction: column;
        column-gap: 18px;
        padding: 12px 0;
      }
      .form-field input {
        box-sizing: border-box;
        background: #FFFFFF;
        border: 1px solid #EEEEEE;
        border-radius: .25rem;
        padding: .75rem 1.5rem;
      }
      .form-field input:hover {
        border-color: #73B5F6;
      }
    </style>
    <div>
      <capacitor-welcome-titlebar>
        <h1>Capacitor Pry Auth Test</h1>
      </capacitor-welcome-titlebar>
      <main>
        <article class="form-container">
            <h1>Create account</h1>
            <div data-testid="node/input/traits.email" class="form-field">
                <label for="new-email">E-Mail <span>*</span></label>
                <input placeholder=" " id="new-email" name="traits.email" type="email" autocomplete="email" required="">
            </div>
            <div data-testid="node/input/password"  class="form-field">
                <label for="new-password">Password <span>*</span></label>
                <input placeholder=" " id="new-password" name="password" type="password" autocomplete="new-password" required="">
            </div>
            <div data-testid="node/input/traits.name.first" class="form-field">
                <label for="name-first">First Name </label>
                <input placeholder=" " id="name-first" name="traits.name.first" type="text" autocomplete="">
            </div>
            <div data-testid="node/input/traits.name.last" class="form-field">
                <label for="name-last">Last Name </label>
                <input placeholder=" " id="name-last" name="traits.name.last" type="text" autocomplete="">
            </div>
            <button class="button" id="sign-in">Sign In</button>
            <pre id="sign-in-result"/>
        </article>
        <hr>
        <article class="form-container">
            <h1>Verify your account</h1>
            <div data-testid="node/input/code" class="form-field">
                <label for="code">Verification code <span>*</span></label>
                <input placeholder=" " id="code" name="code" type="text" required="">
            </div>
            <button class="button" id="validate">Validate</button>
        </article>
        <hr>
        <article class="form-container">
            <h1>Log in</h1>
            <div data-testid="node/input/identifier" class="form-field">
                <label for="identifier">ID <span>*</span></label>
                <input placeholder=" " id="identifier" name="identifier" type="text" autocomplete="username" required="" value="">
            </div>
            <div data-testid="node/input/password" class="form-field">
                <label for="password">Password <span>*</span></label>
                <input placeholder=" " id="password" name="password" type="password" autocomplete="current-password" required="">
            </div>
            <button class="button" id="log-in">Log In</button>
        </article>
        <hr>
        <article class="form-container">
            <h1>Current session</h1>
            <pre id="session-info"></pre>
            <button class="button" id="log-out">Log out</button>
        </article>
      </main>
    </div>
    `;
        }

        connectedCallback() {
            const self = this;


            let verificationFlowId;

            self.shadowRoot.querySelector('#sign-in')
                .addEventListener('click', async function (e) {
                    try {
                        const email = self.shadowRoot.querySelector('#new-email').value
                        const password = self.shadowRoot.querySelector('#new-password').value
                        const first = self.shadowRoot.querySelector('#name-first').value
                        const last = self.shadowRoot.querySelector('#name-last').value
                        const options = {
                            password: password,
                            traits: {email: email, name: {first, last}}
                        }
                        const result = await OryAuth.signIn(options)

                        verificationFlowId = result.continue_with.flow

                        self.shadowRoot.querySelector('#sign-in-result').innerHTML = JSON.stringify(result, null, 2)

                        console.log('Sign in result', result)

                    } catch (e) {
                        console.warn('User cancelled', e);
                    }
                });

            self.shadowRoot.querySelector('#validate')
                .addEventListener('click', async function (e) {
                    try {
                        const code = self.shadowRoot.querySelector('#code').value

                        const result = await OryAuth.verify({id: verificationFlowId, code: code})

                        console.log('Validation result', result)

                        updateSessionInfo(self.shadowRoot.querySelector('#session-info'))

                    } catch (e) {
                        console.warn('User cancelled', e);
                    }
                });

            self.shadowRoot.querySelector('#log-in')
                .addEventListener('click', async function (e) {
                    try {

                        const identifier = self.shadowRoot.querySelector('#identifier').value
                        const password = self.shadowRoot.querySelector('#password').value

                        const result = await OryAuth.logIn({identifier: identifier, password:password})

                        self.shadowRoot.querySelector('#session-info').innerHTML = JSON.stringify(result.session, null, 2)

                    } catch (e) {
                        console.warn('User cancelled', e);
                    }
                });

            self.shadowRoot.querySelector('#log-out')
                .addEventListener('click', async function (e) {
                    try {

                        const result = await OryAuth.logOut()

                        self.shadowRoot.querySelector('#session-info').innerHTML = JSON.stringify(result, null, 2)

                    } catch (e) {
                        console.warn('User cancelled', e);
                    }
                });

            const LOCAL = "http://localhost:8080/.ory/kratos/public"
            const ORY_PROXY = "http://localhost:4000/.ory"
            const ORY_NETWORK = "https://unruffled-nash-i4elrqes45.projects.oryapis.com"
            OryAuth.initialize({basePath: ORY_PROXY, timeout: 10000})

            updateSessionInfo(self.shadowRoot.querySelector('#session-info'))
        }
    }
);

window.customElements.define(
    'capacitor-welcome-titlebar',
    class extends HTMLElement {
        constructor() {
            super();
            const root = this.attachShadow({mode: 'open'});
            root.innerHTML = `
    <style>
      :host {
        position: relative;
        display: block;
        padding: 15px 15px 15px 15px;
        text-align: center;
        background-color: #73B5F6;
      }
      ::slotted(h1) {
        margin: 0;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
        font-size: 0.9em;
        font-weight: 600;
        color: #fff;
      }
    </style>
    <slot></slot>
    `;
        }
    }
);
