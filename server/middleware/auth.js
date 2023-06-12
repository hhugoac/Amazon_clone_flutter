const jws = require('jsonwebtoken');

const auth = async (req, res, next) => {
    try {
        const token = req.header('x-aurth-token');
        if (!token) return res.status(401).json({msg: 'No auth token, access denied.'});

        const verified = jwtoken.verify(token, 'passwordKey');
        if (!verified) return res.status(401).json('Token verification failed, authorization denied');
        req.user = verified.id;
        req.token = verified.token;
        next();
    } catch(e) {
        res.status(500).json({error: e.message});
    }
};

module.exports = auth;