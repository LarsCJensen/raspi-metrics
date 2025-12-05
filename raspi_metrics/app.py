from fastapi import FastAPI
import psutil

app = FastAPI()


@app.get("/metrics")
def metrics():
    return {
        "cpu_percent": psutil.cpu_percent(interval=0.5),
        "memory_percent": psutil.virtual_memory().percent,
        "disk_percent": psutil.disk_usage("/").percent,
        "temperature": {
            name: [t.current for t in temps]
            for name, temps in psutil.sensors_temperatures().items()
        },
    }
