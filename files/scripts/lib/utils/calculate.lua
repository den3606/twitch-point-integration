function secondToFrame(second)
  return second * 60
end

function frameToSecond(frame)
  return math.floor(frame / 60)
end


function calcRadius(origin_x, origin_y, point_x, point_y)
  return math.sqrt((origin_x - point_x) ^ 2 + (origin_y - point_y) ^ 2)
end
