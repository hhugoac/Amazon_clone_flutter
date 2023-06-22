const mongoose = require("mongoose");

const productSchema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true,
    },
    description: {
        type: String,
        required: true,
        trim: true,
    },
    images: [
        {
            type: String,
            required: true,
        },
    ],
    quatity: {
        type: Number,
        require: true,
    },
    price: {
        type: Number,
        require: true,
    }
});

const Product = mongoose.model('Product', productSchema);
module.exports = {Product, productSchema};