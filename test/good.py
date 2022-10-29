# These imports are properly sorted and should pass isort
import datetime
from dataclasses import dataclass


@dataclass()
class Foo:
    a: datetime.datetime

foo = Foo(a=datetime.datetime.now())

if __name__ == "__main__":
    print(foo)
