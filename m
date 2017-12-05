Content-Type: multipart/mixed; boundary="===============1105499204767589958=="
MIME-Version: 1.0
From: Tushar Dave <tushar.n.dave@oracle.com>
To: lkp@lists.01.org
Subject: Re: [e1000_shutdown] e1000 0000:00:03.0: disabling already-disabled device
Date: Wed, 06 Dec 2017 00:49:06 +0530
Message-ID: <fc82d5ac-5d3d-ff63-0fc6-bb99a847f0d6@oracle.com>
In-Reply-To: <20171204113357.ccc3anyrl3pn7yuj@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1105499204767589958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 12/04/2017 05:03 PM, Fengguang Wu wrote:
> Hi Tushar,
> =

> On Tue, Nov 28, 2017 at 01:01:23AM +0530, Tushar Dave wrote:
>>
>>
>> On 11/23/2017 04:43 AM, Fengguang Wu wrote:
>>> On Wed, Nov 22, 2017 at 03:40:52AM +0530, Tushar Dave wrote:
>>>>
>>>>
>>>> On 11/21/2017 06:11 PM, Fengguang Wu wrote:
>>>>> Hello,
>>>>>
>>>>> FYI this happens in mainline kernel 4.14.0-01330-g3c07399.
>>>>> It happens since 4.13 .
>>>>>
>>>>> It occurs in 3 out of 162 boots.
>>>>>
>>>>>
>>>>> [=C2=A0=C2=A0 44.637743] advantechwdt: Unexpected close, not stopping=
 watchdog!
>>>>> [=C2=A0=C2=A0 44.997548] input: ImExPS/2 Generic Explorer Mouse as
>>>>> /devices/platform/i8042/serio1/input/input6
>>>>> [=C2=A0=C2=A0 45.013419] e1000 0000:00:03.0: disabling already-disabl=
ed device
>>>>> [=C2=A0=C2=A0 45.013447] ------------[ cut here ]------------
>>>>> [=C2=A0=C2=A0 45.014868] WARNING: CPU: 1 PID: 71 at drivers/pci/pci.c=
:1641
>>>>> pci_disable_device+0xa1/0x105:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_d=
isable_device at drivers/pci/pci.c:1640
>>>>> [=C2=A0=C2=A0 45.016171] CPU: 1 PID: 71 Comm: rcu_perf_shutdo Not tai=
nted
>>>>> 4.14.0-01330-g3c07399 #1
>>>>> [=C2=A0=C2=A0 45.017197] task: ffff88011bee9e40 task.stack: ffffc9000=
0860000
>>>>> [=C2=A0=C2=A0 45.017987] RIP: 0010:pci_disable_device+0xa1/0x105:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_d=
isable_device at drivers/pci/pci.c:1640
>>>>> [=C2=A0=C2=A0 45.018603] RSP: 0000:ffffc90000863e30 EFLAGS: 00010286
>>>>> [=C2=A0=C2=A0 45.019282] RAX: 0000000000000035 RBX: ffff88013a230008 =
RCX:
>>>>> 0000000000000000
>>>>> [=C2=A0=C2=A0 45.020182] RDX: 0000000000000000 RSI: 0000000000000000 =
RDI:
>>>>> 0000000000000203
>>>>> [=C2=A0=C2=A0 45.021084] RBP: ffff88013a3f31e8 R08: 0000000000000001 =
R09:
>>>>> 0000000000000000
>>>>> [=C2=A0=C2=A0 45.021986] R10: ffffffff827ec29c R11: 0000000000000002 =
R12:
>>>>> 0000000000000001
>>>>> [=C2=A0=C2=A0 45.022946] R13: ffff88013a230008 R14: ffff880117802b20 =
R15:
>>>>> ffffc90000863e8f
>>>>> [=C2=A0=C2=A0 45.023842] FS:=C2=A0 0000000000000000(0000) GS:ffff8801=
3fd00000(0000)
>>>>> knlGS:0000000000000000
>>>>> [=C2=A0=C2=A0 45.024863] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 000000=
0080050033
>>>>> [=C2=A0=C2=A0 45.025583] CR2: ffffc900006d4000 CR3: 000000000220f000 =
CR4:
>>>>> 00000000000006a0
>>>>> [=C2=A0=C2=A0 45.026478] Call Trace:
>>>>> [=C2=A0=C2=A0 45.026811]=C2=A0 __e1000_shutdown+0x1d4/0x1e2:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __e10=
00_shutdown at
>>>>> drivers/net/ethernet/intel/e1000/e1000_main.c:5162
>>>>> [=C2=A0=C2=A0 45.027344]=C2=A0 ? rcu_perf_cleanup+0x2a1/0x2a1:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rcu_p=
erf_shutdown at kernel/rcu/rcuperf.c:627
>>>>> [=C2=A0=C2=A0 45.027883]=C2=A0 e1000_shutdown+0x14/0x3a:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e1000=
_shutdown at
>>>>> drivers/net/ethernet/intel/e1000/e1000_main.c:5235
>>>>> [=C2=A0=C2=A0 45.028351]=C2=A0 device_shutdown+0x110/0x1aa:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 devic=
e_shutdown at drivers/base/core.c:2807
>>>>> [=C2=A0=C2=A0 45.028858]=C2=A0 kernel_power_off+0x31/0x64:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kerne=
l_power_off at kernel/reboot.c:260
>>>>> [=C2=A0=C2=A0 45.029343]=C2=A0 rcu_perf_shutdown+0x9b/0xa7:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rcu_p=
erf_shutdown at kernel/rcu/rcuperf.c:637
>>>>> [=C2=A0=C2=A0 45.029852]=C2=A0 ? __wake_up_common_lock+0xa2/0xa2:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 autor=
emove_wake_function at
>>>>> kernel/sched/wait.c:376
>>>>> [=C2=A0=C2=A0 45.030414]=C2=A0 kthread+0x126/0x12e:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kthre=
ad at kernel/kthread.c:233
>>>>> [=C2=A0=C2=A0 45.030834]=C2=A0 ? __kthread_bind_mask+0x8e/0x8e:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kthre=
ad at kernel/kthread.c:190
>>>>> [=C2=A0=C2=A0 45.031399]=C2=A0 ? ret_from_fork+0x1f/0x30:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret_f=
rom_fork at arch/x86/entry/entry_64.S:443
>>>>> [=C2=A0=C2=A0 45.031883]=C2=A0 ? kernel_init+0xa/0xf5:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kerne=
l_init at init/main.c:997
>>>>> [=C2=A0=C2=A0 45.032325]=C2=A0 ret_from_fork+0x1f/0x30:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret_f=
rom_fork at arch/x86/entry/entry_64.S:443
>>>>> [=C2=A0=C2=A0 45.032777] Code: 00 48 85 ed 75 07 48 8b ab a8 00 00 00=
 48 8d bb
