import mapper
import reducer

def main():
    mapper_list = mapper.mapper('./sales.csv')
    reducer_values = reducer.reducer(mapper_list)
    print(reducer_values)

if __name__ == '__main__':
    main()
