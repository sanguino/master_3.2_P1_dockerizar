import { connect } from 'amqplib';
import DebugLib from 'debug';
import configHandler from '../clients/plannerNotificationHandler.js';

const debug = new DebugLib('server:amqp');

export let amqpChannel;

export async function connectAmqp() {
  
  const URL = `amqp://${process.env.RABBIT_USER}:${process.env.RABBIT_PASS}@${process.env.RABBIT_HOST}:${process.env.RABBIT_PORT}`;

  const conn = await connect(URL);
  amqpChannel = await conn.createChannel();
  
  configHandler(amqpChannel);

  process.on('exit', () => {
    amqpChannel.close();
    debug(`Closing rabbitmq channel`);
  });
}
