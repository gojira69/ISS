# # file = open('random.txt','r')
# # # for each in file:
# # #     print(each)
# # print(file.read(100))

# # file1 = open('random_text.txt','w')
# # file1.write("This text is in another file")
# # print(file1.read())

# # def search_string(path, word):
# #     with open(path,'r') as file:
# #     content = file.read()
# #     if word in content:
# #         print('string exists')
# #     else:
# #         print('string does not exist')
# #     # file.close()


# # word = input("Input the word for searching")
# # search_string(r'C:\Users\Harsha\OneDrive\Desktop\ISS\python\random.txt', 'word')
# # f.readline(25)


# # print(f.readline(4))
# # with open('random.txt','r') as f:
# # f.write("Hello World!!")
# # f.close()


# # def search_str(file_path, word):
# #     with open(file_path, 'r') as file:
# #         # read all content of a file
# #         content = file.read()
# #         # check if string present in a file
# #         if word in content:
# #             print('string exists in the file')
# #         else:
# #             print('string does not exist in the file')

# # search_str(r'C:\Users\Harsha\OneDrive\Desktop\ISS\python\random.txt', 'I')


# with open('random.txt', 'r') as r:
#     for line in sorted(r):
#         print(line, end='')


with open(r"C:\Users\Harsha\OneDrive\Desktop\ISS\python\random.txt",'r') as fp:
    for l_no, line in enumerate(fp):
        if 'your' in line:
            print('string found in a file')
            print('Line Number: ',l_no)
            print('Line: ',line)
            break