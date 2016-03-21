Content-Type: multipart/mixed; boundary="===============3122031331289078938=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/tlb] ff9b625d26: stderr.Run:"Process_Creation":Fork_failed_at_iteration in unixbench test
Date: Mon, 21 Mar 2016 12:43:58 +0800
Message-ID: <20160321044358.GA30910@yexl-desktop>
In-Reply-To: <56EC1068.6020405@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3122031331289078938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2016 at 10:27:52PM +0800, Alex Shi wrote:
>
>Hi Xiaolong,
>
>I tried this benchmark on my native haswell box, but it works. and get
>unstable/better performance value.
>This patch may be has some problem when it run in guest OS.
>Did you run the case on a guest OS or a native OS?

Hi, Alex

The unixbench is launched on a native OS.
>
>Any other benchmark did you test on any other machine? If so, what's the
>result you get?

So far, we have just found issues with unixbench on two Ivy Bridge
machine.

Thanks,
Xiaolong.
>
>Regards
>Alex
>
>On 03/17/2016 02:00 PM, kernel test robot wrote:
>> FYI, we noticed stderr.Run:"Process_Creation":Fork_failed_at_iteration i=
n unixbench test on
>> =

>> https://github.com/alexshi/power-scheduling.git x86-tlb
>> commit ff9b625d26ba7750745d235dc6f1792fb36fea48 ("x86/tlb: just do tlb f=
lush on one of siblings of SMT")
>> =

>> 2016-03-17 06:04:39 ./Run spawn -c 1
>> =

>>    #    #  #    #  #  #    #          #####   ######  #    #   ####   # =
   #
>>    #    #  ##   #  #   #  #           #    #  #       ##   #  #    #  # =
   #
>>    #    #  # #  #  #    ##            #####   #####   # #  #  #       ##=
####
>>    #    #  #  # #  #    ##            #    #  #       #  # #  #       # =
   #
>>    #    #  #   ##  #   #  #           #    #  #       #   ##  #    #  # =
   #
>>     ####   #    #  #  #    #          #####   ######  #    #   ####   # =
   #
>> =

>>    Version 5.1.3                      Based on the Byte Magazine Unix Be=
nchmark
>> =

>>    Multi-CPU version                  Version 5 revisions by Ian Smith,
>>                                       Sunnyvale, CA, USA
>>    January 13, 2011                   johantheghost at yahoo period com
>> =

>> =

>> 1 x Process Creation  1
>> =

>> =

>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcas=
e:
>>   gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/lkp-ivb=
-d02/spawn/unixbench
>> =

>> commit: =

>>   v4.5
>>   ff9b625d26ba7750745d235dc6f1792fb36fea48
>> =

>>             v4.5 ff9b625d26ba7750745d235dc6 =

>> ---------------- -------------------------- =

>>        fail:runs  %reproduction    fail:runs
>>            |             |             |    =

>>            :4          100%           4:4     last_state.failed
>>            :4          100%           4:4     last_state.is_incomplete_r=
un
>>            :4          100%           4:4     last_state.unixbench.exit_=
code.1
>>            :4          100%           4:4     stderr.*******************=
***************************
>>            :4           50%           2:4     stderr.Reason:Success;abor=
ting
>>            :4          100%           4:4     stderr.Run:"Process_Creati=
on":Fork_failed_at_iteration
>>            :4           50%           2:4     stderr.Segmentation_fault;=
aborting
>> =

>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcas=
e:
>>   gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/lkp-ivb=
-d04/spawn/unixbench
>> =

>> commit: =

>>   v4.5
>>   ff9b625d26ba7750745d235dc6f1792fb36fea48
>> =

>>             v4.5 ff9b625d26ba7750745d235dc6 =

>> ---------------- -------------------------- =

>>        fail:runs  %reproduction    fail:runs
>>            |             |             |    =

>>            :8          100%           8:8     last_state.failed
>>            :8          100%           8:8     last_state.is_incomplete_r=
un
>>            :8          100%           8:8     last_state.unixbench.exit_=
code.1
>>            :8          100%           8:8     stderr.*******************=
***************************
>>            :8           12%           1:8     stderr.Aborted;aborting
>>            :8           62%           5:8     stderr.Reason:Success;abor=
ting
>>            :8           75%           6:8     stderr.Run:"Process_Creati=
on":Fork_failed_at_iteration
>>            :8           12%           1:8     stderr.Run:"Process_Creati=
on":Segmentation_fault;aborting
>>            :8           12%           1:8     stderr.Run:"Process_Creati=
on":spawn:../nptl/sysdeps/unix/sysv/linux/x86_64/../fork.c:#:__libc_fork:As=
sertion`({__typeof(({struct_pthread*__self;asm("mov%%fs:%c1,%#":"=3Dr"(__se=
lf):"i"(__builtin_offsetof(struct_pthread,header.self)));__self;})->tid)__v=
alue;if(sizeof(__value)=3D=3D#)asm_volatile("movb%%fs:%P2,%b0":"=3Dq"(__val=
ue):"#"(#),"i"(__builtin_offsetof(struct_pthread,tid)));else_if(sizeof(__va=
lue)=3D=3D#)asm_volatile("movl%%fs:%P1,%#":"=3Dr"(__value):"i"(__builtin_of=
fsetof(struct_pthread,tid)));else{if(sizeof(__value)!=3D#)abort();asm_volat=
ile("movq%%fs:%P1,%q0":"=3Dr"(__value):"i"(__builtin_offsetof(struct_pthrea=
d,tid)));}__value;})=3D=3Dppid'failed
>>            :8           12%           1:8     stderr.Segmentation_fault;=
aborting
>> =

>> lkp-ivb-d02: Ivy Bridge
>> Memory: 8G
>> =

>> lkp-ivb-d04: Ivy Bridge
>> Memory: 4G
>> =

>> =

>> To reproduce:
>> =

>>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-=
tests.git
>>         cd lkp-tests
>>         bin/lkp install job.yaml  # job file is attached in this email
>>         bin/lkp run     job.yaml
>> =

>> =

>> Disclaimer:
>> Results have been estimated based on internal Intel analysis and are pro=
vided
>> for informational purposes only. Any difference in system hardware or so=
ftware
>> design or configuration may affect actual performance.
>> =

>> =

>> Thanks,
>> Xiaolong Ye
>>=20

--===============3122031331289078938==--