>>>>> 98 00 00 00 e8 aa d1 11 00 48 89 ea 48 89 c6 48 c7 c7 d8 e4 0b 82 e8
>>>>> 55 7d da ff <0f> ff b9 01 00 00 00 31 d2 be 01 00 00 00 48 c7 c7 f0
>>>>> b1 61 82
>>>>> [=C2=A0=C2=A0 45.035222] ---[ end trace c257137b1b1976ef ]---
>>>>> [=C2=A0=C2=A0 45.037838] ACPI: Preparing to enter system sleep state =
S5
>>>>>
>>>>> Attached the full dmesg, kconfig and reproduce scripts.
>>>> Looks like e1000 pci/pxi-x device is already suspended. And therefore
>>>> call to e1000_suspend() -> __e1000_shutdown() -> pci_disable_device()
>>>> already had disabled the device.
>>>> Disabling device again by e1000_shutdown handler during system shutdown
>>>> causes warning at drivers/pci/pci.c:1641.
>>>>
>>>> I think function __e1000_shutdown should just return if device is
>>>> already suspended!
>>>>
>>>> I don't have e1000 hardware to test right now. So if this seems logical
>>>> to others I will send a patch.
>>>
>>> Tushar, it happens on QEMU boot testing, so do not rely on e1000 HW.
>>> Unless you'd like to prevent regressions on real HW.
>>>
>>> The original report attached a reproduce script to run the QEMU test.
>>> Or you may send me the patch for testing.
>> Fengguang,
>>
>> Would you please try this patch and test. The patch is compile tested
>> only. The patch is similar to how ixgbe handled the issue.
>> Thanks.
>>
>> e1000: fix disabling already-disabled warning
>>
>> This patch adds check so that driver does not disable already
>> disabled device.
> =

