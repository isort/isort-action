# These imports are improperly sorted and should fail isort
import time
from dataclasses import dataclass, field
import datetime

@dataclass()
class Foo:
    a: datetime.datetime

foo = Foo(a=datetime.datetime.now())

if __name__ == "__main__":
    print(foo)
