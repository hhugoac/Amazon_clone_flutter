const jwtoken = require('jsonwebtoken');
const user = require('../models/user.js');

const admin = async (req, res, next) => {
    try {
        const token = req.header('x-auth-token');
        
        if (!token) return res.status(401).json({msg: 'No auth token, access denied.'});

        const verified = jws.verify(token, 'passwordKey');
        if (!verified) return res
            .status(401)
            .json({msg: 'Token verification failed, authorization denied'});
        
        const user = await User.findById(verified.id);
        if (user.type == 'user' || user.type == 'user') {
            return res.status(401).json({ msg: "You are not an admin!"});
        }
        
        req.user = verified.id;
        req.token = token;
        next();
    } catch(e) {
        res.status(500).json({error: e.message + "jajaja"});
    }
};

module.exports = admin;