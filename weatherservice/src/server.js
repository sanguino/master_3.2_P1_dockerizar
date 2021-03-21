const grpc = require('grpc');
const WeatherService = require('./interface');
const weatherServiceImpl = require('./weatherService');

const server = new grpc.Server();

server.addService(WeatherService.service, weatherServiceImpl);

const path = `${process.env.WEATHER_HOST}:${process.env.WEATHER_PORT}`;

server.bind(path, grpc.ServerCredentials.createInsecure());

console.log(`gRPC server running at ${path}`);

server.start();