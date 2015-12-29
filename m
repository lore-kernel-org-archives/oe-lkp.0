Content-Type: multipart/mixed; boundary="===============0378064198883645570=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86,vdso] 6c5548f6d7: autotest.signaltest.fail
Date: Tue, 29 Dec 2015 05:15:56 -0800
Message-ID: <CALCETrVpEmE4ZOqocbs5u7B7tkKYAhNV8-j_-OamMYadTuXnyw@mail.gmail.com>
In-Reply-To: <8760zivta4.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0378064198883645570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 28, 2015 at 7:16 PM, kernel test robot
<ying.huang@linux.intel.com> wrote:
> FYI, we noticed the below changes on
>
> https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/vdso
> commit 6c5548f6d716edd2e88add5e7826d15acae30108 ("x86,vdso: Use .fault in=
stead of remap_pfn_range for the vvar mapping")

Nice catch!

I haven't reproduced this, but I think it's a race, and I updated the
branch with a fix.

--Andy

>
>
> 2015-12-28 18:41:40 client/autotest-local run signaltest
> 18:41:40 INFO | Writing results to /lkp/benchmarks/autotest/client/result=
s/default
> 18:41:40 ERROR| Could not determine initlevel, assuming 2
> 18:41:40 INFO | START   ----    ----    timestamp=3D1451299300    localti=
me=3DDec 28 18:41:40
> 18:41:40 INFO |         START   signaltest      signaltest      timestamp=
=3D1451299300    localtime=3DDec 28 18:41:40
> 18:41:41 WARNI| Could not find GDB installed. Crash handling will operate=
 with limited functionality
> 18:41:41 ERROR| [stderr] signaltest.c: In function 'signalthread':
> 18:41:41 ERROR| [stderr] signaltest.c:133:27: warning: null argument wher=
e non-null required (argument 1) [-Wnonnull]
> 18:41:41 ERROR| [stderr]     gettimeofday(0,(struct timezone *)1);
> 18:41:41 ERROR| [stderr]                            ^
> 18:41:41 ERROR| [stderr] signaltest.c:179:5: warning: null argument where=
 non-null required (argument 1) [-Wnonnull]
> 18:41:41 ERROR| [stderr]      gettimeofday(0,0);
> 18:41:41 ERROR| [stderr]      ^
> 18:41:41 ERROR| Exception escaping from test:
> Traceback (most recent call last):
>   File "/lkp/benchmarks/autotest/client/shared/test.py", line 411, in _ex=
ec
>     _call_test_function(self.execute, *p_args, **p_dargs)
>   File "/lkp/benchmarks/autotest/client/shared/test.py", line 823, in _ca=
ll_test_function
>     return func(*args, **dargs)
>   File "/lkp/benchmarks/autotest/client/tests/signaltest/signaltest.py", =
line 19, in execute
>     utils.system(self.srcdir + '/signaltest ' + args)
>   File "/lkp/benchmarks/autotest/client/shared/utils.py", line 1230, in s=
ystem
>     verbose=3Dverbose).exit_status
>   File "/lkp/benchmarks/autotest/client/shared/utils.py", line 916, in run
>     "Command returned non-zero exit status")
> CmdError: Command </lkp/benchmarks/autotest/client/tmp/signaltest/src/sig=
naltest -t 10 -l 100000> failed, rc=3D-7, Command returned non-zero exit st=
atus
> * Command:
>     /lkp/benchmarks/autotest/client/tmp/signaltest/src/signaltest -t 10 -l
>     100000
> Exit status: -7
> Duration: 0.0431470870972
>
> 18:41:41 WARNI| Programs crashed during test execution
> 18:41:41 WARNI| Please verify /lkp/benchmarks/autotest/client/results/def=
ault/signaltest/debug/crash.signaltest.814 for more info
> 18:41:41 INFO | System log file not found (looked for ['/var/log/messages=
', '/var/log/syslog'])
> 18:41:41 ERROR| child process failed
> 18:41:41 INFO |                 ERROR   signaltest      signaltest      t=
imestamp=3D1451299301    localtime=3DDec 28 18:41:41       Command </lkp/be=
nchmarks/autotest/client/tmp/signaltest/src/signaltest -t 10 -l 100000> fai=
led, rc=3D-7, Command returned non-zero exit status
>   * Command:
>       /lkp/benchmarks/autotest/client/tmp/signaltest/src/signaltest -t 10=
 -l
>       100000
>   Exit status: -7
>   Duration: 0.0431470870972
>
> 18:41:41 INFO |         END ERROR       signaltest      signaltest      t=
imestamp=3D1451299301    localtime=3DDec 28 18:41:41
> 18:41:41 INFO | END GOOD        ----    ----    timestamp=3D1451299301   =
 localtime=3DDec 28 18:41:41
> 18:41:41 INFO | Report successfully generated at /lkp/benchmarks/autotest=
/client/results/default/job_report.html
>
>
>
> To reproduce:
>
>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
>
>
> Thanks,
> Ying Huang



-- =

Andy Lutomirski
AMA Capital Management, LLC

--===============0378064198883645570==--

