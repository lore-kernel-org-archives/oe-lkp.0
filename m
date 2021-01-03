Content-Type: multipart/mixed; boundary="===============7275247782147075228=="
MIME-Version: 1.0
From: Helge Deller <deller@gmx.de>
To: lkp@lists.01.org
Subject: Re: [proc/wchan] 30a3a19273: leaking-addresses.proc.wchan./proc/bus/input/devices:B:KEY=1000000000007ff980000000007fffebeffdfffeffffffffffffffffffffe
Date: Sun, 03 Jan 2021 19:25:36 +0100
Message-ID: <d15378c8-8702-47ba-65b7-450f728793ed@gmx.de>
In-Reply-To: <20210103142726.GC30643@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7275247782147075228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1/3/21 3:27 PM, kernel test robot wrote:
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 30a3a192730a997bc4afff5765254175b6fb64f3 ("[PATCH] proc/wchan: Us=
e printk format instead of lookup_symbol_name()")
> url: https://github.com/0day-ci/linux/commits/Helge-Deller/proc-wchan-Use=
-printk-format-instead-of-lookup_symbol_name/20201218-010048
> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git 091=
62bc32c880a791c6c0668ce0745cf7958f576
>
> in testcase: leaking-addresses
> version: leaking-addresses-x86_64-4f19048-1_20201111
> with following parameters:
>
> 	ucode: 0xde
>
>
>
> on test machine: 4 threads Intel(R) Core(TM) i7-7567U CPU @ 3.50GHz with =
32G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

I don't see anything wrong with the wchan patch (30a3a192730a997bc4afff5765=
254175b6fb64f3),
or that it could have leaked anything.

Maybe the kernel test robot picked up the wchan patch by mistake ?

Helge


>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
> 2021-01-01 01:52:25 ./leaking_addresses.pl --output-raw result/scan.out
> 2021-01-01 01:52:49 ./leaking_addresses.pl --input-raw result/scan.out --=
squash-by-filename
>
> Total number of results from scan (incl dmesg): 156538
>
> dmesg output:
> [    0.058490] mapped IOAPIC to ffffffffff5fb000 (fec00000)
>
> Results squashed by filename (excl dmesg). Displaying [<number of results=
> <filename>], <example result>
> [1 _error_injection_whitelist] 0xffffffffc0a254b0
> [25 __bug_table] 0xffffffffc01e0070
> [46 .orc_unwind_ip] 0xffffffffc009f3a0
> [6 __tracepoints_strings] 0xffffffffc027d7d0
> [50 .strtab] 0xffffffffc00b9b88
> [1 .rodata.cst16.mask2] 0xffffffffc00a70e0
> [1 key] 1000000000007 ff980000000007ff febeffdfffefffff fffffffffffffffe
> [50 .note.Linux] 0xffffffffc009f024
> [41 .data] 0xffffffffc00a1000
> [6 .static_call.text] 0xffffffffc0274b44
> [1 _ftrace_eval_map] 0xffffffffc0a20148
> [10 .data.once] 0xffffffffc04475b4
> [7 .static_call_sites] 0xffffffffc0a22088
> [6 __tracepoints_ptrs] 0xffffffffc027d7bc
> [7 .fixup] 0xffffffffc00852ea
> [49 __mcount_loc] 0xffffffffc009f03c
> [19 __param] 0xffffffffc009f378
> [38 .rodata.str1.8] 0xffffffffc009f170
> [1 ___srcu_struct_ptrs] 0xffffffffc0355000
> [14 .altinstr_replacement] 0xffffffffc04349ca
> [154936 kallsyms] ffffffff81000000 T startup_64
> [50 .gnu.linkonce.this_module] 0xffffffffc00a1140
> [24 __ksymtab_strings] 0xffffffffc00e2048
> [31 .bss] 0xffffffffc00a1500
> [42 .rodata.str1.1] 0xffffffffc009f09c
> [9 .init.rodata] 0xffffffffc00b8000
> [11 __ex_table] 0xffffffffc00bd128
> [14 .parainstructions] 0xffffffffc03b5d88
> [6 __tracepoints] 0xffffffffc02818c0
> [1 .rodata.cst16.mask1] 0xffffffffc00a70d0
> [18 __dyndbg] 0xffffffffc00a10c8
> [5 .altinstr_aux] 0xffffffffc0143a49
> [22 .smp_locks] 0xffffffffc009f094
> [2 .rodata.cst16.bswap_mask] 0xffffffffc005e070
> [40 .init.text] 0xffffffffc00b7000
> [4 .init.data] 0xffffffffc00e7000
> [10 .data..read_mostly] 0xffffffffc00a1100
> [14 .altinstructions] 0xffffffffc0446846
> [6 __bpf_raw_tp_map] 0xffffffffc0281720
> [50 .note.gnu.build-id] 0xffffffffc009f000
> [6 _ftrace_events] 0xffffffffc0281780
> [140 printk_formats] 0xffffffff82341767 : "CPU_ON"
> [25 __jump_table] 0xffffffffc00a0000
> [37 .exit.text] 0xffffffffc009ec70
> [50 .text] 0xffffffffc009e000
> [35 .text.unlikely] 0xffffffffc009ebaf
> [18 __ksymtab] 0xffffffffc00e203c
> [46 .orc_unwind] 0xffffffffc009f544
> [1 .data..cacheline_aligned] 0xffffffffc081d8c0
> [2 .noinstr.text] 0xffffffffc04b8d00
> [1 uevent] KEY=3D1000000000007 ff980000000007ff febeffdfffefffff ffffffff=
fffffffe
> [50 modules] netconsole 20480 0 - Live 0xffffffffc00cb000
> [337 blacklist] 0xffffffff81c00880-0xffffffff81c008a0	asm_exc_overflow
> [1 .rodata.cst32.byteshift_table] 0xffffffffc00a7100
> [2 wchan] 0xffffc9000000003c/proc/bus/input/devices: B: KEY=3D10000000000=
07 ff980000000007ff febeffdfffefffff fffffffffffffffe
> [6 .ref.data] 0xffffffffc02817a0
> [14 __ksymtab_gpl] 0xffffffffc03b503c
> [42 .rodata] 0xffffffffc009f2c0
> [50 .symtab] 0xffffffffc00b9000
>
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
>
>
> Thanks,
> Oliver Sang
>

--===============7275247782147075228==--

