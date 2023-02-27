const aws = require('aws-sdk');

const getBooks = (fastifyInstance) => {
  fastifyInstance.get('/getBooks', async (request, reply) => {
    await fastifyInstance.log.info('Send the response');

    let dynamoConfig = {
        region: 'eu-west-1',
        endpoint: 'http://dynamodb:8000'
      };
      
      const documentClient = new aws.DynamoDB.DocumentClient(dynamoConfig);

      fastifyInstance.log.info('Getting Books Data from DynamoDB');

      const params = {
        TableName: 'CbLibrary01Table',
    };

    documentClient.scan(params, (err, data) => {
        if (err) {
            console.log(err);
        } else {
            console.log(data.Items)
            const response = {
                statusCode: 200,
                body: data.Items,
            };
            reply.header('Content-Type', 'application/json').code(200);
            reply.send(response);
        }
    });

  });
};

module.exports = getBooks;
