## Задача №1:
#
# Джон Макклейн пытается найти этаж на котором заложена бомба и у него есть список инструкций (в файле data/1.txt):
#
# (- Джон должен подняться на этаж выше
# ) - Джон должен опуститься на этаж ниже
#
# Поиск начинается с нулевого этажа. 
#
# На каком этаже находится бомба?
#
## Требования к решению:
# - Входные данные находятся в файле data/1.txt
# - Результат должен быть выведен в консоль командой puts
#
#
## Решение:

def problem1
  file = File.new("C:/Users/Динара/github/SP-test-assignment-4-armidsinner/data/1.txt","r:UTF-8")
  content = file.read
  elements = content.split(//)
  count = 0

  for item in elements do
    if item == ")"
      count += 1
    end
    if item == "("
      count -= 1
    end
  end
  puts(count)
end

problem1
