"""
Create a new snapshot with provided source code
Analyze the created snapshot
Show results of anaylisis

You must have a valid token and valid repository id before executing this process
"""
import os
import requests
import traceback
import typer

app = typer.Typer()


@app.command()
def run_anaylisis(test_machine_api_url: str, repository_id: int, source: str):
    print(f"TM action: run_anaylisis test_machine_api_url {test_machine_api_url}, repository id [{repository_id}], source {source}")

    TM_TOKEN = os.getenv("TM_TOKEN")

    try:
        # upload sol file(s) to study into a snapshot
        url = f"{test_machine_api_url}/repositories/{repository_id}/snapshots"
        files = {"files": open(source, "rb")}
        headers = {"Authorization": f"Bearer {TM_TOKEN}"}
        resp = requests.post(url, headers=headers, files=files)
        # print(f"resp.status_code {resp.status_code}")
        if resp.status_code >= 200 and resp.status_code <= 201:
            response_dict = resp.json()
            snapshot_id = response_dict.get("id")
            print(f"TM: generated snapshot id: {snapshot_id}")

            # ask TestMachine to analyze the file(s) inside the snapshot
            url = f"{test_machine_api_url}/snapshots/{snapshot_id}/analyses"
            request_body = {"tools": ["slither"]}
            headers = {"Authorization": f"Bearer {TM_TOKEN}"}
            resp = requests.post(url, json=request_body, headers=headers)
            if resp.status_code >= 200 and resp.status_code <= 201:
                print("TM: result from analyses")
                print(resp.json())
    except:
        traceback.print_exc()


if __name__ == "__main__":
    app()
