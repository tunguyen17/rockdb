def main():
    relation_lst = ["info", "family_group", "hardness", "ima", "info", "local_info", "location"]

    filepath_dict = {k : "csv/" + k + ".csv" for k in relation_lst} 

    file = open(filepath_dict[info])



if __name__ == "__main__":
    main()
