with open("./le_petit_prince.txt", "r") as f:
    for line in f.readlines():
        line = line.strip().split()
        i =  len(line) - 1
        while i > 0:
            if line[i] in {"un", "une", "des", "le", "la", "les", "ton", "ta", "ma", "mon", "mes", "tes", "leur", "leurs", "quel", "vos", "votre", "nos", "notre", "quelle", "quels", "quelles"} and i < len(line) + 1:
                print(line[i], line[i + 1])
            i -= 1
                
