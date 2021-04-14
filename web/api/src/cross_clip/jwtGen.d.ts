declare module '@sagi.io/workers-jwt' {
    export function getTokenFromGCPServiceAccount(configuration: any): Promise<string>
}
