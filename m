Content-Type: multipart/mixed; boundary="===============0850219773758923222=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [list] 8052ce2d97: WARNING: CPU: 0 PID: 1 at lib/list_debug.c:60 __list_del_entry+0x4d/0x71
Date: Tue, 06 Sep 2016 11:49:04 -0400
Message-ID: <CAGXu5j+9N01cJNQK+9XKiyjxAxoHLDL-HVFtpH8nCR9u=DTvqg@mail.gmail.com>
In-Reply-To: <20160904094851.GM3663@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0850219773758923222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 4, 2016 at 5:48 AM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Sun, Sep 04, 2016 at 08:35:40AM +0800, kernel test robot wrote:
>>
>> FYI, we noticed the following commit:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git de=
v.2016.08.19a
>> commit 8052ce2d9771ab5a818307f3abbaf33bba82a631 ("list: Split list_add()=
 debug checking into separate function")
>>
>> in testcase: boot
>>
>> on test machine: qemu-system-i386 -enable-kvm -m 360M
>>
>> caused below changes:
>
> Hello, Kees,
>
> Looks like your change might have actually found a bug.  ;-)
>
> How would you like to handle this?

We should fix the bug! :)

>
>                                                         Thanx, Paul
>
>> +------------------------------------------------------------+----------=
--+------------+
>> |                                                            | 0a33d912a=
3 | 8052ce2d97 |
>> +------------------------------------------------------------+----------=
--+------------+
>> | boot_successes                                             | 0        =
  | 0          |
>> | boot_failures                                              | 211      =
  | 18         |
>> | WARNING:at_lib/list_debug.c:#__list_del_entry              | 211      =
  | 18         |
>> | calltrace:init                                             | 209      =
  | 18         |
>> | WARNING:at_lib/list_debug.c:#__list_add                    | 209      =
  |            |
>> | calltrace:i8042_init                                       | 209      =
  | 17         |
>> | calltrace:SyS_reboot                                       | 192      =
  | 4          |
>> | EIP_is_at__mutex_unlock_slowpath                           | 29       =
  |            |
>> | Kernel_panic-not_syncing:softlockup:hung_tasks             | 138      =
  |            |
>> | BUG:workqueue_lockup-pool_cpus=3D#flags=3D#nice=3D#stuck_for#s   | 56 =
        |            |
>> | EIP_is_at_lock_release                                     | 7        =
  |            |
>> | EIP_is_at_lock_acquire                                     | 28       =
  |            |
>> | EIP_is_at_raw_spin_unlock_irq                              | 30       =
  |            |
>> | EIP_is_at_mutex_lock_nested                                | 21       =
  |            |
>> | EIP_is_at_lock_is_held                                     | 10       =
  |            |
>> | EIP_is_at_device_shutdown                                  | 3        =
  |            |
>> | EIP_is_at___might_sleep                                    | 5        =
  |            |
>> | EIP_is_at__list_del_entry                                  | 4        =
  | 1          |
>> | EIP_is_at_get_device                                       | 1        =
  |            |
>> | BUG:unable_to_handle_kernel                                | 7        =
  | 5          |
>> | Oops                                                       | 7        =
  | 5          |
>> | calltrace:SyS_ipc                                          | 4        =
  | 4          |
>> | Kernel_panic-not_syncing:Fatal_exception                   | 7        =
  | 5          |
>> | EIP_is_at_pm_runtime_barrier                               | 1        =
  |            |
>> | EIP_is_at_lock_acquired                                    | 1        =
  |            |
>> | EIP_is_at__might_sleep                                     | 1        =
  |            |
>> | BUG:workqueue_lockup-pool_cpus=3D#-#flags=3D#nice=3D#stuck_for#s | 1  =
        |            |
>> | WARNING:at_arch/x86/mm/dump_pagetables.c:#note_page        | 26       =
  |            |
>> | calltrace:mark_rodata_ro                                   | 26       =
  |            |
>> | WARNING:at_lib/list_debug.c:#__list_add_valid              | 0        =
  | 17         |
>> | calltrace:serio_handle_event                               | 0        =
  | 17         |
>> | calltrace:userio_misc_init                                 | 0        =
  | 17         |
>> | calltrace:mousedev_init                                    | 0        =
  | 17         |
>> | calltrace:evdev_init                                       | 0        =
  | 17         |
>> | calltrace:cmos_init                                        | 0        =
  | 17         |
>> | calltrace:test_init                                        | 0        =
  | 17         |
>> | calltrace:pca_isa_driver_init                              | 0        =
  | 17         |
>> | calltrace:vim2m_init                                       | 0        =
  | 17         |
>> | calltrace:fm_drv_init                                      | 0        =
  | 17         |
>> | calltrace:test_power_init                                  | 0        =
  | 17         |
>> | calltrace:raid#_init                                       | 0        =
  | 17         |
>> | calltrace:dm_init                                          | 0        =
  | 17         |
>> | calltrace:vhci_init                                        | 0        =
  | 17         |
