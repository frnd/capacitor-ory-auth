import { registerPlugin } from '@capacitor/core';

import type { OryAuthPlugin } from './definitions';

const OryAuth = registerPlugin<OryAuthPlugin>('OryAuth', {
  web: () => import('./web').then(m => new m.OryAuthWeb()),
});

export * from './definitions';
export { OryAuth };
