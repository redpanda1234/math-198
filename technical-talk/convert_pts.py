import re

def pgf_string(mathematica_pts_string):
    pgf_str = "x y z\\\\\n"

    pgf_str += mathematica_pts_string.replace("},", "\\\\\n")
    pgf_str = pgf_str.replace("{", "")
    pgf_str = pgf_str.replace(",", " ")
    pgf_str = pgf_str.replace("}", "")

    pgf_str += "\\\\"

    with open("pgf_string.txt", "w") as f:
        f.write(pgf_str)
