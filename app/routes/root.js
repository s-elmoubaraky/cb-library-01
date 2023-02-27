const fastifyInstance = require('fastify')();
const { default: fastify } = require('fastify');
const getBooksCategories = require('./getBooksCategories');
const getBooks = require('./getBooks');
const getByTitleOrCategory = require('./getByTitleOrCategory');
 
getBooksCategories(fastifyInstance);
getBooks(fastifyInstance);
getByTitleOrCategory(fastifyInstance);

module.exports = fastifyInstance;
