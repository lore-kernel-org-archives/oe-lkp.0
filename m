Content-Type: multipart/mixed; boundary="===============4747591093896731844=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [objtool, x86] 134ab5bd18: leaking-addresses.proc..retpoline_sites.
Date: Fri, 12 Nov 2021 10:40:19 +0100
Message-ID: <YY42gxWhYNkAsB+7@hirez.programming.kicks-ass.net>
In-Reply-To: <20211112055935.GA19820@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4747591093896731844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 12, 2021 at 01:59:35PM +0800, Oliver Sang wrote:
> hi Peter Zijlstra,
> =

> On Fri, Nov 05, 2021 at 01:55:09PM +0100, Peter Zijlstra wrote:
> > On Fri, Nov 05, 2021 at 02:02:04PM +0800, kernel test robot wrote:
> > > =

> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed the following commit (built with gcc-9):
> > > =

> > > commit: 134ab5bd1883312d7a4b3033b05c6b5a1bb8889b ("objtool,x86: Repla=
ce alternatives with .retpoline_sites")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > > =

> > > in testcase: leaking-addresses
> > > version: leaking-addresses-x86_64-4f19048-1_20211101
> > > with following parameters:
> > > =

> > > 	ucode: 0x28
> > > =

> > > =

> > > =

> > > on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ =
3.40GHz with 16G memory
> > > =

> > > caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> > > =

> > > =

> > > =

> > > =

> > > If you fix the issue, kindly add following tag
> > =

> > What issue ?!? I'm not at all sure what this thing is trying to tell me.
> =

> we reported this due to, by running scripts/leaking_addresses.pl upon this
> commit and its parent, we found one new item appear in leaking-addresses
> report for this commit, such like:
> =

> [31 .retpoline_sites] 0xffffffffc009a1df
> =

> in a quite persistent way (always on this commit, but never show in paren=
t):
> =

> c509331b41b7365e 134ab5bd1883312d7a4b3033b05
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>           4:6           33%           6:6     leaking-addresses.dmesg.map=
pedIOAPICto_fec00000
>            :6          100%           6:6     leaking-addresses.proc..ret=
poline_sites.   <--------
>            :6           50%           3:6     leaking-addresses.proc.modu=
les.btrfs17162241-Live
>           1:6          -17%            :6     leaking-addresses.proc.modu=
les.btrfs17203201-Live
> =

> we even tried more now and still persistent.
> =

> and since we also noticed it is mentioned
>   "Replace alternatives with .retpoline_sites"
> in this commit, so we thought it's relevant.

Well, that commit creates the section, but I'm not at all sure how that
would consititute a leak, and this script output is sodding useless at
telling me.

Kees, do you have any clue what that script is on about?

> =

> however, there is not a simple output from 'diff' for leaking-addresses r=
eports
> between this commit and parent (both attached), so if we misunderstand
> something, could you give us some guidance? Thanks
> =

> also attached dmesg for both parent and this commit FYI

> 2021-11-02 15:30:16 ./leaking_addresses.pl --output-raw result/scan.out
> 2021-11-02 15:30:34 ./leaking_addresses.pl --input-raw result/scan.out --=
squash-by-filename
> =

> Total number of results from scan (incl dmesg): 156272
> =

> dmesg output:
> [    1.884543] mapped IOAPIC to ffffffffff5fb000 (fec00000)
> =

> Results squashed by filename (excl dmesg). Displaying [<number of results=
> <filename>], <example result>
> [2 _ftrace_eval_map] 0xffffffffc067d0e8
> [43 .orc_unwind_ip] 0xffffffffc0090616
> [6 __tracepoints_ptrs] 0xffffffffc00e91b4
> [345 blacklist] 0xffffffff81e00880-0xffffffff81e008a0	asm_exc_overflow
> [15 __dyndbg] 0xffffffffc00920c8
> [43 .gnu.linkonce.this_module] 0xffffffffc0092140
> [2 .noinstr.text] 0xffffffffc02d6d00
> [12 __ksymtab_gpl] 0xffffffffc039d054
> [43 .note.gnu.build-id] 0xffffffffc0090000
> [29 .text.unlikely] 0xffffffffc008fc5c
> [2 .rodata.cst16.bswap_mask] 0xffffffffc0195090
> [22 __bug_table] 0xffffffffc0079070
> [34 .data] 0xffffffffc0092000
> [1 _error_injection_whitelist] 0xffffffffc0682b40
> [35 .rodata.str1.1] 0xffffffffc00900ac
> [1 wchan] 0xffffc9000002fe48/sys/kernel/debug/kprobes/blacklist: 0xffffff=
ff81e00860-0xffffffff81e00880	asm_exc_divide_error
> [4 .altinstr_aux] 0xffffffffc02d6c37
> [6 _ftrace_events] 0xffffffffc00edaa0
> [6 __tracepoints] 0xffffffffc00edbe0
> [19 __ksymtab] 0xffffffffc009a054
> [154748 kallsyms] ffffffff81000000 T startup_64
> [34 .rodata] 0xffffffffc00902c0
> [10 __ex_table] 0xffffffffc01fa140
> [17 __param] 0xffffffffc0090378
> [43 .text] 0xffffffffc008f000
> [43 modules] ipmi_devintf 20480 0 - Live 0xffffffffc0076000
> [28 .bss] 0xffffffffc00924c0
> [43 .orc_unwind] 0xffffffffc00903a0
> [1 .rodata.cst16.mask2] 0xffffffffc0160100
> [6 __bpf_raw_tp_map] 0xffffffffc00eda40
> [43 .note.Linux] 0xffffffffc0090024
> [31 .retpoline_sites] 0xffffffffc009a1df
> [33 .rodata.str1.8] 0xffffffffc0090180
> [9 .data.once] 0xffffffffc01d0638
> [6 __tracepoints_strings] 0xffffffffc00e91c0
> [24 __ksymtab_strings] 0xffffffffc009a060
> [43 .symtab] 0xffffffffc0106000
> [1 ___srcu_struct_ptrs] 0xffffffffc0425ca8
> [18 .altinstructions] 0xffffffffc039ddf4
> [20 __jump_table] 0xffffffffc0091000
> [1 .data..cacheline_aligned] 0xffffffffc09aba40
> [43 .strtab] 0xffffffffc0106ba0
> [6 .ref.data] 0xffffffffc00edac0
> [32 .init.text] 0xffffffffc0104000
> [6 .fixup] 0xffffffffc00ab396
> [149 printk_formats] 0xffffffff8253db85 : "CPU_ON"
> [1 .rodata.cst16.mask1] 0xffffffffc01600f0
> [5 .init.data] 0xffffffffc009f000
> [6 .static_call.text] 0xffffffffc00dfb44
> [10 .data..read_mostly] 0xffffffffc0092100
> [13 .parainstructions] 0xffffffffc039ddd8
> [42 __mcount_loc] 0xffffffffc0090054
> [18 .altinstr_replacement] 0xffffffffc039ccb7
> [29 .exit.text] 0xffffffffc008fd1d
> [23 .smp_locks] 0xffffffffc00902b4
> [1 .rodata.cst32.byteshift_table] 0xffffffffc0160120
> [7 .static_call_sites] 0xffffffffc067f208
> [8 .init.rodata] 0xffffffffc0105000

> 2021-11-02 15:48:44 ./leaking_addresses.pl --output-raw result/scan.out
> 2021-11-02 15:49:02 ./leaking_addresses.pl --input-raw result/scan.out --=
squash-by-filename
> =

> Total number of results from scan (incl dmesg): 156254
> =

> dmesg output:
> [    1.885012] mapped IOAPIC to ffffffffff5fb000 (fec00000)
> =

> Results squashed by filename (excl dmesg). Displaying [<number of results=
> <filename>], <example result>
> [43 .orc_unwind_ip] 0xffffffffc007c616
> [23 .smp_locks] 0xffffffffc007c2b4
> [1 .rodata.cst32.byteshift_table] 0xffffffffc01ba120
> [9 .data.once] 0xffffffffc0221638
> [29 .exit.text] 0xffffffffc007bd1d
> [1 _error_injection_whitelist] 0xffffffffc0ad2b40
> [1 ___srcu_struct_ptrs] 0xffffffffc03fc2f8
> [42 __mcount_loc] 0xffffffffc007c054
> [15 __dyndbg] 0xffffffffc007e0c8
> [6 .fixup] 0xffffffffc0089396
> [13 .parainstructions] 0xffffffffc019bdd8
> [17 __param] 0xffffffffc007c378
> [43 .note.gnu.build-id] 0xffffffffc007c000
> [32 .init.text] 0xffffffffc0081000
> [6 .static_call.text] 0xffffffffc00dfb44
> [43 .symtab] 0xffffffffc0083000
> [149 printk_formats] 0xffffffff8253db85 : "CPU_ON"
> [29 .text.unlikely] 0xffffffffc007bc5c
> [10 __ex_table] 0xffffffffc006e140
> [20 __jump_table] 0xffffffffc007d000
> [6 __tracepoints_ptrs] 0xffffffffc00e93ec
> [8 .init.rodata] 0xffffffffc0082000
> [6 __bpf_raw_tp_map] 0xffffffffc00eda40
> [43 modules] btrfs 1720320 1 - Live 0xffffffffc0968000
> [22 __bug_table] 0xffffffffc00a6070
> [12 __ksymtab_gpl] 0xffffffffc019b054
> [18 .altinstr_replacement] 0xffffffffc019acb7
> [43 .text] 0xffffffffc007b000
> [7 .static_call_sites] 0xffffffffc0acf208
> [2 .rodata.cst16.bswap_mask] 0xffffffffc0059090
> [1 wchan] 0xffffc9000002fe48/proc/1/task/1/wchan: 0xffffc9000002fe48/sys/=
kernel/debug/kprobes/blacklist: 0xffffffff81e00860-0xffffffff81e00880	asm_e=
xc_divide_error
> [1 .data..cacheline_aligned] 0xffffffffc090aa40
> [4 .altinstr_aux] 0xffffffffc049ec37
> [2 _ftrace_eval_map] 0xffffffffc0acd0e8
> [35 .rodata.str1.1] 0xffffffffc007c0ac
> [28 .bss] 0xffffffffc007e4c0
> [154746 kallsyms] ffffffff81000000 T startup_64
> [1 .rodata.cst16.mask2] 0xffffffffc01ba100
> [6 __tracepoints_strings] 0xffffffffc00e9400
> [34 .data] 0xffffffffc007e000
> [19 __ksymtab] 0xffffffffc0321054
> [1 .rodata.cst16.mask1] 0xffffffffc01ba0f0
> [6 __tracepoints] 0xffffffffc00edbe0
> [2 .noinstr.text] 0xffffffffc049ed00
> [33 .rodata.str1.8] 0xffffffffc007c180
> [10 .data..read_mostly] 0xffffffffc007e100
> [43 .strtab] 0xffffffffc0083ba0
> [43 .note.Linux] 0xffffffffc007c024
> [24 __ksymtab_strings] 0xffffffffc0321060
> [33 .altinstructions] 0xffffffffc03211df
> [345 blacklist] 0xffffffff81e00880-0xffffffff81e008a0	asm_exc_overflow
> [43 .orc_unwind] 0xffffffffc007c3a0
> [5 .init.data] 0xffffffffc025f000
> [6 _ftrace_events] 0xffffffffc00edaa0
> [34 .rodata] 0xffffffffc007c2c0
> [6 .ref.data] 0xffffffffc00edac0
> [43 .gnu.linkonce.this_module] 0xffffffffc007e140



--===============4747591093896731844==--

