
```bash
→ ~  architecture=$(lscpu | grep "Architecture" | awk -F': ' '{gsub(/^ +| +$/, "",$2); print $2}')
→ ~  corePsocket=$(lscpu | grep "Core(s) per socket" | awk -F':' '{gsub(/^ +| +$/, "",$2);print $2}')
→ ~  socket=$(lscpu | grep "Socket(s)" | awk -F':' '{gsub(/^ +| +$/, "",$2);print $2}')
→ ~  model=$(lscpu | grep "Model name" | awk -F':' '{gsub(/^ +| +$/, "",$2);print $2}')
→ ~  echo "Architecture: ${architecture}, Cores: $((${corePsocket}*${socket})), Model: ${model}"

Architecture: x86_64, Cores: 4, Model: Intel(R) Core(TM) i7-8650U CPU @ 1.90GHz
```


