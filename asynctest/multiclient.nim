import net, threadpool, times
{.experimental.}

const NL = chr(13) & chr(10)

proc newTask(task:int) = 
  var socket = newSocket()
  socket.connect("127.0.0.1",Port(11213))
  for i in 1..1000000:
    let resp = $task & ":" & $i & NL
    socket.send(resp)
    let res = socket.recv(800)
    #echo $resp,$res
  socket.send("quit")
  socket.close()

proc main()=
  echo "start"
  var t = toSeconds(getTime())
  parallel:
    for i in 1..1:
      spawn newTask(i)
  echo "end"
  echo "Read time [s] ", $(toSeconds(getTime()) - t)    

main()