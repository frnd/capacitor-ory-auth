
export const setup = () => {
    window.fetch = new Proxy(window.fetch, {
        apply(actualFetch, that, args: [ RequestInfo, RequestInit ]) {
            // @ts-ignore
            const sessionToken = CapacitorOryAuthAndroidInterface.sessionToken()
            const [input, init] = args
            const additionalHeaders = {
                ...(sessionToken ? {'X-Session-Token': sessionToken} : {})
            }
            const initWithHeader = {
                ...init,
                headers: {
                    ...(init && init.headers || {}),
                    ...additionalHeaders,
                }
            }
            // Forward function call to the original fetch
            return Reflect.apply(actualFetch, that, [input, initWithHeader]);
        }
    });
}

