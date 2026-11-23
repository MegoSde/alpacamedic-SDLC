import subprocess


def lookup_patient(username: str):
    return subprocess.run(
        "echo " + username,
        shell=False,
        capture_output=True,
        text=True,
    )
