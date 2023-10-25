export interface OryAuthPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
