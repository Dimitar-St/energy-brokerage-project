export class UrlBuilder {
  private cache: string | null = null
  private parameters: Record<string, string> = {}
  private prefix: string

  public constructor(prefix: string) {
    this.prefix = prefix
  }

  public getParameter = (name: string, defaultValue: string): string => {
    return this.parameters[name] ?? defaultValue
  }

  public setParameter = (name: string, value: string | null): void => {
    const parameter = this.parameters[name]
    if (parameter == value) {
      return
    }
    this.cache = null
    if (value == null) {
      delete this.parameters[name]
    } else {
      this.parameters[name] = String(value)
    }
  }

  public toString = (): string => {
    if (this.cache == null) {
      let url = ''
      const entries = Object.entries(this.parameters)
      for (const entry of entries) {
        const name = encodeURIComponent(entry[0])
        const value = encodeURIComponent(entry[1])
        url += (url ? '&' : '?') + name + '=' + value
      }
      this.cache = this.prefix + url
    }
    return this.cache
  }
}

export default { UrlBuilder }
