from operator import itemgetter

def shuffler(mapper_list: list) -> list:
    return sorted(mapper_list, key=itemgetter(0))

def reducer(input_list: list) -> dict:
    reducer_dictionary = {}
    sorted_list = shuffler(input_list)
    for item in sorted_list:
        product, quantity = item
        reducer_dictionary[product] = reducer_dictionary.get(product, 0) + quantity
    return reducer_dictionary