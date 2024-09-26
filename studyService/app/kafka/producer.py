from aiokafka import AIOKafkaProducer
from app.kafka.config import Config


async def send_one(
    key: bytes,
    message: bytes,
):
    producer = AIOKafkaProducer(
        bootstrap_servers=Config.kafka.clusters[0].bootstrapServers
    )
    # Get cluster layout and initial topic/partition leadership information
    await producer.start()
    try:
        # Produce message
        await producer.send_and_wait(Config.kafka.clusters[0].topic, message, key=key)
    finally:
        # Wait for all pending messages to be delivered or expire.
        await producer.stop()
