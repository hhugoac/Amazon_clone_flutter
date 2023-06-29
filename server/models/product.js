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
    quantity: {
        type: String,
        required: true,
        trim: true,
    },
    category: {
        type: String,
        required: true,
      },
    price: {
        type: Number,
        require: true,
    }
});

const Product = mongoose.model('Product', productSchema);
module.exports = {Product, productSchema};