> It works! I tried 100 boots and the "e1000 0000:00:03.0: disabling
> already-disabled device" error no longer show up.
> =

> Tested-by: Fengguang Wu <fengguang.wu@intel.com>
Fengguang,

Thanks for testing. I will send patch soon.

-Tushar
> =

> Thanks,
> Fengguang
> =

>> Signed-off-by: Tushar Dave <tushar.n.dave@oracle.com>
>> ---
>> =C2=A0drivers/net/ethernet/intel/e1000/e1000.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 3 ++-
>> =C2=A0drivers/net/ethernet/intel/e1000/e1000_main.c | 23 =

>> ++++++++++++++++++-----
>> =C2=A02 files changed, 20 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/intel/e1000/e1000.h
>> b/drivers/net/ethernet/intel/e1000/e1000.h
>> index d7bdea7..8fd2458 100644
>> --- a/drivers/net/ethernet/intel/e1000/e1000.h
>> +++ b/drivers/net/ethernet/intel/e1000/e1000.h
>> @@ -331,7 +331,8 @@ struct e1000_adapter {
>> =C2=A0enum e1000_state_t {
>> =C2=A0=C2=A0=C2=A0=C2=A0 __E1000_TESTING,
>> =C2=A0=C2=A0=C2=A0=C2=A0 __E1000_RESETTING,
>> -=C2=A0=C2=A0=C2=A0 __E1000_DOWN
>> +=C2=A0=C2=A0=C2=A0 __E1000_DOWN,
>> +=C2=A0=C2=A0=C2=A0 __E1000_DISABLED
>> =C2=A0};
>>
>> =C2=A0#undef pr_fmt
>> diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c
>> b/drivers/net/ethernet/intel/e1000/e1000_main.c
>> index 1982f79..a7de31d 100644
>> --- a/drivers/net/ethernet/intel/e1000/e1000_main.c
>> +++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
>> @@ -945,7 +945,7 @@ static int e1000_init_hw_struct(struct e1000_adapter
>> *adapter,
>> =C2=A0static int e1000_probe(struct pci_dev *pdev, const struct
>> pci_device_id *ent)
>> =C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0 struct net_device *netdev;
>> -=C2=A0=C2=A0=C2=A0 struct e1000_adapter *adapter;
>> +=C2=A0=C2=A0=C2=A0 struct e1000_adapter *adapter =3D NULL;
>> =C2=A0=C2=A0=C2=A0=C2=A0 struct e1000_hw *hw;
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 static int cards_found;
>> @@ -955,6 +955,7 @@ static int e1000_probe(struct pci_dev *pdev, const
>> struct pci_device_id *ent)
>> =C2=A0=C2=A0=C2=A0=C2=A0 u16 tmp =3D 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0 u16 eeprom_apme_mask =3D E1000_EEPROM_APME;
>> =C2=A0=C2=A0=C2=A0=C2=A0 int bars, need_ioport;
>> +=C2=A0=C2=A0=C2=A0 bool disable_dev =3D false;
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 /* do not allocate ioport bars when not needed =
*/
>> =C2=A0=C2=A0=C2=A0=C2=A0 need_ioport =3D e1000_is_need_ioport(pdev);
>> @@ -1259,11 +1260,13 @@ static int e1000_probe(struct pci_dev *pdev,
>> const struct pci_device_id *ent)
>> =C2=A0=C2=A0=C2=A0=C2=A0 iounmap(hw->ce4100_gbe_mdio_base_virt);
>> =C2=A0=C2=A0=C2=A0=C2=A0 iounmap(hw->hw_addr);
>> =C2=A0err_ioremap:
>> +=C2=A0=C2=A0=C2=A0 disable_dev =3D !test_and_set_bit(__E1000_DISABLED, =
&adapter->flags);
>> =C2=A0=C2=A0=C2=A0=C2=A0 free_netdev(netdev);
>> =C2=A0err_alloc_etherdev:
>> =C2=A0=C2=A0=C2=A0=C2=A0 pci_release_selected_regions(pdev, bars);
>> =C2=A0err_pci_reg:
>> -=C2=A0=C2=A0=C2=A0 pci_disable_device(pdev);
>> +=C2=A0=C2=A0=C2=A0 if (!adapter || disable_dev)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_disable_device(pdev);
>> =C2=A0=C2=A0=C2=A0=C2=A0 return err;
>> =C2=A0}
>>
>> @@ -1281,6 +1284,7 @@ static void e1000_remove(struct pci_dev *pdev)
>> =C2=A0=C2=A0=C2=A0=C2=A0 struct net_device *netdev =3D pci_get_drvdata(p=
dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0 struct e1000_adapter *adapter =3D netdev_priv(n=
etdev);
>> =C2=A0=C2=A0=C2=A0=C2=A0 struct e1000_hw *hw =3D &adapter->hw;
>> +=C2=A0=C2=A0=C2=A0 bool disable_dev;
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 e1000_down_and_stop(adapter);
>> =C2=A0=C2=A0=C2=A0=C2=A0 e1000_release_manageability(adapter);
>> @@ -1299,9 +1303,11 @@ static void e1000_remove(struct pci_dev *pdev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iounmap(hw->flash_addre=
ss);
>> =C2=A0=C2=A0=C2=A0=C2=A0 pci_release_selected_regions(pdev, adapter->bar=
s);
>>
>> +=C2=A0=C2=A0=C2=A0 disable_dev =3D !test_and_set_bit(__E1000_DISABLED, =
&adapter->flags);
>> =C2=A0=C2=A0=C2=A0=C2=A0 free_netdev(netdev);
>>
>> -=C2=A0=C2=A0=C2=A0 pci_disable_device(pdev);
>> +=C2=A0=C2=A0=C2=A0 if (disable_dev)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_disable_device(pdev);
>> =C2=A0}
>>
>> =C2=A0/**
>> @@ -5156,7 +5162,8 @@ static int __e1000_shutdown(struct pci_dev *pdev,
>> bool *enable_wake)
>> =C2=A0=C2=A0=C2=A0=C2=A0 if (netif_running(netdev))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e1000_free_irq(adapter);
>>
>> -=C2=A0=C2=A0=C2=A0 pci_disable_device(pdev);
>> +=C2=A0=C2=A0=C2=A0 if (!test_and_set_bit(__E1000_DISABLED, &adapter->fl=
ags))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_disable_device(pdev);
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0}
>> @@ -5200,6 +5207,8 @@ static int e1000_resume(struct pci_dev *pdev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("Cannot enable P=
CI device from suspend\n");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 smp_mb__before_atomic();
>> +=C2=A0=C2=A0=C2=A0 clear_bit(__E1000_DISABLED, &adapter->flags);
>> =C2=A0=C2=A0=C2=A0=C2=A0 pci_set_master(pdev);
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 pci_enable_wake(pdev, PCI_D3hot, 0);
>> @@ -5274,7 +5283,9 @@ static pci_ers_result_t
>> e1000_io_error_detected(struct pci_dev *pdev,
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 if (netif_running(netdev))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e1000_down(adapter);
>> -=C2=A0=C2=A0=C2=A0 pci_disable_device(pdev);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!test_and_set_bit(__E1000_DISABLED, &adapter->fl=
ags))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_disable_device(pdev);
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 /* Request a slot slot reset. */
>> =C2=A0=C2=A0=C2=A0=C2=A0 return PCI_ERS_RESULT_NEED_RESET;
>> @@ -5302,6 +5313,8 @@ static pci_ers_result_t e1000_io_slot_reset(struct
>> pci_dev *pdev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("Cannot re-enabl=
e PCI device after reset.\n");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PCI_ERS_RESULT_D=
ISCONNECT;
>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 smp_mb__before_atomic();
>> +=C2=A0=C2=A0=C2=A0 clear_bit(__E1000_DISABLED, &adapter->flags);
>> =C2=A0=C2=A0=C2=A0=C2=A0 pci_set_master(pdev);
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 pci_enable_wake(pdev, PCI_D3hot, 0);
>> -- =

>> 1.8.3.1
>>
>>
>> -Tushar
>>>
>>> Thanks,
>>> Fengguang
>>>
>>
>=20

--===============1105499204767589958==--

