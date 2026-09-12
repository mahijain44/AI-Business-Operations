from fastapi import APIRouter
from pydantic import BaseModel

router = APIRouter(
    prefix="/agent",
    tags=["Agent"]
)


class AnalyzeRequest(BaseModel):
    question: str


@router.post("/analyze")
def analyze_business(request: AnalyzeRequest):
    return {
        "question": request.question,
        "issue": "Sample business issue",
        "reason": "Sample reason",
        "recommendation": "Sample recommendation"
    }