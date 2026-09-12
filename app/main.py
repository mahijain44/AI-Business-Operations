from fastapi import FastAPI
from app.api.routes import data

from app.api.routes import data, agent

app = FastAPI(
    title="AI Business Operations Agent",
    description="AI-powered business operations backend",
    version="1.0.0"
)
app.include_router(data.router)

app.include_router(agent.router)
@app.get("/")
def root():
    return{
        "meeassage"
    }

@app.get("/health")
def health_check():
    return{
        "good"
    }

@app.get("/hlth")
def health_check():
    return{
        "good"
    }