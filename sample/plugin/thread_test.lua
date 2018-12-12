-- �X���b�h�̃e�X�g

-- �X���b�hID
local thread_id = 0

-- loadplugin���ɌĂ΂��
function OnInit()
  -- �X���b�h�N��
  thread_id = coind.CreateThread("myThreadFunc")
end

-- unloadplugin���ɌĂ΂��
function OnTerm()
  -- �X���b�h�I���҂�
  coind.Join(thread_id)
end

-- �X���[�v
function sleep(s)
  local ntime = os.clock() + s
  repeat until os.clock() > ntime
end

-- �X���b�h�֐�
function myThreadFunc()
  sleep(1)
  ret, value = coind.getbalance()
  if ret == true then
    print(string.format("[MyThread] getbalance : %f", value))
  end

  sleep(1)
  ret, tx = coind.sendtoaddress("p8Dp8vHVuCWVY474j6CEiSAPaFh1bgznaw", 1)
  if ret == true then
    print(string.format("[MyThread] sendtoaddress tx: %s", tx))
  end

  sleep(1)
  ret, value = coind.getbalance()
  if ret == true then
    print(string.format("[MyThread] getbalance : %f", value))
  end

end