>> | calltrace:dcdrbu_init                                      | 0        =
  | 17         |
>> | calltrace:dcdbas_init                                      | 0        =
  | 17         |
>> | calltrace:uhid_init                                        | 0        =
  | 17         |
>> | calltrace:vhost_net_init                                   | 0        =
  | 17         |
>> | calltrace:dummy_stm_init                                   | 0        =
  | 17         |
>> | calltrace:stm_heartbeat_init                               | 0        =
  | 17         |
>> | calltrace:binder_init                                      | 0        =
  | 17         |
>> | calltrace:teql_init                                        | 0        =
  | 17         |
>> | calltrace:ipip_init                                        | 0        =
  | 17         |
>> | calltrace:ipgre_init                                       | 0        =
  | 17         |
>> | calltrace:sit_init                                         | 0        =
  | 17         |
>> | calltrace:ip6_tunnel_init                                  | 0        =
  | 17         |
>> | calltrace:ip6gre_init                                      | 0        =
  | 17         |
>> | calltrace:irlan_init                                       | 0        =
  | 17         |
>> | calltrace:pm_qos_power_init                                | 0        =
  | 17         |
>> | calltrace:ubi_init                                         | 0        =
  | 17         |
>> | calltrace:SyS_setsockopt                                   | 0        =
  | 2          |
>> | calltrace:SyS_socketcall                                   | 0        =
  | 2          |
>> | WARNING:at_include/linux/kref.h:#kobject_get               | 0        =
  | 4          |
>> | WARNING:at_kernel/locking/lockdep.c:#__lock_acquire        | 0        =
  | 4          |
>> | BUG:kernel_hang_in_test_stage                              | 0        =
  | 4          |
>> | calltrace:fw_cfg_sysfs_init                                | 0        =
  | 7          |
>> +------------------------------------------------------------+----------=
--+------------+
>>
>>
>>
>> [  152.680291] g_acm_ms usbip-vudc.0: failed to start g_acm_ms: -22
>> [  152.689209] usbip-vudc: probe of usbip-vudc.0 failed with error -22
>> [  152.698509] ------------[ cut here ]------------
>> [  152.709786] WARNING: CPU: 0 PID: 1 at lib/list_debug.c:60 __list_del_=
entry+0x4d/0x71
>> [  152.722785] list_del corruption. next->prev should be cc0230d4, but w=
as 6b6b6b6b

That's the poison value, so this is a remove-after-remove bug?

>> [  152.732828] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.8.0-rc1-00033=
-g8052ce2 #1
>> [  152.742576] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS Debian-1.8.2-1 04/01/2014
>> [  152.754081]  00000000 00200246 c0033e78 c13c456b c0033ea4 c13e72ac c0=
033e90 c103fd02
>> [  152.765720]  0000003c 6b6b6b6b cc0230d4 cc02300c c0033eac c103fd41 00=
000009 00000000
>> [  152.776864]  c0033ea4 c1f7bc14 c0033ec0 c0033ecc c13e72ac c1f7bace 00=
00003c c1f7bc14
>> [  152.788472] Call Trace:
>> [  152.791964]  [<c13c456b>] dump_stack+0x75/0xa9
>> [  152.797835]  [<c13e72ac>] ? __list_del_entry+0x4d/0x71
>> [  152.804221]  [<c103fd02>] __warn+0xad/0xc4
>> [  152.809694]  [<c103fd41>] warn_slowpath_fmt+0x28/0x2d
>> [  152.816501]  [<c13e72ac>] __list_del_entry+0x4d/0x71
>> [  152.822946]  [<c15027a8>] device_pm_remove+0x2b/0x5a
>> [  152.829560]  [<c14f6317>] device_del+0x134/0x19a
>> [  152.835558]  [<c14f5c38>] ? dev_set_name+0x14/0x16
>> [  152.842135]  [<c14f9d7c>] platform_device_del+0x16/0x5d
>> [  152.848909]  [<c2207515>] init+0xe5/0x112
>> [  152.854149]  [<c2207430>] ? usbip_host_init+0xe5/0xe5

What device is this? Looks like it's being removed right at init time??

>> [  152.860796]  [<c21cec35>] do_one_initcall+0x7e/0x101
>> [  152.867316]  [<c10564b7>] ? parse_args+0x190/0x265
>> [  152.873497]  [<c21ced88>] ? kernel_init_freeable+0xd0/0x174
>> [  152.880923]  [<c21ceda4>] kernel_init_freeable+0xec/0x174
>> [  152.887499]  [<c1be421b>] kernel_init+0x8/0xd0
>> [  152.893658]  [<c1bec3ae>] ret_from_kernel_thread+0xe/0x30
>> [  152.900759]  [<c1be4213>] ? rest_init+0x111/0x111
>> [  152.907334] ---[ end trace 2003739b08d25430 ]---
>> [  152.920040] ------------[ cut here ]------------

-Kees


-- =

Kees Cook
Nexus Security

--===============0850219773758923222==--

