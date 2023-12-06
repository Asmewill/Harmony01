import hilog from '@ohos.hilog';
export class Logger {
    constructor(prefix) {
        this.format = `%{public}s, %{public}s`;
        this.prefix = prefix;
        this.domain = 0xFF00;
    }
    debug(...args) {
        hilog.debug(this.domain, this.prefix, this.format, args);
    }
    info(...args) {
        hilog.info(this.domain, this.prefix, this.format, args);
    }
    warn(...args) {
        hilog.warn(this.domain, this.prefix, this.format, args);
    }
    error(...args) {
        hilog.error(this.domain, this.prefix, this.format, args);
    }
    fatal(...args) {
        hilog.fatal(this.domain, this.prefix, this.format, args);
    }
    isLoggable(level) {
        hilog.isLoggable(this.domain, this.prefix, level);
    }
}
export default new Logger('[PageRouter]');
//# sourceMappingURL=Logger.js.map