from fastapi import APIRouter, UploadFile, File

router = APIRouter(
    prefix="/data",
    tags=["Data"]
)


@router.get("/")
def get_data():
    return {
        "message": "Business data API is working"
    }


@router.post("/upload")
async def upload_data(file: UploadFile = File(...)):
    return {
        "filename": file.filename,
        "message": "File uploaded successfully"
    }