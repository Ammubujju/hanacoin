-- ���̑��֐�

-- IsInitialBlockDownload �e�X�g
function test_IsInitialBlockDownload()
  print("test_IsInitialBlockDownload:")

  print(string.format("  Initial Sync: %s", initialsync and "true" or "false"))
end


-- getaccunt �e�X�g
function test_getaccount()
  print("test_getaccount:")

  ret, account = coind.getaccount("p6Fy4dfgLHMuvyLvVLRBdKMobGEuNo9YTc")
  if ret == true then
    print(string.format("  account: %s", account))
  else
    print("error")
  end
end

-- getaddressesbyaccount �e�X�g
function test_getaddressesbyaccount()
  print("test_getaddressesbyaccount:")

  ret, value = coind.getaddressesbyaccount("testaccount")
  for i,addr in pairs(value) do
    print(string.format("  address: %s", addr))
  end
end


-- loadplugin���ɌĂ΂��
function OnInit()
  test_IsInitialBlockDownload()
  test_getaccount()
  test_getaddressesbyaccount()
end

