from fastapi import FastAPI

app = FastAPI(title="AlpacaMedic Receptionist", version="0.1.0")


@app.middleware("http")
async def security_headers(request, call_next):
    response = await call_next(request)
    response.headers["X-Content-Type-Options"] = "nosniff"
    response.headers["Cross-Origin-Resource-Policy"] = "same-origin"
    return response


@app.get("/health")
def health():
    return {"status": "ok"}
