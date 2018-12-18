-- �}���`�X���b�h�̃T���v��
-- �X���b�h�Q���ォ����s����邪�A�X���b�h�P��Unlock�`Sleep�`Lock�̊ԂɃX���b�h�Q�̏������s���A�X���b�h�P����ɏI������B

-- �X���b�hID
local thread_1
local thread_2
local mutex

-- loadplugin���ɌĂ΂��
function OnInit()
  -- �~���[�e�b�N�X�쐬
  mutex = coind.CreateMutex()

  -- �X���b�h�N��
  thread_1 = coind.CreateThread("myThreadFunc1")
  coind.Sleep(10);
  thread_2 = coind.CreateThread("myThreadFunc2")
end


-- unloadplugin���ɌĂ΂��
function OnTerm()
  -- �X���b�h�I���҂�
  coind.Join(thread_1)
  coind.Join(thread_2)

  -- �~���[�e�b�N�X�폜
  cond.DeleteMutex(mutex)
end


----------------------------------------------------------------------------
-- �X���b�h�P
----------------------------------------------------------------------------
function myThreadFunc1()
  print("** Thread 1 Start **");

  coind.Lock(mutex);
    ret, value = coind.getbalance()
    if ret == true then
      print(string.format("  [Thread1] getbalance : %f", value))
    end
    coind.Sleep(1000);
  coind.Unlock(mutex);

  coind.Sleep(1000);

  coind.Lock(mutex);
    ret, value = coind.getbalance()
    if ret == true then
      print(string.format("  [Thread1] getbalance : %f", value))
    end
  coind.Unlock(mutex);

  print("** Thread 1 end **");
end

----------------------------------------------------------------------------
-- �X���b�h�Q
----------------------------------------------------------------------------
function myThreadFunc2()
  print("** Thread 2 Start **");

  coind.Lock(mutex);
    ret, tx = coind.sendtoaddress("p8Dp8vHVuCWVY474j6CEiSAPaFh1bgznaw", 1)
    if ret == true then
      print(string.format("  [Thread2] sendtoaddress tx: %s", tx))
    end
  coind.Unlock(mutex);

  print("** Thread 2 end **");
end

