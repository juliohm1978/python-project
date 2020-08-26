import logging
import argh

logging.basicConfig(level="INFO", format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')
log = logging.getLogger(__name__)

def main(
    arg1: str = 'hello',
    arg2: str = 'world'
    ):

    log.info(f"{arg1} {arg2}")

if __name__ == "__main__":
    argh.dispatch_command(main)
