class db_obj_dummy:
    def __init__(self, value):
        self.value = value

    def scalars(self):
        return self

    def all(self):
        return self.value

    def first(self):
        return self.value
