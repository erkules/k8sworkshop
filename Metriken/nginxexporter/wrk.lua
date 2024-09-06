-- Initialize variables
local counter = 0
local query_rate = 10 -- Starting rate (queries per second)
local last_time = os.clock()

-- Function to adjust the rate every N seconds
function adjust_rate(duration)
  -- Adjust rate every 5 seconds
  if duration > 0 and (duration % 5) == 0 then
    query_rate = query_rate + 10
    print("New query rate: " .. query_rate)
  else
    if duration > 0 and (duration % 60) == 0 then
      query_rate = 1
      print("New query rate: " .. query_rate)
  else
      query_rate = query_rate +1
      print("New query rate: " .. query_rate)
  end
end

-- Request function is called repeatedly
request = function()
  -- Simulate dynamic rate adjustment
  local current_time = os.clock()
  local elapsed = current_time - last_time
  
  if elapsed >= 1 / query_rate then
    -- Increase the counter and reset the clock
    counter = counter + 1
    last_time = current_time
    
    -- Adjust rate based on counter (every 5 seconds)
    adjust_rate(counter)

    -- Return the HTTP request
    return wrk.format("GET", "/")
  end

  -- If not enough time has passed, skip the request to simulate delay
  return nil
end

