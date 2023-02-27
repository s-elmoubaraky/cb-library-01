const aws = require('aws-sdk');

const getBooksCategories = (fastifyInstance) => {
  fastifyInstance.get('/getBooksCategories', async (request, reply) => {
    await fastifyInstance.log.info('Send the response');

    let dynamoConfig = {
        region: 'eu-west-1',
        endpoint: 'http://dynamodb:8000'
      };
      
      const documentClient = new aws.DynamoDB.DocumentClient(dynamoConfig);

      fastifyInstance.log.info('Getting Books Categories Data from DynamoDB');

      const params = {
        TableName: 'CbLibrary01Table',
        ProjectionExpression: 'Category'
        };

    const uniqueResults = new Set();

    documentClient.scan(params, function(err, data) {
        if (err) {
        console.log(err);
        } else {
        data.Items.forEach(item => {
            uniqueResults.add(item.Category); 
        });
        console.log(uniqueResults);
            
        const response = {
            statusCode: 200,
            body: Array.from(uniqueResults),
        };
        reply.header('Content-Type', 'application/json').code(200);
        reply.send(response);
    }
    });
  
});
};

module.exports = getBooksCategories;
