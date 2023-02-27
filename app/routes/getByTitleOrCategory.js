const aws = require('aws-sdk');

const getByTitleOrCategory = (fastifyInstance) => {
  fastifyInstance.get('/getByTitleOrCategory', async (request, reply) => {
    await fastifyInstance.log.info('Send the response');

    const title = request.query.title;
    const category = request.query.category;

    let dynamoConfig = {
        region: 'eu-west-1',
        endpoint: 'http://dynamodb:8000'
      };
      
      const documentClient = new aws.DynamoDB.DocumentClient(dynamoConfig);

      fastifyInstance.log.info('Getting Books Categories Data from DynamoDB');


    const params = {
        TableName: 'CbLibrary01Table',
        IndexName: 'TitleCategoryIndex',
        FilterExpression: "(attribute_not_exists(#title) OR contains(#title, :title)) AND contains(#category, :category)",
        ExpressionAttributeNames: {
            "#title": "Title",
            "#category": "Category"
        },
        ExpressionAttributeValues: {
            ":title": title,
            ":category": category
        }
      };
      
      


    documentClient.scan(params, function(err, data) {
        if (err) {
        console.log(err);
        } else {
        console.log(data.Items);
            
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

module.exports = getByTitleOrCategory;
