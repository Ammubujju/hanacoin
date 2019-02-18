-- �����R�}���h�e�X�g
-- �e�X�g�̍ۂ͈ȉ��̃A�h���X�����������ĉ�����

-- sendfrom�e�X�g
function test_sendfrom()
  print("test_sendfrom:")

  ret, tx = coind.sendfrom("testaccount", "p8Dp8vHVuCWVY474j6CEiSAPaFh1bgznaw", 1)
  if ret == true then
    print(string.format("  tx: %s", tx))
  end
end


-- sendmany �e�X�g
function test_sendmany()
  print("test_sendmany:")

  amounts = {p6Fy4dfgLHMuvyLvVLRBdKMobGEuNo9YTc = 1.0, p8Dp8vHVuCWVY474j6CEiSAPaFh1bgznaw = 1.0}
  amounts_json = cjson.encode(amounts)
  ret, tx = coind.sendmany("", amounts_json)
  if ret == true then
    print(string.format("  tx: %s", tx))
  end
end


-- sendtoaddress �e�X�g
function test_sendtoaddress()
  print("test_sendtoaddress:")

  -- �����ȗ���OK
  ret, tx = coind.sendtoaddress("p8Dp8vHVuCWVY474j6CEiSAPaFh1bgznaw", 1)
  -- ret, tx = coind.sendtoaddress("p8Dp8vHVuCWVY474j6CEiSAPaFh1bgznaw", 1, "comment", "comment_to", false, true, 2, "UNSET")

  if ret == true then
    print(string.format("  tx: %s", tx))
  end
end


-- loadplugin���ɌĂ΂��
function OnInit()
  -- �ǂꂩ�K����
  test_sendfrom()
  -- test_sendmany()
  -- test_sendtoaddress()
end


-- ����������OnWalletNotify����������
-- �E�H���b�g�g�����U�N�V�����ʒm�i�ȗ��j
function OnWalletNotify(txid)
  print(string.format("WalletNotiry:%s", os.date()))
  print(string.format("  Txid:%s", txid))

  ret, value = coind.gettransaction(txid)
  if ret == true then
     print(string.format("  blockhash:%s", value["blockhash"]))
     print(string.format("  blockindex:%s", value["blockindex"]))
     for i, val in pairs(value["details"]) do
       print(string.format("  [%s] address:%s  amount:%f", val["category"], val["address"], val["amount"]))
     end
  end
end
