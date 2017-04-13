Content-Type: multipart/mixed; boundary="===============0822684206383600650=="
MIME-Version: 1.0
From: Jiri Olsa <jolsa@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/intel_rdt] 4ffa3c977b: OSError: [Errno 20] Not a directory: '/sys/fs/resctrl/cpus_list/'
Date: Thu, 13 Apr 2017 09:42:16 +0200
Message-ID: <20170413074216.GA4784@krava>
In-Reply-To: <20170413030551.GI16549@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0822684206383600650==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2017 at 11:05:51AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: 4ffa3c977b5da2907eb294dc6d0259a02f2284aa ("x86/intel_rdt: Add cpu=
s_list rdtgroup file")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: cat
> with following parameters:
> =

> =

> =

> =

> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wit=
h 48G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> user  :err   : [   71.140457] Traceback (most recent call last):
> user  :err   : [   71.142073]   File "width_and_depth_tests.py", line 85,=
 in <module>
> user  :err   : [   71.142539]     depth_test()
> user  :err   : [   71.144305]   File "width_and_depth_tests.py", line 63,=
 in depth_test
> user  :err   : [   71.144834]     os.chdir(path)
> user  :err   : [   71.146880] OSError: [Errno 20] Not a directory: '/sys/=
fs/resctrl/cpus_list/'
> user  :err   : [   71.147966] failed to run width_and_depth_tests.py

hi,
looks like you need to fix the test.. there's one more new file 'cpus_list'=
 now

thanks,
jirka

--===============0822684206383600650==--

