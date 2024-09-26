import yaml
from pydantic import BaseModel


class Metrics(BaseModel):
    port: int
    type: str


class ClusterConfig(BaseModel):
    name: str
    bootstrapServers: str
    schemaRegistry: str
    topic: str
    metrics: Metrics


class Clusters(BaseModel):
    clusters: list[ClusterConfig]


class KafkaConfig(BaseModel):
    kafka: Clusters


Config: KafkaConfig

try:
    with open("kui/config.yaml", "r") as file:
        Config = KafkaConfig(**yaml.safe_load(file))
except FileNotFoundError:
    raise FileNotFoundError("Kafka config not found") from None


