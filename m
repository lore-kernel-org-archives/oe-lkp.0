Content-Type: multipart/mixed; boundary="===============7456959124614446614=="
MIME-Version: 1.0
From: Oliver Urbann <oliver.urbann@gmail.com>
To: lkp@lists.01.org
Subject: Re: [dmaengine] fe364a7d95: UBSAN:array-index-out-of-bounds_in_drivers/acpi/acpica/dswexec.c
Date: Sat, 09 Oct 2021 23:56:20 +0200
Message-ID: <246a5a73-6b85-98b3-3830-cfc46030c044@gmail.com>
In-Reply-To: <20210918150130.GA30982@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7456959124614446614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

this actually crashes s2idle e.g. on Surface Book 1 and Surface Pro 4:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[=C2=A0 294.673738] UBSAN: array-index-out-of-bounds in =

drivers/acpi/acpica/dswexec.c:401:12
[=C2=A0 294.673748] index -1 is out of range for type 'acpi_operand_object =
*[9]'
[=C2=A0 294.673755] CPU: 3 PID: 6477 Comm: systemd-sleep Tainted: G=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =

C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.14.9-surface-ubsan-test #1
[=C2=A0 294.673762] Hardware name: Microsoft Corporation Surface Book/Surfa=
ce =

Book, BIOS 92.3748.768 05.04.2021
[=C2=A0 294.673765] Call Trace:
[=C2=A0 294.673771]=C2=A0 dump_stack_lvl+0x4a/0x5f
[=C2=A0 294.673784]=C2=A0 dump_stack+0x10/0x12
[=C2=A0 294.673792]=C2=A0 ubsan_epilogue+0x9/0x50
[=C2=A0 294.673798]=C2=A0 __ubsan_handle_out_of_bounds+0x6f/0x80
[=C2=A0 294.673805]=C2=A0 acpi_ds_exec_end_op+0x1a0/0x79a
[=C2=A0 294.673812]=C2=A0 acpi_ps_parse_loop+0x7f5/0x8cc
[=C2=A0 294.673820]=C2=A0 acpi_ps_parse_aml+0x1bb/0x55d
[=C2=A0 294.673828]=C2=A0 acpi_ps_execute_method+0x20f/0x2d1
[=C2=A0 294.673836]=C2=A0 acpi_ns_evaluate+0x34d/0x4ef
[=C2=A0 294.673841]=C2=A0 acpi_evaluate_object+0x210/0x3da
[=C2=A0 294.673848]=C2=A0 acpi_evaluate_dsm+0xaa/0x120
[=C2=A0 294.673857]=C2=A0 ? flush_workqueue+0x19b/0x3e0
[=C2=A0 294.673864]=C2=A0 acpi_sleep_run_lps0_dsm+0x5a/0xc0
[=C2=A0 294.673873]=C2=A0 acpi_s2idle_restore_early+0x62/0x110
[=C2=A0 294.673881]=C2=A0 ? acpi_s2idle_restore_early+0x62/0x110
[=C2=A0 294.673887]=C2=A0 suspend_devices_and_enter+0x2a1/0x800
[=C2=A0 294.673895]=C2=A0 pm_suspend+0x2e5/0x420
[=C2=A0 294.673900]=C2=A0 state_store+0x85/0xf0
[=C2=A0 294.673905]=C2=A0 kobj_attr_store+0x12/0x20
[=C2=A0 294.673913]=C2=A0 sysfs_kf_write+0x3c/0x50
[=C2=A0 294.673921]=C2=A0 kernfs_fop_write_iter+0x13c/0x1b0
[=C2=A0 294.673927]=C2=A0 new_sync_write+0x117/0x1b0
[=C2=A0 294.673937]=C2=A0 vfs_write+0x1ea/0x250
[=C2=A0 294.673945]=C2=A0 ksys_write+0xa7/0xe0
[=C2=A0 294.673953]=C2=A0 __x64_sys_write+0x1a/0x20
[=C2=A0 294.673961]=C2=A0 do_syscall_64+0x5b/0xb0
[=C2=A0 294.673967]=C2=A0 ? syscall_exit_to_user_mode+0x2a/0x40
[=C2=A0 294.673974]=C2=A0 ? do_syscall_64+0x67/0xb0
[=C2=A0 294.673979]=C2=A0 ? do_syscall_64+0x67/0xb0
[=C2=A0 294.673983]=C2=A0 ? asm_exc_page_fault+0x8/0x30
[=C2=A0 294.673992]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xae
[=C2=A0 294.674000] RIP: 0033:0x7fdd5072c1e7
[=C2=A0 294.674007] Code: 64 89 02 48 c7 c0 ff ff ff ff eb bb 0f 1f 80 00 0=
0 =

00 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f =

05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
[=C2=A0 294.674012] RSP: 002b:00007fffdcfda2b8 EFLAGS: 00000246 ORIG_RAX: =

0000000000000001
[=C2=A0 294.674019] RAX: ffffffffffffffda RBX: 0000000000000004 RCX: =

00007fdd5072c1e7
[=C2=A0 294.674023] RDX: 0000000000000004 RSI: 00007fffdcfda370 RDI: =

0000000000000004
[=C2=A0 294.674026] RBP: 00007fffdcfda370 R08: 0000000000000004 R09: =

000000000000000d
[=C2=A0 294.674029] R10: 0000560dbe6e1128 R11: 0000000000000246 R12: =

0000000000000004
[=C2=A0 294.674032] R13: 0000560dc03a72d0 R14: 0000000000000004 R15: =

00007fdd508078a0
[=C2=A0 294.674038] =

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D


Best regards,

Oliver


--===============7456959124614446614==--

