from random import randint

class testcellphone(object):

   def cell_no(self):
       prefix = ['061']
       suffix = [];
       for i in range(1):
           suffix.append(str(randint(1000000,9999999)));

       cellnumber = []
       for p in prefix:
           for s in suffix:
               cellnumber.append(p+s)

       return cellnumber[0]
       


if __name__ == '__main__':
    new_number = testcellphone()
    number = new_number.cell_no()
    print(number)
##    file = open('cellnumbers.txt','a')
##    file.write(str(number)+'\n')
##    file.close()
