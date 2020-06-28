Content-Type: multipart/mixed; boundary="===============8428596312269040036=="
MIME-Version: 1.0
From: Yonghong Song <yhs@fb.com>
To: lkp@lists.01.org
Subject: Re: [bpf] will-it-scale.per_thread_ops 2.6% improvement
Date: Sat, 27 Jun 2020 23:06:51 -0700
Message-ID: <8b8e0e02-0f2c-17ca-9d1d-3601a9520da2@fb.com>
In-Reply-To: <20200627082222.GG5535@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8428596312269040036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 6/27/20 1:22 AM, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a 2.6% improvement of will-it-scale.per_thread_ops due to=
 commit:

Thanks. The improvement is always good although I do not know
what will-it-scale.per_thread_ops exactly running.

But I think the commit
    492e639f0c222784e2e0f121966375f641c61b15 ("bpf: Add bpf_seq_printf =

and bpf_seq_write helpers")
probably not the reason for the improvement. This patch just add bpf =

helpers and they should not be called in normal user codes.

If you want to identify which commit is responsible for the improvement,
you probably want to double check.

> =

> =

> commit: 492e639f0c222784e2e0f121966375f641c61b15 ("bpf: Add bpf_seq_print=
f and bpf_seq_write helpers")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: will-it-scale
> on test machine: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz wit=
h 80G memory
> with following parameters:
> =

> 	nr_task: 100%
> 	mode: thread
> 	test: pthread_mutex2
> 	cpufreq_governor: performance
> 	ucode: 0x11
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
> =

> In addition to that, the commit also has significant impact on the follow=
ing tests:
> =

> +------------------+-----------------------------------------------------=
-----------------+
> | testcase: change | will-it-scale: will-it-scale.per_process_ops 2.5% im=
provement        |
> | test machine     | 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz=
 with 80G memory |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                   |
> |                  | mode=3Dprocess                                      =
                   |
> |                  | nr_task=3D100%                                      =
                   |
> |                  | test=3Dmalloc2                                      =
                   |
> |                  | ucode=3D0x11                                        =
                   |
> +------------------+-----------------------------------------------------=
-----------------+
> =

> =

> =

> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> To reproduce:
> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install job.yaml  # job file is attached in this email
>          bin/lkp run     job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/tes=
tcase/ucode:
>    gcc-7/performance/x86_64-rhel-7.6/thread/100%/debian-x86_64-20191114.c=
gz/lkp-knm01/pthread_mutex2/will-it-scale/0x11
> =

> commit:
>    b121b341e5 ("bpf: Add PTR_TO_BTF_ID_OR_NULL support")
>    492e639f0c ("bpf: Add bpf_seq_printf and bpf_seq_write helpers")
> =

> b121b341e5983bdc 492e639f0c222784e2e0f121966
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>     6105969            +2.6%    6265564        will-it-scale.per_thread_o=
ps
>        9855         +1196.5%     127775 =C2=B1 92%  will-it-scale.time.ma=
ximum_resident_set_size
>   1.759e+09            +2.6%  1.804e+09        will-it-scale.workload
[...]
> =

> =

> *************************************************************************=
**************************
> lkp-knm01: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz with 80G =
memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/tes=
tcase/ucode:
>    gcc-9/performance/x86_64-rhel-7.6/thread/100%/debian-x86_64-20191114.c=
gz/lkp-knm01/context_switch1/will-it-scale/0x11
> =

> commit:
>    b121b341e5 ("bpf: Add PTR_TO_BTF_ID_OR_NULL support")
>    492e639f0c ("bpf: Add bpf_seq_printf and bpf_seq_write helpers")
> =

> b121b341e5983bdc 492e639f0c222784e2e0f121966
> ---------------- ---------------------------
>         fail:runs  %reproduction    fail:runs
>             |             |             |
>            2:2         -100%            :2     dmesg.WARNING:at#for_ip_sw=
apgs_restore_regs_and_return_to_usermode/0x
>            2:2         -100%            :2     dmesg.WARNING:stack_recurs=
ion
> =

> =

> =

> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> =

> Thanks,
> Rong Chen
>=20
--===============8428596312269040036==--

