Content-Type: multipart/mixed; boundary="===============6803360794443426589=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [signal] 4bad58ebc8: will-it-scale.per_thread_ops -3.3% regression
Date: Fri, 30 Apr 2021 10:57:20 +0200
Message-ID: <874kfof8un.ffs@nanos.tec.linutronix.de>
In-Reply-To: <20210430081359.GB79529@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6803360794443426589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Feng,

On Fri, Apr 30 2021 at 16:13, Feng Tang wrote:
> On Tue, Apr 20, 2021 at 11:08:37AM +0800, kernel test robot wrote:
>> commit: =

>>   69995ebbb9 ("signal: Hand SIGQUEUE_PREALLOC flag to __sigqueue_alloc()=
")
>>   4bad58ebc8 ("signal: Allow tasks to cache one sigqueue struct")
>> =

>> 69995ebbb9d37173 4bad58ebc8bc4f20d89cff95417 =

>> ---------------- --------------------------- =

>>          %stddev     %change         %stddev
>>              \          |                \  =

>>  1.273e+09            -3.3%  1.231e+09        will-it-scale.192.threads
>>    6630224            -3.3%    6409738        will-it-scale.per_thread_o=
ps
>>  1.273e+09            -3.3%  1.231e+09        will-it-scale.workload
>
> We've double checked this, and it seems to be another case of
> the code alignment change caused regression change, just like
> the other case we debugged " [genirq]  cbe16f35be:
> will-it-scale.per_thread_ops -5.2% regression" =

>
> https://lore.kernel.org/lkml/20210428050758.GB52098(a)shbuild999.sh.intel=
.com/
>
> With the same debug patch of forcing function address 64 bytes
> aligned, then commit 4bad58ebc8 will bring no change on this case. =

>
> commit 09c60546f04f "./Makefile: add debug option to enable function
> aligned on 32 bytes" only forced 32 bytes align, with thinking 64B
> align will occupy more code space, and affect iTLB more. Maybe we
> should just extend it to 64B align, as it is for debug only anyway. =


thanks for the heads up!

But why is this restricted to debug mode?

The fact that adding a few bytes of text causes regressions in unrelated
code is not restricted to debug or am I missing something here?

Thanks,

        tglx
--===============6803360794443426589==--

