class ErrorResult extends Error {
    message;
    status;

    constructor(message, status = 500) {
        super(message);
        this.message = message;
        this.status = status;
    }
}

module.exports = ErrorResult;