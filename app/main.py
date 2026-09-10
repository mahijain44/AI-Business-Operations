from fastapi import FastAPI

app = FastAPI(
    title="AI Business Operations Agent",
    description="AI-powered business operations backend",
    version="1.0.0"
)

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