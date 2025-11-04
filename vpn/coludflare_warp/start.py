import subprocess
import time

def run_cmd(cmd, check=False, suppress_output=False):
    try:
        if suppress_output:
            return subprocess.run(cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=check)
        else:
            return subprocess.run(cmd, capture_output=True, text=True, check=check)
    except subprocess.CalledProcessError as e:
        return e



def is_registered():
    result = run_cmd(["warp-cli", "account"], suppress_output=True)
    return result.returncode == 0

def register_warp():
    print("Registering new WARP client...")
    result = run_cmd(["warp-cli", "registration", "new"], check=True)
    print("Registration successful.")





def connect_warp():
    print("Connecting to Cloudflare WARP...")
    run_cmd(["warp-cli", "connect"], check=True)

def get_warp_status():
    result = run_cmd(["warp-cli", "status"])
    for line in result.stdout.splitlines():
        if line.startswith("Status"):
            return line.split(":")[1].strip()
    return "Unknown"

def wait_until_connected():
    print("Waiting for WARP to connect...")
    while True:
        status = get_warp_status()
        print(f"Current status: {status}")
        if status.lower() == "connected":
            print("WARP is now connected.")
            break
        time.sleep(5)

def main():
    if is_registered():
        print("WARP client is already registered.")
    else:
        register_warp()

    connect_warp()
    wait_until_connected()

if __name__ == "__main__":
    main()
