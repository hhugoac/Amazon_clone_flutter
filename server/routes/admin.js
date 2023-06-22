const express = require('express');
const adminRouter = express.Router();
const admin = require('../middleware/admin');
//Add product
adminRouter.post('/admin/add-product',admin, async (req, res, next) => {
    try {
        const {name, description, images, quantity, price, category} = req.body;
        let product = new Product({
            name,
            description,
            images,
            quantity, 
            price, 
            category,
        });
        product = await product.save();
        console.log(product);
        res.json(product);
    } catch (e){
        res.status(500).json({error: e.message});
    }
});

module.exports = adminRouter;