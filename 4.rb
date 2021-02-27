## Задача №4:
#
# В соседнем районе рождественские эльфы готовят подарки для жителей города.
# Для каждого подарка (файл data/4.txt) нужно найти сколько оберточной бумаги потребуется.
# Формула рассчета: 2*ш*д + 2*д*в + 2*в*ш + площадь наименьшей стороны
# Например, на подарок размером 2х3х4 требуется 2*6 + 2*12 + 2*8 = 52 + 6 кв. см.
#
# Сколько всего оберточной бумаги нужно купить эльфам?
#
## Требования к решению:
# - Входные данные находятся в файле data/4.txt
# - В значениях данные длины, ширины и высоты не упорядочены и могут идти в любом порядке, однако
# длина всегда наименьшее число из трех, высота - среднее, ширина - самое большое.
# - Результат должен быть выведен в консоль командой puts
#
#
## Решение:
lines = IO.readlines("data/4.txt")
smallest = 0
needed = 0
for i in (0..(lines.length-1))
  parameters = lines[i].split(/x/).map(&:to_i)
  length = parameters.min
  width = parameters.max
  lw=[length, width ]
  if parameters.detect{ |e| parameters.count(e) > 1 } == nil
    parameters=parameters-lw
    height = parameters[0]
    height_width = height * width
    height_length = height * length
    length_width = length * width
    if height_width <= height_length and height_width <= length_width
      smallest = height_width
    end
    if height_length <= height_width and height_length <= length_width
      smallest = height_length
    end
    if length_width <= height_length and length_width <= height_width
      smallest = length_width
    end
    needed = needed + 2*width*length + 2*length*height + 2*height*width + smallest
  else
    height =  parameters.detect{ |e| parameters.count(e) > 1 }
    height_width = height * width
    height_length = height * length
    length_width = length * width
    if height_width <= height_length and height_width <= length_width
      smallest = height_width
    end
    if height_length <= height_width and height_length <= length_width
      smallest = height_length
    end
    if length_width <= height_length and length_width <= height_width
      smallest = length_width
    end
    needed = needed + 2*width*length + 2*length*height + 2*height*width + smallest
  end
end
puts needed
