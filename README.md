# Dojo Hive


## About <a name = "about"></a>

This repository contains the reference files for an introductory coding dojo about Apache Hive presented by me. The dojo is given in a Kata format.

## Getting Started <a name = "getting_started"></a>

The structure of this repository is as follows:

### The `mapreduce-python` subrepository

```
📦mapreduce-python-example
 ┣ 📜client.py
 ┣ 📜mapper.py
 ┣ 📜reducer.py
 ┗ 📜sales.csv
```

Contains the files as example of a MapReduce job implemented in Python where:

- `client.py`: is the client code which will run to make the request to the Map and Reduce parts.
- `mapper.py`: file containing the Map part for the given problem.
- `reducer.py`: file containing the Reduce part for the given problem.
- `sales.csv`: file containing a sample data to be consumed by the Python MapReduce job.

### The `queries` subrepository

```
📦queries
 ┣ 📜create_tables_populate.sql
 ┣ 📜cube_client_case.sql
 ┣ 📜cube_client_map.sql
 ┣ 📜tmp_client_purchase_case.sql
 ┗ 📜tmp_client_purchase_map.sql
```

- `create_tables_populate.sql`: create the tables needed for this Dojo and populate them.
- `cube_client_case.sql`: creates a simple OLAP cube proposed. Uses `case-when` strategy to pivot data.
- `cube_client_map.sql`: creates a simple OLAP cube proposed. Uses `map` strategy to pivot data.
- `tmp_client_purchase_case.sql`: temporary table of `case-when` strategy.
- `tmp_client_purchase_map.sql`: temporary table of `map` strategy.

The content of the files presented above can be executed on [Demo Hue](https://demo.gethue.com/hue/accounts/login?next=/) website.

### The `explain` subrepository

This repository contains the files with information from the output of the following command

```
explain <content of tmp_client_urchase or cube_client file>;
```

The goal is compare both strategies to conclude which one is better in the performance point of view.

