import { WebPlugin } from '@capacitor/core';

import type { AppSettingsPlugin } from './definitions';

export class AppSettingsWeb extends WebPlugin implements AppSettingsPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
