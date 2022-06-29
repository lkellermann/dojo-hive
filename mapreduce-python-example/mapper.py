def read_input(file_path: str):
    with open(file_path, 'r') as f:
        lines = f.readlines()
        data = [line.rstrip().split(',') for line in lines]
    return data

def mapper(file_path: str):
    data = read_input(file_path)

    mapper_list = []
    for i, v in enumerate(data):
        if i > 0:
            mapper_list.append([v[2], int(v[3])])
    return mapper_list