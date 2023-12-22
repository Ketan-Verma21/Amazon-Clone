const express = require('express');
const productRouter = express.Router();
const auth = require('../middleware/auth');
const Product = require('../models/product');
productRouter.get('/api/products', auth, async (req, res) => {
    try {

        const products = await Product.find({ category: req.query.category });
        // console.log(products);
        res.json(products);

    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});
productRouter.get('/api/products/search/:name', auth, async (req, res) => {
    try {
        const regex = new RegExp(req.params.name, 'i');
        const products = await Product.find({ name: { $regex: regex } });
        // console.log(products);
        res.json(products);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = productRouter;