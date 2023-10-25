import { WebPlugin } from '@capacitor/core';

import type { OryAuthPlugin } from './definitions';

export class OryAuthWeb extends WebPlugin implements OryAuthPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
