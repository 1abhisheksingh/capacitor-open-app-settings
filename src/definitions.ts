export interface AppSettingsPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
