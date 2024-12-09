with open("./le_petit_prince.txt", "r") as f:
    for line in f.readlines():
        line = line.strip().split()
        for word in line:
            if word[-6:-1] == "ement":
                print(word)
